import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:xxxq_flutter/Splash.dart';
import 'package:xxxq_flutter/pages/WorkDeriverPage.dart';
import 'package:xxxq_flutter/utils/SPUtil.dart';
import 'package:xxxq_flutter/utils/ThemeUtils.dart';
import './pages/CheckingPage.dart';
import './pages/WorkStationPage.dart';
import './pages/NewListPage.dart';
import './pages/MyPage.dart';

void main() {
  runApp(new MaterialApp(home: new SplashPage()));
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {



  final appBarTitles = ['首页', '考勤', '工作', '我的'];
  final tabTextStyleSelected = TextStyle(color: Colors.blue, fontSize: 14.0);
  final tabTextStyleNormal = TextStyle(color: Colors.grey, fontSize: 14.0);

  Color themeColor = ThemeUtils.currentColorTheme;
  int _tabIndex = 0;

  var tabImages;
  var _body;
  List<Widget> pages = new List();

  Image getTabImage(path) {
    return Image.asset(path, width: 20.0, height: 20.0);
  }

  @override
  void initState() {
    super.initState();
    String userType=SPUtil.getString(SPUtil.SP_USER_TYPE);

    pages.add(NewListPage());
    pages.add(CheckingPage());
    if("4"==userType){    //站长
      pages.add(WorkStationPage());
    }if("7"==userType){   //司机
      pages.add(WorkDeriverPage());
    }
    pages.add(MyPage());

    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/main_ziyuan.png'),
          getTabImage('images/main_ziyuan_sel.png')
        ],
        [
          getTabImage('images/home_tab_msg_n.png'),
          getTabImage('images/home_tab_msg_p.png')
        ],
        [
          getTabImage('images/main_work.png'),
          getTabImage('images/main_work_sel.png')
        ],
        [
          getTabImage('images/main_wode.png'),
          getTabImage('images/main_wode_sel.png')
        ]
      ];
    }
  }

  //文字的样式
  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  //获取需要显示的图标
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    return Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  @override
  Widget build(BuildContext context) {
    _body = IndexedStack(
      children: pages,
      index: _tabIndex,
    );
    return MaterialApp(
      theme: ThemeData(primaryColor: themeColor),
      home: Scaffold(
          body: _body,
          bottomNavigationBar: CupertinoTabBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: getTabIcon(0), title: getTabTitle(0)),
              BottomNavigationBarItem(
                  icon: getTabIcon(1), title: getTabTitle(1)),
              BottomNavigationBarItem(
                  icon: getTabIcon(2), title: getTabTitle(2)),
              BottomNavigationBarItem(
                  icon: getTabIcon(3), title: getTabTitle(3)),
            ],
            currentIndex: _tabIndex,
            onTap: (index) {
              setState(() {
                _tabIndex = index;
              });
            },
            backgroundColor: Colors.white,
          )),
    );
  }


}
