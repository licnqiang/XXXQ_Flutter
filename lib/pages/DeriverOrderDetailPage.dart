import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xxxq_flutter/http/HttpManager.dart';
import 'package:xxxq_flutter/http/HttpRequestUrl.dart';
import 'package:xxxq_flutter/http/ResultData.dart';
import 'package:xxxq_flutter/model/FileModel.dart';
import 'package:xxxq_flutter/model/OrderListModel.dart';
import 'package:xxxq_flutter/utils/EventBusUtil.dart';
import 'package:xxxq_flutter/widgets/LoadingDialog.dart';
import 'package:xxxq_flutter/widgets/TitleBar.dart';
import 'package:image_picker/image_picker.dart';

import 'PhotpGalleryPage.dart';

/**
 * 站长派单详情
 */
class DeriverOrderDetailPage extends StatefulWidget {
  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<DeriverOrderDetailPage> {
  bool bangdanHidden = true; //控制是否显示榜单信息  true 不显示，false 显示
  bool btnHidden = true; //控制按钮显示
  bool stateHidden = true; //控制运单进度显示
  var btnShowText = ""; //按钮显示文字
  bool _commentFocus = true; //控制输入框是否可输入
  var stateImageRourse =
      "./images/order_state_1.png"; //默认加载，防止图片地址为空报错，默认加载时 不现实该控件
  OrderListModelRow rowsBean;

  //记录选择的照片
  File _image;

  @override
  Widget build(BuildContext context) {
    rowsBean = ModalRoute.of(context).settings.arguments;

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
          btnShowText = "接单";
          break;
        case "2": //已接单未起运
          bangdanHidden = true;
          btnHidden = false;
          stateHidden = false;
          stateImageRourse = "./images/order_state_1.png";
          btnShowText = "起运";
          break;
        case "3": //已起运未过磅
          bangdanHidden = false;
          btnHidden = false;
          stateHidden = false;
          stateImageRourse = "./images/order_state_2.png";
          btnShowText = "确认到达";
          _commentFocus=true;     // 获取焦点
          break;

        case "4": //已过磅未确认
          bangdanHidden = false;
          btnHidden = true;
          stateHidden = false;
          stateImageRourse = "./images/order_state_3.png";
          _commentFocus=false;
          break;
        case "5": //已完成
          bangdanHidden = false;
          btnHidden = true;
          stateHidden = true;
          _commentFocus=false;
          break;
      }
    }

    /**
     * 可编辑
     */
    Widget HomeNewEditeItem(String titleName, String value) {
      return Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: 1.0),
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          height: 45.0,
          child: Row(
            children: <Widget>[
              Text(titleName + ":", style: TextStyle(color: Colors.black45)),
              Expanded(
                  child: TextField(
                 enabled:  _commentFocus,
                textAlign: TextAlign.right,
                decoration:
                    InputDecoration(hintText: "请输入", border: InputBorder.none),
              )),
            ],
          ));
    }

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
                  padding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("备注:", style: TextStyle(color: Colors.black45)),
                          Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 10),
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
                    HomeNewEditeItem(
                        "毛重(吨)",
                        null == rowsBean.mzBizgbd
                            ? ""
                            : rowsBean.mzBizgbd.toString()),
                    HomeNewEditeItem(
                        "皮重(吨)",
                        null == rowsBean.pzBizgbd
                            ? ""
                            : rowsBean.pzBizgbd.toString()),
                    HomeNewEditeItem(
                        "净重(吨)",
                        null == rowsBean.jzBizgbd
                            ? ""
                            : rowsBean.jzBizgbd.toString()),
                    showImage(),
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                          color: Colors.blue,
                          shape: const RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          onPressed: () {
                            if (btnShowText == "接单") {
                              acceptOrder(rowsBean.idBiztydsjgbd);
                            } else if (btnShowText == "起运") {
                              startOrder(rowsBean.idBiztydsjgbd);
                            } else if (btnShowText == "确认到达") {
                              if (null != _image) {
                                _upLoadImage(rowsBean.idBiztydsjgbd,
                                    rowsBean.bdId, _image, "100", "100", "100");
                              } else {
                                endOrder(rowsBean.idBiztydsjgbd, rowsBean.bdId,
                                    "", "100", "100", "100");
                              }
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

  Widget showImage() {
    if (null != rowsBean) {
      if (rowsBean.status == "3") {
        return SwitchImage(true);
      } else if (rowsBean.status == "5" || rowsBean.status == "4") {
        if (null == rowsBean.bdtp || rowsBean.bdtp.isEmpty) {
          return Container();
        } else {
          return SwitchImage(false);
        }
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }

  /**
   * 显示
   */
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

  //司机接单
  Future acceptOrder(String tydsjgbdId) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new LoadingDialog(
            text: "接单中…",
          );
        });
    DateTime now = new DateTime.now();
    var data = {
      "idBiztydsjgbd": tydsjgbdId, //ID
      "jsrwsjBiztydsjgbd": now.year.toString() +
          "-" +
          now.month.toString() +
          "-" +
          now.day.toString() +
          " " +
          now.hour.toString() +
          ":" +
          now.minute.toString() +
          ":" +
          now.second.toString(), // 接单时间（年-月-日 时:分:秒）
    };

    ResultData res = await HttpManager.getInstance()
        .post(HttpRequestUrl.URL_ACCEPT_ORDER, data);

    Navigator.of(context, rootNavigator: true).pop();

    if (res.isSuccess) {
      Fluttertoast.showToast(msg: "接单成功");
      if (null != rowsBean) {
        rowsBean.status = "2";
      }
      setState(() {
        //更新ui
      });
    } else {
      Fluttertoast.showToast(msg: res.data.toString());
    }
  }

  //起运
  Future startOrder(String tydsjgbdId) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new LoadingDialog(
            text: "起运中…",
          );
        });
    DateTime now = new DateTime.now();

    var data = {
      "idBiztydsjgbd": tydsjgbdId,
      //ID
      "jsrwsjBiztydsjgbd": now.year.toString() +
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
      //起运时间（年-月-日 时:分:秒）
    };

    ResultData res = await HttpManager.getInstance()
        .post(HttpRequestUrl.URL_START_ORDER, data);

    Navigator.of(context, rootNavigator: true).pop();

    if (res.isSuccess) {
      Fluttertoast.showToast(msg: "起运成功");

      if (null != rowsBean) {
        rowsBean.status = "3";
      }
      setState(() {
        //更新ui
      });
    } else {
      Fluttertoast.showToast(msg: res.data.toString());
    }
  }

  /**
   * 确认到达
   * @param bdtp              图片路径，（需先调用上传图片存储相对路径）
   * @param idBizgbd          磅单ID
   * @param idBiztydsjgbd     ID
   * @param mzBizgbd          毛重（吨）
   * @param pzBizgbd          皮重（吨）
   * @param jzBizgbd          净重（吨）
   */
  Future endOrder(String tydsjgbdId, String idBizgbd, String bdtp,
      String mzBizgbd, String pzBizgbd, String jzBizgbd) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new LoadingDialog(
            text: "订单确认中…",
          );
        });

    var data = {
      "idBiztydsjgbd": tydsjgbdId, //ID
      "idBizgbd": idBizgbd, //磅单ID
      "bdtp": bdtp, //图片路径，（需先调用上传图片存储相对路径）
      "mzBizgbd": mzBizgbd, //毛重（吨）
      "pzBizgbd": pzBizgbd, //皮重（吨）
      "jzBizgbd": jzBizgbd, //净重（吨）
    };

    ResultData res = await HttpManager.getInstance()
        .post(HttpRequestUrl.URL_END_ORDER, data);

    Navigator.of(context, rootNavigator: true).pop();

    if (res.isSuccess) {
      Fluttertoast.showToast(msg: "订单确认成功");
      if (null != rowsBean) {
        rowsBean.status = "4";
      }
      setState(() {
        //更新ui
      });
    } else {
      Fluttertoast.showToast(msg: res.data.toString());
    }
  }

  //上传图片
  _upLoadImage(String tydsjgbdId, String idBizgbd, File image, String mzBizgbd,
      String pzBizgbd, String jzBizgbd) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new LoadingDialog(
            text: "文件上传中…",
          );
        });

    String path = image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    FormData formData =
        new FormData.from({"file": new UploadFileInfo(new File(path), name)});
    ResultData res = await HttpManager.getInstance()
        .post(HttpRequestUrl.URL_FILE_UPLOAD, formData);

    Navigator.of(context, rootNavigator: true).pop();
    if (res.isSuccess) {
      var fileModel = FileModel.fromJson(res.data);

      if (null != rowsBean) {
        //手动改变该界面的订单实体类
        rowsBean.status = "5";
        rowsBean.bdtp = fileModel.data;
      }
      endOrder(
          tydsjgbdId, idBizgbd, fileModel.data, mzBizgbd, pzBizgbd, jzBizgbd);
    } else {
      Fluttertoast.showToast(
          msg: "图片上传出错", gravity: ToastGravity.CENTER, textColor: Colors.grey);
    }
  }

  Widget SwitchImage(bool switc) {
    if (switc) {
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
//                      ,height: 50.0, width: 50.0, fit: BoxFit.fill
                      child: GestureDetector(
                        child:
                            /**
                         * 展示选择的图片
                         */
                            _image == null
                                ? Icon(
                                    Icons.add_a_photo,
                                    size: 50.0,
                                  )
                                : Image.file(
                                    _image,
                                    fit: BoxFit.cover,
                                    height: 50.0,
                                    width: 50.0,
                                  ),
                        onTap: () {
                          showDemoActionSheet(
                            context: context,
                            child: CupertinoActionSheet(
                              title: const Text('选择图片'),
                              //message: const Text('Please select the best mode from the options below.'),
                              actions: <Widget>[
                                CupertinoActionSheetAction(
                                  child: const Text('相册'),
                                  onPressed: () {
                                    getImageByGallery();
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  },
                                ),
                                CupertinoActionSheetAction(
                                  child: const Text('相机'),
                                  onPressed: () {
                                    getImageByCamera();
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  },
                                ),
                              ],
                              cancelButton: CupertinoActionSheetAction(
                                child: const Text('取消'),
                                isDefaultAction: true,
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                },
                              ),
                            ),
                          );
                        },
                      ))
                ],
              ),
            ],
          ));
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

  void showDemoActionSheet({BuildContext context, Widget child}) {
    showCupertinoModalPopup<String>(
      context: context,
      builder: (BuildContext context) => child,
    ).then((String value) {
      if (value != null) {
        if (value == "相机") {
          getImageByCamera();
        } else if (value == "相册") {
          getImageByGallery();
        }
      }
    });
  }

  Future getImageByCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      if (null != image) {
        _image = image;
      }
    });
  }

  Future getImageByGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (null != image) {
        _image = image;
      }
    });
  }
}
