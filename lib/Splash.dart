

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xxxq_flutter/pages/LoginPage.dart';

import 'main.dart';

class SplashPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new SplashState();
  }

}


class SplashState extends State<SplashPage>{
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = new Timer(const Duration(milliseconds: 1500), () {
      try {
        Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(
            builder: (BuildContext context) =>  new LoginPage()), (
            Route route) => route == null);

      } catch (e) {
        print("异常"+e.toString());
      }
    });


  }


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: Container(
        alignment: Alignment(0, -0.3),
        child: new Text(
          "西咸环卫",
          style: new TextStyle(
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
             textDirection: TextDirection.ltr,
        ),
      ),
    );
  }

}