import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xxxq_flutter/constants/Constants.dart';
import 'package:xxxq_flutter/widgets/TitleBar.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'SelectTypeItemPage.dart';

class SendOrdersPage extends StatefulWidget {
  @override
  _SendOrdersState createState() => _SendOrdersState();
}

class _SendOrdersState extends State<SendOrdersPage> {

  @override
  Widget build(BuildContext context) {
    String endTime="";
    String startTime="";

    return Scaffold(
      appBar: TitleBar().backAppbar(context, "派单"),
      body: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: HomeNewItem("压缩站", ""),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => SelectTypeItemPage(
                              type: Constants.compress_station_type)));
                },
              ),
              GestureDetector(
                child: HomeNewItem("车牌", ""),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => SelectTypeItemPage(
                              type: Constants.car_num_type)));
                },
              ),
              GestureDetector(
                child: HomeNewItem("驾驶员", ""),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              SelectTypeItemPage(type: Constants.driver_type)));
                },
              ),
              GestureDetector(
                child:   HomeNewItem("起运时间", startTime),
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
                          startTime='$date';
                        });
                      },
                      // 当前时间
                      currentTime: DateTime.now(),
                      // 语言
                      locale: LocaleType.zh);
                },
              ),
              GestureDetector(
                child: HomeNewItem("焚烧厂", ""),
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
                          endTime='$date';
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
                child: HomeNewItem("派单人", ""),
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
                        onPressed: () {}),
                  )),
            ],
          ),
        ),
      ),
    );
  }


  //选择日期的方法
  _selectDateMethod(bool isStart) async {

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
}
