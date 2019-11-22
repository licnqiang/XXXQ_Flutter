import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xxxq_flutter/widgets/TitleBar.dart';

class SendOrdersPage extends StatefulWidget {
  @override
  _SendOrdersState createState() => _SendOrdersState();
}

class _SendOrdersState extends State<SendOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar().backAppbar(context, "派单"),
      body: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HomeNewItem("压缩站", ""),
              HomeNewItem("车牌", ""),
              HomeNewItem("驾驶员", ""),
              HomeNewItem("起运时间", ""),
              HomeNewItem("焚烧厂", ""),
              HomeNewItem("抵达时间", ""),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(5))),
                        onPressed: () {}),
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
}
