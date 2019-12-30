import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xxxq_flutter/http/HttpManager.dart';
import 'package:xxxq_flutter/http/HttpRequestUrl.dart';
import 'package:xxxq_flutter/http/ResultData.dart';
import 'package:xxxq_flutter/model/OrderListModel.dart';
import 'package:xxxq_flutter/utils/EventBusUtil.dart';
import 'package:xxxq_flutter/widgets/LoadingDialog.dart';
import 'package:xxxq_flutter/widgets/TitleBar.dart';

import 'PhotpGalleryPage.dart';

/**
 * 站长派单详情
 */
class HearderOrderDetailPage extends StatefulWidget {
  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<HearderOrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    bool bangdanHidden = true; //控制是否显示榜单信息  true 不显示，false 显示
    bool btnHidden = true; //控制按钮显示
    bool stateHidden = true; //控制运单进度显示
    var btnShowText = ""; //按钮显示文字
    var stateImageRourse =
        "./images/order_state_1.png"; //默认加载，防止图片地址为空报错，默认加载时 不现实该控件
    final OrderListModelRow rowsBean =
        ModalRoute.of(context).settings.arguments;

    if (null != rowsBean) {
      switch (rowsBean.status) {
        case "0": //取消
          bangdanHidden = true;
          btnHidden = true;
          stateHidden = true;
          break;
        case "1": //未接单
          bangdanHidden = true;
          btnHidden = false;
          stateHidden = true;
          btnShowText = "取消订单";
          break;
        case "2": //已接单未起运
          bangdanHidden = true;
          btnHidden = false;
          stateHidden = false;
          stateImageRourse = "./images/order_state_1.png";
          btnShowText = "取消订单";
          break;
        case "3": //已起运未过磅
          bangdanHidden = true;
          btnHidden = true;
          stateHidden = false;
          stateImageRourse = "./images/order_state_2.png";
          break;
        case "4": //已过磅未确认
          bangdanHidden = false;
          btnHidden = false;
          stateHidden = false;
          btnShowText = "确认";
          stateImageRourse = "./images/order_state_3.png";
          break;
        case "5": //已完成
          bangdanHidden = false;
          btnHidden = true;
          stateHidden = true;
          break;
      }
    }
    //整个界面布局
    Widget pageShow() {
      return Scaffold(
          appBar: TitleBar().backAppbar(context, "订单详情"),
          body: SingleChildScrollView(
              child: Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Column(
              children: <Widget>[
                //显示运单进度
                Offstage(
                  offstage: stateHidden,
                  child: Container(
                      color: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 60.0, top: 20.0, bottom: 20.0, right: 60.0),
                          child: Image.asset(stateImageRourse))),
                ),

                HomeNewItem("压缩站", rowsBean.yszName),
                HomeNewItem("车牌", rowsBean.licensePlate),
                HomeNewItem("运输人", rowsBean.name),
                HomeNewItem("起运时间", rowsBean.jhqysjBiztyd),
                HomeNewItem("焚烧厂", rowsBean.fscmc),
                HomeNewItem("抵达时间", rowsBean.jhddsjBiztyd),
                HomeNewItem("运单号", rowsBean.ydhBiztyd),
                Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    color: Colors.white,
                    padding:
                        EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("备注:",
                                style: TextStyle(color: Colors.black45)),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                              ),
                              child: Text(
                                  null == rowsBean.pdsmBiztyd
                                      ? ""
                                      : rowsBean.pdsmBiztyd,
                                  style: TextStyle(color: Colors.black)),
                            )
                          ],
                        ),
                      ],
                    )),
                //榜单信息详情
                Offstage(
                  offstage: bangdanHidden,
                  child: Column(
                    children: <Widget>[
                      HomeNewItem(
                          "毛重(吨)",
                          null == rowsBean.mzBizgbd
                              ? ""
                              : rowsBean.mzBizgbd.toString()),
                      HomeNewItem(
                          "皮重(吨)",
                          null == rowsBean.pzBizgbd
                              ? ""
                              : rowsBean.pzBizgbd.toString()),
                      HomeNewItem(
                          "净重(吨)",
                          null == rowsBean.jzBizgbd
                              ? ""
                              : rowsBean.jzBizgbd.toString()),
                      showImage(rowsBean),
                    ],
                  ),
                ),
                //取消订单按钮
                Offstage(
                  offstage: btnHidden,
                  child: Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                        height: 40.0,
                        width: 270.0,
                        child: RaisedButton(
                            child: Text(
                              btnShowText,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                            color: Colors.blue,
                            shape: const RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            onPressed: () {
                              if (btnShowText == "取消订单") {
                                sendOrder(rowsBean.idBiztydsjgbd);
                              } else if (btnShowText == "确认") {
                                affirmOrder(rowsBean.idBiztydsjgbd);
                              }
                            }),
                      )),
                ),

                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          )));
    }

    return pageShow();
  }

  Widget showImage(OrderListModelRow rowsBean) {
    if (null == rowsBean.bdtp || rowsBean.bdtp.isEmpty) {
      return Container();
    } else {
      return Container(
          margin: EdgeInsets.only(top: 1.0),
          color: Colors.white,
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("图片:", style: TextStyle(color: Colors.black45)),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20.0, top: 20.0, bottom: 10.0, right: 20.0),
                    child: GestureDetector(
                      child: Image.network(
                        HttpRequestUrl.BASE_URL_OUTER +
                            (null == rowsBean.bdtp ? "" : rowsBean.bdtp),
                        height: 50.0,
                        width: 50.0,
                        fit: BoxFit.fill,
                      ),
                      onTap: () {
                        List photoList = [
                          {
                            'image':
                                HttpRequestUrl.BASE_URL_OUTER + rowsBean.bdtp,
                            'id': '1'
                          },
                        ];
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => PhotpGalleryPage(
                                  photoList: photoList, index: 0),
                            ));
                      },
                    ),
                  )
                ],
              ),
            ],
          ));
    }
  }

  Widget HomeNewItem(String titleName, String value) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 1.0),
        padding: EdgeInsets.only(left: 10.0, right: 5.0),
        height: 45.0,
        child: Row(
          children: <Widget>[
            Text(titleName + ":", style: TextStyle(color: Colors.black45)),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(value, style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  //取消订单
  Future sendOrder(String tydsjgbdId) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new LoadingDialog(
            text: "派单中…",
          );
        });

    var data = {
      "tydsjgbdId": tydsjgbdId, //ID
    };

    ResultData res = await HttpManager.getInstance()
        .get(HttpRequestUrl.URL_CANCEL_ORDER, data);

    Navigator.of(context, rootNavigator: true).pop();

    if (res.isSuccess) {
      Fluttertoast.showToast(msg: "订单取消成功");
      Navigator.of(context).pop();
    } else {
      Fluttertoast.showToast(msg: res.data.toString());
    }
  }

  //确认订单
  Future affirmOrder(String tydsjgbdId) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new LoadingDialog(
            text: "订单确认中…",
          );
        });
    DateTime now = new DateTime.now();

    var data = {
      "idBiztydsjgbd": tydsjgbdId,
      //ID
      "qrsjBiztydsjgbd": now.year.toString() +
          "-" +
          now.month.toString() +
          "-" +
          now.day.toString() +
          " " +
          now.hour.toString() +
          ":" +
          now.minute.toString() +
          ":" +
          now.second.toString(),
      //过磅时间（年-月-日 时:分:秒）
    };

    ResultData res = await HttpManager.getInstance()
        .post(HttpRequestUrl.URL_AFFIRM_ORDER, data);

    Navigator.of(context, rootNavigator: true).pop();

    if (res.isSuccess) {
      Navigator.of(context).pop();
    } else {
      Fluttertoast.showToast(msg: res.data.toString());
    }
  }
}
