

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
        Navigator.of(context).pushAndRemoveUntil(
            PageRouteBuilder<Null>(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return AnimatedBuilder(
                  animation: animation,
                  builder: (BuildContext context, Widget child) {
                    return Opacity(
                      opacity: animation.value,
//                      child: new MyHomePage(title: '西咸环卫'),
                        child: new LoginPage(),
                    );
                  },
                );
              },
              transitionDuration: Duration(milliseconds: 300),
            ),
                (Route route) => route == null);
      } catch (e) {}
    });


  }


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      color: new Color.fromARGB(255, 0, 215, 198),
      child: Container(
        alignment: Alignment(0, -0.3),
        child: new Text(
          "西咸环卫",
          style: new TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

}