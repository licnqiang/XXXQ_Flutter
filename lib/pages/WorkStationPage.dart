import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'MaintenaceListPage.dart';
import 'SendOrdersPage.dart';
import 'TransOrderListPage.dart';

class WorkStationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Container buildButtonColumn(String image, String lab) {
      return Container(
        padding:
            EdgeInsets.only(top: 40.0, bottom: 40.0, left: 25.0, right: 25.0),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: new AssetImage('images/background.png'), fit: BoxFit.fill),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Image(
                image: new AssetImage(""==image?"images/send.png":image),
                height: 50.0,
                width: 50.0,
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(lab),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(12),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
                  child: Text("常用功能",
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        child: buildButtonColumn("images/send.png", "派单"),
                        onTap: () {
                          Navigator.push(
                              context,
                              new CupertinoPageRoute(
                                  builder: (context) => SendOrdersPage()));
                        },
                      ),
                      Opacity(
                        opacity: 0.0,
                         child: buildButtonColumn("",""),
                      ),
                      Opacity(
                        opacity: 0.0,
                         child: buildButtonColumn("",""),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
                  child: Text("审批",
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      buildButtonColumn("images/zhixingdingdan.png", "垃圾运输"),
                      buildButtonColumn("images/station_apply.png", "行政报销"),
                      GestureDetector(
                        child: buildButtonColumn("images/yundan.png", "运单"),
                        onTap: () {
                          Navigator.push(
                              context,
                              new CupertinoPageRoute(
                                  builder: (context) => TransOrderListPage()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        child: buildButtonColumn(
                            "images/device_service.png", "设备维护"),
                        onTap: () {
                          Navigator.push(
                              context,
                              new CupertinoPageRoute(
                                  builder: (context) => MaintenaceListPage()));
                        },
                      ),
                      buildButtonColumn("images/car_fault.png", "车辆故障"),
                      Opacity(
                        opacity: 0.0,
                         child: buildButtonColumn("",""),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
