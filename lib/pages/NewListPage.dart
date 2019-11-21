import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/SwiperViewDefaultPage.dart';
import '../widgets/HomeNewsItem.dart';

class NewListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: new ListView.builder(
        padding: new EdgeInsets.all(0.0),
        itemBuilder: (BuildContext context, int index) {
          if (0 == index) {
            //第一项轮播页
            return new SwiperViewDefaultPage();
          } else if (1 == index) {
            //第二项公告
            return _NotiveItem();
          } else {
            //其他像是新闻列表
            return  new HomeNewItem();
          }
        },
      ),
    );
  }








  //公告item
  Widget _NotiveItem() {
   return new Container(
      color: Colors.white,
      padding: EdgeInsets.all(5.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text("咸阳垃圾一站获得领导表扬"),
          new Row(
            children: <Widget>[
              new Text("置顶",
                  style:
                  new TextStyle(color: Colors.blue, height: 1.5)),
              SizedBox(
                width: 10.0,
              ),
              new Text("公告",
                  style:
                  new TextStyle(color: Colors.black, height: 1.5)),
            ],
          ),
        ],
      ),
    );

  }
}
