import 'package:flutter/material.dart';

class TitleBar {
  backAppbar(BuildContext context, String title, {VoidCallback onPressed}) {
    return PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          title: Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          centerTitle: true,
          leading: _leading(context, onPressed),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ));
  }

  /**
   * 设置左侧按钮
   */
  _leading(BuildContext context, VoidCallback onPressed) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 44,
          padding: EdgeInsets.all(0),
          child: new IconButton(
            padding: EdgeInsets.only(left: 16, right: 16),
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              if (onPressed == null) {
                _popThis(context);
              } else {
                onPressed();
              }
            },
          ),
        ),
      ],
    );
  }

  /**
   * 关闭页面
   */
  _popThis(BuildContext context) {
    Navigator.of(context).pop();
  }
}
