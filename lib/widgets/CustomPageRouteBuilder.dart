import 'package:flutter/cupertino.dart';

/// 自定义页面切换动画 - 渐变切换
class CustomPageRouteBuilder extends PageRouteBuilder {
  // 跳转的页面
  final Widget widget;

  CustomPageRouteBuilder(this.widget)
      : super(
            transitionDuration: Duration(seconds: 3),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                  child: child,
                  opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation, curve: Curves.fastOutSlowIn)));
            });
}
