import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:xxxq_flutter/widgets/TitleBar.dart';
import 'OrderDetailPage.dart';

class MaintenaceListPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MaintenaceListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar().backAppbar(context, "维保信息"),
      body: new ListView.builder(
        padding: new EdgeInsets.all(0.0),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: itemShow(),
            onTap: () {
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => OrderDetailPage()));
            },
          );
        },
      ),
    );
  }

  Widget itemShow() {
    return Container(
      margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
      height: 110.0,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0),topRight: Radius.circular(5.0)),
            ),
            child: Row(
              children: <Widget>[
                Text("维修",style: TextStyle(color: Colors.white))
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Text("陕AU0797",style: TextStyle(color: Colors.black),),
                Expanded(
                  child: Container(
                    alignment:Alignment.centerRight ,
                    child: Text("未审核",style: TextStyle(color: Colors.black54)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1.0,
            decoration: new BoxDecoration(
              color: Color(0xffeaeaea),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10.0),
              alignment: Alignment.centerLeft,
              child: Row(
                children: <Widget>[
                  Text("2019-10-31 15:31:55",style: TextStyle(color: Colors.black45)),
                ],
              ),
            ),
          )
        ],

      ),
    );
  }
}
