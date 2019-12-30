

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xxxq_flutter/pages/LoginPage.dart';

import 'package:xxxq_flutter/pages/main.dart';
import 'package:xxxq_flutter/widgets/CustomPageRouteBuilder.dart';

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
    _timer = new Timer(const Duration(milliseconds: 500), () {
      try {
        Navigator.of(context).pushAndRemoveUntil(new CustomPageRouteBuilder(new LoginPage()), (
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/xh.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container()
    );
  }

}