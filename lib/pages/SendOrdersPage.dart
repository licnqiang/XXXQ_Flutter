import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xxxq_flutter/constants/Constants.dart';
import 'package:xxxq_flutter/http/HttpManager.dart';
import 'package:xxxq_flutter/http/HttpRequestUrl.dart';
import 'package:xxxq_flutter/http/ResultData.dart';
import 'package:xxxq_flutter/model/BurnModel.dart';
import 'package:xxxq_flutter/model/BurnModelRow.dart';
import 'package:xxxq_flutter/model/CarNumModel.dart';
import 'package:xxxq_flutter/model/CarNumModelRow.dart';
import 'package:xxxq_flutter/model/CompressMode.dart';
import 'package:xxxq_flutter/model/CompressModelRow.dart';
import 'package:xxxq_flutter/model/DriverModel.dart';
import 'package:xxxq_flutter/model/DriverModelRow.dart';
import 'package:xxxq_flutter/utils/EventBusUtil.dart';
import 'package:xxxq_flutter/utils/SPUtil.dart';
import 'package:xxxq_flutter/widgets/LoadingDialog.dart';
import 'package:xxxq_flutter/widgets/TitleBar.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'SelectTypeItemPage.dart';

class SendOrdersPage extends StatefulWidget {
  @override
  _SendOrdersState createState() => _SendOrdersState();
}

class _SendOrdersState extends State<SendOrdersPage> {
  String endTime = "";
  String startTime = "";
  CompressModelRow compressModelRow = null;
  DriverModelRow driverModelRow = null;
  CarNumModelRow carNumModelRow = null;
  BurnModelRow burnModelRow = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSp();
    //接受选择的压缩站
    EventBusUtil.getInstance().on<CompressModelRow>().listen((data) {
      setState(() {
        compressModelRow = data;
      });
    });
    //接受选择的驾驶员
    EventBusUtil.getInstance().on<DriverModelRow>().listen((data) {
      setState(() {
        driverModelRow = data;
      });
    });
    //接受选择的车牌
    EventBusUtil.getInstance().on<CarNumModelRow>().listen((data) {
      setState(() {
        carNumModelRow = data;
      });
    });
    //接受选择的焚烧厂
    EventBusUtil.getInstance().on<BurnModelRow>().listen((data) {
      setState(() {
        burnModelRow = data;
      });
    });
  }

  void _initSp() async {
    await SPUtil.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar().backAppbar(context, "派单"),
      body: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: HomeNewItem("压缩站",
                    null == compressModelRow ? "" : compressModelRow.nameYsz),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => SelectTypeItemPage(
                              type: Constants.compress_station_type)));
                },
              ),
              GestureDetector(
                child: HomeNewItem("车牌",
                    null == carNumModelRow ? "" : carNumModelRow.licensePlate),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => SelectTypeItemPage(
                              type: Constants.car_num_type)));
                },
              ),
              GestureDetector(
                child: HomeNewItem(
                    "驾驶员", null == driverModelRow ? "" : driverModelRow.name),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              SelectTypeItemPage(type: Constants.driver_type)));
                },
              ),
              GestureDetector(
                child: HomeNewItem("起运时间", startTime),
                onTap: () {
                  DatePicker.showDateTimePicker(context,
                      // 是否展示顶部操作按钮
                      showTitleActions: true,
                      // change事件
                      onChanged: (date) {
                    print('change $date');
                  },
                      // 确定事件
                      onConfirm: (date) {
                    print('confirm $date');
                    setState(() {
                      startTime = '$date';
                      startTime = startTime.substring(0, startTime.length - 4);
                    });
                  },
                      // 当前时间
                      currentTime: DateTime.now(),
                      // 语言
                      locale: LocaleType.zh);
                },
              ),
              GestureDetector(
                child: HomeNewItem(
                    "焚烧厂", null == burnModelRow ? "" : burnModelRow.nameFsc),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => SelectTypeItemPage(
                              type: Constants.burn_station_type)));
                },
              ),
              GestureDetector(
                child: HomeNewItem("抵达时间", endTime),
                onTap: () {
                  DatePicker.showDateTimePicker(context,
                      // 是否展示顶部操作按钮
                      showTitleActions: true,
                      // change事件
                      onChanged: (date) {
                    print('change $date');
                  },
                      // 确定事件
                      onConfirm: (date) {
                    print('confirm $date');
                    setState(() {
                      endTime = '$date';
                      endTime = endTime.substring(0, endTime.length - 4);
                    });
                  },
                      // 当前时间
                      currentTime: DateTime.now(),
                      // 语言
                      locale: LocaleType.zh);
                },
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child:
                    HomeNewItem("派单人", SPUtil.getString(SPUtil.SP_USER_NAME)),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "备注",
                      textAlign: TextAlign.left,
                    ),
                    TextField(
                      maxLines: 3,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "请输入",
                        hintStyle: TextStyle(fontSize: 14.0),
                        hintMaxLines: 20,
                        border: InputBorder.none,
                      ),
                      obscureText: false,
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    height: 40.0,
                    width: 270.0,
                    child: RaisedButton(
                        child: Text(
                          '申请派单',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        color: Colors.blue,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        onPressed: () {
                          sendOrder();
                        }),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget HomeNewItem(String titleName, String value) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 1.0),
        padding: EdgeInsets.only(left: 10.0, right: 5.0),
        height: 45.0,
        child: Row(
          children: <Widget>[
            Text(titleName + ":"),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      value,
                    ),
                  ),
                  Icon(Icons.navigate_next)
                ],
              ),
            ),
          ],
        ));
  }

  //派单
  Future sendOrder() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new LoadingDialog(
            text: "派单中…",
          );
        });

    FormData formData = new FormData.from({
      "fscId": burnModelRow.idFsc,        //焚烧厂ID
      "fscmc": burnModelRow.nameFsc,       //焚烧厂名称
      "clId": carNumModelRow.vid,         //车辆VID
      "jhddsjBiztyd": endTime,  //计划抵达时间
      "jhqysjBiztyd": startTime, //计划起运时间
      "pdsmBiztyd": "egqgqw",  //派单说明
      "sjId": driverModelRow.id,         //司机ID
      "yszId": compressModelRow.idYsz,        //压缩站ID
      "yszName": compressModelRow.nameYsz,     //压缩站名称
    });
    ResultData res = await HttpManager.getInstance()
        .post(HttpRequestUrl.URL_SEND_ORDER, formData);
    if (res.isSuccess) {
    } else {
      Fluttertoast.showToast(msg: res.data.toString());
    }
    Navigator.pop(context);
  }
}
