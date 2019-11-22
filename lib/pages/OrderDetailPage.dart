import 'package:flutter/material.dart';
import 'package:xxxq_flutter/widgets/TitleBar.dart';

class OrderDetailPage extends StatefulWidget {
  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TitleBar().backAppbar(context, "订单详情"),
        body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
          child: Column(
            children: <Widget>[
              HomeNewItem("压缩站", "秦汉中心区生活垃圾转运站"),
              HomeNewItem("车牌", "陕AS8805"),
              HomeNewItem("运输人", "B司机"),
              HomeNewItem("起运时间", "2019-10-21 15:41:04"),
              HomeNewItem("焚烧厂", "西咸新区生活垃圾焚烧厂发电厂"),
              HomeNewItem("抵达时间", "2019-10-21 15:41:04"),
              HomeNewItem("运单", "2019102100012"),
              Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                color: Colors.white,
                padding: EdgeInsets.only(top: 10.0,left: 10.0,bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("备注:", style: TextStyle(color: Colors.black45)),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, top: 10.0, bottom: 10.0, right: 20.0),
                          child:
                          Text("派单说明", style: TextStyle(color: Colors.black45)),
                        )
                      ],
                    ),
                  ],
                )
              ),
              HomeNewItem("毛重(吨)", "30.0"),
              HomeNewItem("皮重(吨)", "2.0"),
              HomeNewItem("净重(吨)", "28.0"),
              Container(
                margin: EdgeInsets.only(top: 1.0),
                  color: Colors.white,
                  padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("图片:", style: TextStyle(color: Colors.black45)),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, top: 20.0, bottom: 10.0, right: 20.0),
                          child: Image(
                            image: new AssetImage("images/send.png"),
                            height: 50.0,
                            width: 50.0,
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ),
            ],
          ),
        )));
  }

  Widget HomeNewItem(String titleName, String value) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 1.0),
        padding: EdgeInsets.only(left: 10.0, right: 5.0),
        height: 45.0,
        child: Row(
          children: <Widget>[
            Text(titleName + ":", style: TextStyle(color: Colors.black45)),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(value, style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
