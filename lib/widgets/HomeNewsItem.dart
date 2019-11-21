import 'package:flutter/material.dart';

class HomeNewItem extends StatelessWidget {

  var row = Container(
    color: Colors.white,
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                          "2019创新城市发展方式 (西咸) 国际论坛 隆重举行", style: TextStyle(fontSize: 15.0)),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: Text(
                          "已读",
                          style: TextStyle(
                              color: const Color(0xFFB5BDC0), fontSize: 12.0),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text("2019-10-16 11:38:58", style: TextStyle(
                                color: const Color(0xFFB5BDC0), fontSize: 12.0)),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            width: 100.0,
            height: 80.0,
            color: const Color(0xFFECECEC),
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFECECEC),
                  image: DecorationImage(
                      image: ExactAssetImage('./images/car_fault.png'),
                      fit: BoxFit.cover),
                  border: Border.all(
                    color: const Color(0xFFECECEC),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // 内容视图
          Container(
//            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: row,
          ),
          // 分割线
          Container(
//            margin: EdgeInsets.only(top: 4.0),
            color: Color(0xffeaeaea),
            constraints: BoxConstraints.expand(height: 1.0),
          )
        ],
      ),
    );
  }
}
