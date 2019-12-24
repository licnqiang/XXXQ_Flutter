import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xxxq_flutter/http/HttpManager.dart';
import 'package:xxxq_flutter/http/HttpRequestUrl.dart';
import 'package:xxxq_flutter/http/ResultData.dart';
import 'package:xxxq_flutter/model/OrderListModel.dart';
import 'package:xxxq_flutter/widgets/LoadingDialog.dart';
import 'package:xxxq_flutter/widgets/TitleBar.dart';
import 'HearderOrderDetailPage.dart';

class TransOrderListPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<TransOrderListPage> {
  OrderListModel orderList = null;

  @override
  void initState() {
    super.initState();
    sendOrder();
  }

  @override
  void deactivate() {
    var bool = ModalRoute.of(context).isCurrent;
    if (bool) {   //界面可见
      sendOrder();
    }
  }

  //派单
  Future sendOrder() async {
//    showDialog(
//        context: context,
//        barrierDismissible: true,
//        builder: (BuildContext context) {
//          return new LoadingDialog(
//            text: "派单中…",
//          );
//        });
    var data = {
      "pageNum": "0", //焚烧厂ID
      "pageSize": "-1", //焚烧厂名称
    };
    ResultData res = await HttpManager.getInstance()
        .get(HttpRequestUrl.URL_ORDER_LIST, data);
//    Navigator.of(context, rootNavigator: true).pop();
    if (res.isSuccess) {
      orderList = OrderListModel.fromJson(res.data);
      print("请求成功：" + res.data.toString());
      setState(() {    //更新ui

      });
    } else {
      Fluttertoast.showToast(msg: res.data.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar().backAppbar(context, "订单列表"),
      body: new ListView.builder(
        padding: new EdgeInsets.all(0.0),
        itemCount: null == orderList ? 0 : orderList.rows.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: itemShow(index),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => HearderOrderDetailPage(),
                      settings: RouteSettings(
                        arguments: orderList.rows[index],
                      )));
            },
          );
        },
      ),
    );
  }

  Widget itemShow(int index) {
    var orderStateTest = "";
    var btnBackgroudColor;

    if ("0" == orderList.rows[index].status) {
      //0 -指派取消
      orderStateTest = "已取消";
      btnBackgroudColor = Colors.grey;
    } else if ("1" == orderList.rows[index].status) {
      //1-已指派未接单
      orderStateTest = "未接单";
      btnBackgroudColor = Colors.orange;
    } else if ("5" == orderList.rows[index].status) {
      orderStateTest = "已完成";
      btnBackgroudColor = Colors.grey;
    } else {
      orderStateTest = "进行中";
      btnBackgroudColor = Colors.blue;
    }

    return Container(
      margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
      height: 100.0,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              color: btnBackgroudColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.0),
                bottomLeft: Radius.circular(5.0),
              ),
            ),
            width: 4.0,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10.0, top: 15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 15.0,
                        color: Colors.black45,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        orderList.rows[index].fscmc, //名称
                        style: new TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.timer,
                        size: 15.0,
                        color: Colors.black45,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        orderList.rows[index].jhqysjBiztyd, //时间
                        style: new TextStyle(
                          color: Colors.black45,
                          fontSize: 12.0,
                        ),
                      ),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(right: 10.0),
                        alignment: Alignment.centerRight,
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          //设置矩形的圆角弧度，具体根据 UI 标注为准
                          color: btnBackgroudColor,
                          //设置控件的背景色
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 2.0, bottom: 2.0, right: 10.0),
                            child: Text(
                              orderStateTest, //运单状态
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
//            margin: EdgeInsets.only(top: 4.0),
                    color: Color(0xffeaeaea),
                    constraints: BoxConstraints.expand(height: 1.0),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "订单号：" + orderList.rows[index].ydhBiztyd, //订单编号
                      style: TextStyle(color: Colors.black45, fontSize: 10.0),
                    ),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
