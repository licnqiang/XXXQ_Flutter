import 'package:flutter/cupertino.dart';

/// 自定义页面切换动画 - 平移切换
class SlidePageRouteBuilder extends PageRouteBuilder {
// 跳转的页面
  final Widget widget;

  SlidePageRouteBuilder(this.widget)
      : super(
            transitionDuration: Duration(seconds: 2),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                        begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                        parent: animation, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}
