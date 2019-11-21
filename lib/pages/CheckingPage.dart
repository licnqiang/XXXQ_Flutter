import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CheckingPage extends StatefulWidget {
  @override
  _CheckingPageState createState() => _CheckingPageState();
}

class _CheckingPageState extends State<CheckingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
          ),
          //考勤模块title布局
          _checkingNav,
          _checkingTimeShow,
          _checkingBtn,
        ],
      ),
    );
  }
}

/**
 * 打卡按钮
 */
var _checkingBtn = Expanded(
  child: Center(
    child: Container(
      height: 150.0,
      width: 150.0,
      child: Stack(
        children: <Widget>[
          Icon(
            Icons.brightness_1,
            color: Colors.blue,
            size: 150,
          ),
          Container(
                child:Center(
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.tag_faces,
                        color: Colors.white,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                        child: Text(
                          "上班打卡",
                          style: new TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),

                      Text(
                        "16:09:54",
                        style: new TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                    ],
                  ),
                )
              ),
        ],
      ),
    ),
  ),
);

/**
 * 当天考勤状态显示
 */
var _checkingTimeShow = Container(
  height: 200,
  padding: EdgeInsets.only(left: 40.0),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 5.0),
        height: 150,
        child: Column(
          children: <Widget>[
            Icon(Icons.brightness_1, size: 10.0, color: Colors.grey),
            Expanded(
                child: Container(
              width: 1.0,
              color: Colors.grey,
            )),
            Icon(Icons.brightness_1, size: 10.0, color: Colors.grey),
          ],
        ),
      ),
      SizedBox(
        width: 15.0,
      ),
      Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("上班时间 08:00"),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text("打卡时间 08:00"),
              ),
            ],
          ),
          Expanded(
            child: Column(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("下班时间 08:00"),
              Container(
                height: 40.0,
                padding: EdgeInsets.only(top: 10),
                child: Text("打卡时间 08:00"),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
);

/**
 * 考勤模块title布局
 */
var _checkingNav = Container(
  decoration: new BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(10.0),
  ),
  height: 80,
  margin: EdgeInsets.all(40.0),
  child: Row(
    children: <Widget>[
      Container(
          decoration: new BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ),
          ),
          height: 80,
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Center(
            child: Text(
              "A",
              style: new TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
          )),
      Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "A司机",
                style: new TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              Text(
                "航天中路",
                style: new TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.only(right: 15.0, top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "2019",
              textAlign: TextAlign.start,
              style: new TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Text(
              "11/21",
              textAlign: TextAlign.start,
              style: new TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);
