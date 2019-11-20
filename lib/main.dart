import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:xxxq_flutter/Splash.dart';
import 'package:xxxq_flutter/pages/LoginPage.dart';
import './util/ThemeUtils.dart';
import './pages/CheckingPage.dart';
import './pages/WorkStationPage.dart';
import './pages/NewListPage.dart';
import './pages/MyPage.dart';

void main() => runApp(
    new MaterialApp(home: new SplashPage(),));

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
  var pages;

  Image getTabImage(path) {
    return Image.asset(path, width: 20.0, height: 20.0);
  }

  @override
  void initState() {
    super.initState();
    pages = <Widget>[
      NewListPage(),
      CheckingPage(),
      WorkStationPage(),
      MyPage()
    ];
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
