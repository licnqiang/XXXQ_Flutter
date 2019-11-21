import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class WorkStationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Container buildButtonColumn(String image,String lab) {
      return Container(
        padding:
            EdgeInsets.only(top: 30.0, bottom: 30.0, left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: new AssetImage('./images/background.png'),
              fit: BoxFit.fill),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Image(
                image: new AssetImage(image),
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
            padding: EdgeInsets.all(10),
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
                      buildButtonColumn("images/zhixingdingdan.png","执行订单"),
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
                  child: Text("事件上报",
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
                      buildButtonColumn("images/car_fault.png","车辆故障"),
                      buildButtonColumn("images/station_apply.png","费用维保"),
                      buildButtonColumn("images/car_service.png","车辆维保"),
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
                  child: Text("记录",
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
                      buildButtonColumn("images/device_service.png","设备维护"),
                      buildButtonColumn("images/car_fault.png","车辆故障"),
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
