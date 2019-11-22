import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:xxxq_flutter/widgets/TitleBar.dart';
import 'OrderDetailPage.dart';

class TransOrderListPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<TransOrderListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar().backAppbar(context, "派单"),
      body: new ListView.builder(
        padding: new EdgeInsets.all(0.0),
        itemBuilder: (BuildContext context, int index) {
          return  GestureDetector(
            child: itemShow(),
            onTap: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context)=>OrderDetailPage()));
            },
          );
        },
      ),
    );
  }

 Widget itemShow() {
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
              color: Colors.black45,
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
                        "西咸新区生活垃圾焚烧发电厂",
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
                        "2019-10-29 17:16:00",
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
                              color: Colors.grey,
                              //设置控件的背景色
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0,
                                    top: 2.0,
                                    bottom: 2.0,
                                    right: 10.0),
                                child: Text(
                                  '已完成',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0),
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
                          "订单号：01ewe4g54weg5ew1g4we488455w4",
                          style: TextStyle(
                              color: Colors.black45, fontSize: 10.0),
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
