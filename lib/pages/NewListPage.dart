import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/SwiperViewDefaultPage.dart';

class NewListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new ListView.builder(
        padding: new EdgeInsets.all(5.0),
        itemBuilder: (BuildContext context, int index) {
          if (0 == index) {                    //第一项轮播页
            return new SwiperViewDefaultPage();
          } else if (1 == index) {             //第二项公告
//            return new
          } else {                             //其他像是新闻列表
            return new Text("text $index");
          }
        },
      ),
    );
  }
}
