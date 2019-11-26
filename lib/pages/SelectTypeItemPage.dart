import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xxxq_flutter/constants/Constants.dart';
import 'package:xxxq_flutter/http/HttpManager.dart';
import 'package:xxxq_flutter/http/HttpRequestUrl.dart';
import 'package:xxxq_flutter/http/ResultData.dart';
import 'package:xxxq_flutter/widgets/TitleBar.dart';

import '../CarNumModel.dart';
import '../CompressMode.dart';

class SelectTypeItemPage extends StatefulWidget {
  final int type;

  SelectTypeItemPage({Key key, this.type}) : super(key: key);

  @override
  _SelectTypeItemPageState createState() =>
      _SelectTypeItemPageState(type: this.type);
}

class _SelectTypeItemPageState extends State<SelectTypeItemPage> {
  int type = null;
  var title = null;
  int itemCount = 0;
  CompressMode compressMode = null;
  CarNumModel carNumModel=null;

  _SelectTypeItemPageState({Key key, this.type});

  @override
  void initState() {
    super.initState();
//    if (type == Constants.compress_station_type) {
//      //压缩站
//      getCompressStations();
//    } else if (type == Constants.car_num_type) {
//      //车牌
//      getCarNums();
//    } else if (type == Constants.driver_type) {
//      //驾驶员
//      getDrivers();
//    } else if (type == Constants.burn_station_type) {
//      //焚烧厂
//      getBurnStates();
//    }
  }

  @override
  Widget build(BuildContext context) {
    if (type == Constants.compress_station_type) {
      //压缩站
      title = "选择压缩站";
    } else if (type == Constants.car_num_type) {
      //车牌
      title = "选择车牌";
    } else if (type == Constants.driver_type) {
      //驾驶员
      title = "选择驾驶员";
    } else if (type == Constants.burn_station_type) {
      //焚烧厂
      title = "选择焚烧厂";
    }

    return Scaffold(
      appBar: TitleBar().backAppbar(context, title),
      body: new ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: showItemType(index),
            onTap: () {
              Fluttertoast.showToast(msg: "222");
            },
          );
        },
      ),
    );
  }

  Widget showItemType(int index) {
    if (type == Constants.compress_station_type) {
      return itemCompressShow(index);
    } else if (type == Constants.car_num_type) {
      return itemCarNumShow(index);
    } else if (type == Constants.driver_type) {
      return itemDriverShow(index);
    } else if (type == Constants.burn_station_type) {
      return itemBurnShow(index);
    }
  }

  //压缩站类别
  Widget itemCompressShow(i) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: new AssetImage('images/background.png'), fit: BoxFit.fill),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            child: new Text(
              compressMode.rows[i].nameYsz,
              style: TextStyle(fontSize: 16.0),
            ),
            padding: EdgeInsets.all(10.0),
          ),
          Padding(
            child: new Text(compressMode.rows[i].addrYsz,
                style: TextStyle(fontSize: 14.0, color: Colors.black54)),
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
  }

  //车牌列表
  Widget itemCarNumShow(i) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: new AssetImage('images/background.png'), fit: BoxFit.fill),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            child: new Text(
              carNumModel.rows[i].licensePlate,
              style: TextStyle(fontSize: 16.0),
            ),
            padding: EdgeInsets.all(10.0),
          ),
          Padding(
            child: new Text(carNumModel.rows[i].deptNameCount,
                style: TextStyle(fontSize: 14.0, color: Colors.black54)),
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
  }

  //驾驶员列表
  Widget itemDriverShow(i) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: new AssetImage('images/background.png'), fit: BoxFit.fill),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            child: Row(
              children: <Widget>[
                Text(
                  "高桥压缩站",
                  style: TextStyle(fontSize: 14.0, color: Colors.black54),
                ),
                Expanded(
                  child: Row(),
                ),
                Text(
                  "18591053757",
                  style: TextStyle(fontSize: 14.0, color: Colors.black54),
                )
              ],
            ),
            padding: EdgeInsets.all(10.0),
          ),
          Padding(
            child: new Text("高桥街办高桥乡中心学校北100米",
                style: TextStyle(fontSize: 14.0, color: Colors.black)),
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
  }

  //焚烧厂列表
  Widget itemBurnShow(i) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: new AssetImage('images/background.png'), fit: BoxFit.fill),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            child: new Text("西咸新区生活垃圾焚烧厂",
                style: TextStyle(fontSize: 14.0, color: Colors.black)),
            padding: EdgeInsets.all(5.0),
          ),
        ],
      ),
    );
  }

  //获取压缩站数据
  Future getCompressStations() async {
    FormData formData = new FormData.from({
      "pageNum": "0",
      "pageSize": "-1",
    });
    ResultData res = await HttpManager.getInstance()
        .post(HttpRequestUrl.URL_ALL_COMPRESS, formData);
    if (res.isSuccess) {
      Fluttertoast.showToast(msg: res.data.toString());
    } else {
      Fluttertoast.showToast(msg: res.data.toString());
    }
  }

  //获取车牌数据
  Future getCarNums() async {
    FormData formData = new FormData.from({
      "pageNum": "0",
      "pageSize": "-1",
      "status": "0",
    });
    ResultData res = await HttpManager.getInstance()
        .post(HttpRequestUrl.URL_CAR_NUM, formData);
    if (res.isSuccess) {
      Fluttertoast.showToast(msg: res.data.toString());
    } else {
      Fluttertoast.showToast(msg: res.data.toString());
    }
  }

  //获取焚烧厂数据
  Future getBurnStates() async {
    FormData formData = new FormData.from({
      "pageNum": "0",
      "pageSize": "-1",
    });
    ResultData res = await HttpManager.getInstance()
        .post(HttpRequestUrl.URL_BURN_STATION, formData);
    if (res.isSuccess) {
      Fluttertoast.showToast(msg: res.data.toString());
    } else {
      Fluttertoast.showToast(msg: res.data.toString());
    }
  }

  //获取驾驶员数据
  Future getDrivers() async {
    FormData formData = new FormData.from({
      "pageNum": "0",
      "pageSize": "-1",
      "userType": "7", //查询用户类型 1管理员2普通用户3环卫集团员工4站长5操作工6扫保人员7司机
      "idSysdept": "-1", //组织机构id
    });
    ResultData res = await HttpManager.getInstance()
        .post(HttpRequestUrl.URL_DRIVER, formData);
    if (res.isSuccess) {
      Fluttertoast.showToast(msg: res.data.toString());
    } else {
      Fluttertoast.showToast(msg: res.data.toString());
    }
  }
}
