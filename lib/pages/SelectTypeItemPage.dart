import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xxxq_flutter/constants/Constants.dart';
import 'package:xxxq_flutter/http/HttpManager.dart';
import 'package:xxxq_flutter/http/HttpRequestUrl.dart';
import 'package:xxxq_flutter/http/ResultData.dart';
import 'package:xxxq_flutter/model/BurnModel.dart';
import 'package:xxxq_flutter/model/DriverModel.dart';
import 'package:xxxq_flutter/utils/EventBusUtil.dart';
import 'package:xxxq_flutter/utils/SPUtil.dart';
import 'package:xxxq_flutter/widgets/TitleBar.dart';

import 'package:xxxq_flutter/model/CarNumModel.dart';
import 'package:xxxq_flutter/model/CompressMode.dart';

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
  DriverModel driverModel=null;
  BurnModel burnModel=null;

  _SelectTypeItemPageState({Key key, this.type});

  @override
  void initState() {
    super.initState();
    _initSp();
    if (type == Constants.compress_station_type) {
      //压缩站
      getCompressStations();
    } else if (type == Constants.car_num_type) {
      //车牌
      getCarNums();
    } else if (type == Constants.driver_type) {
      //驾驶员
      getDrivers();
    } else if (type == Constants.burn_station_type) {
      //焚烧厂
      getBurnStates();
    }
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
      body: showItemType(),
    );
  }

  Widget showItemType() {
    if (type == Constants.compress_station_type) {
      if(null==compressMode){
        return Container();
      }else{
        return itemCompressShow();
      }

    } else if (type == Constants.car_num_type) {
      if(null==carNumModel){
        return Container();
      }else{
        return itemCarNumShow();
      }
    } else if (type == Constants.driver_type) {
      if(null==driverModel){
        return Container();
      }else{
        return itemDriverShow();
      }
    } else if (type == Constants.burn_station_type) {
      if(null==burnModel){
        return Container();
      }else{
        return itemBurnShow();
      }
    }
  }

  //压缩站类别
  Widget itemCompressShow() {
    return new ListView.builder(
      itemCount: compressMode.rows.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
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
                    compressMode.rows[index].nameYsz,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Padding(
                  child: new Text(compressMode.rows[index].addrYsz,
                      style: TextStyle(fontSize: 14.0, color: Colors.black54)),
                  padding: EdgeInsets.all(10.0),
                ),
              ],
            ),
          ),
          onTap: () {
            EventBusUtil.getInstance().fire(compressMode.rows[index]);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  //车牌列表
  Widget itemCarNumShow() {
    return new ListView.builder(
      itemCount: carNumModel.rows.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
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
                    carNumModel.rows[index].licensePlate,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Padding(
                  child: new Text(carNumModel.rows[index].deptNameCount,
                      style: TextStyle(fontSize: 14.0, color: Colors.black54)),
                  padding: EdgeInsets.all(10.0),
                ),
              ],
            ),
          ),
          onTap: () {
            EventBusUtil.getInstance().fire(carNumModel.rows[index]);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  //驾驶员列表
  Widget itemDriverShow() {
    return new ListView.builder(
      itemCount: driverModel.rows.length,
      itemBuilder: (BuildContext context, int i) {
        return GestureDetector(
          child: Container(
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
                        driverModel.rows[i].name,
                        style: TextStyle(fontSize: 14.0, color: Colors.black54),
                      ),
                      Expanded(
                        child: Row(),
                      ),
                      Text(
                        driverModel.rows[i].phone,
                        style: TextStyle(fontSize: 14.0, color: Colors.black54),
                      )
                    ],
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Padding(
                  child: new Text(driverModel.rows[i].deptNameCount,
                      style: TextStyle(fontSize: 14.0, color: Colors.black)),
                  padding: EdgeInsets.all(10.0),
                ),
              ],
            ),
          ),
          onTap: () {
            EventBusUtil.getInstance().fire(driverModel.rows[i]);
            Navigator.pop(context);
          },
        );
      },
    );

  }

  //焚烧厂列表
  Widget itemBurnShow() {
    return new ListView.builder(
      itemCount: burnModel.rows.length,
      itemBuilder: (BuildContext context, int i) {
        return GestureDetector(
          child: Container(
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
                  child: new Text(burnModel.rows[i].nameFsc,
                      style: TextStyle(fontSize: 14.0, color: Colors.black)),
                  padding: EdgeInsets.all(5.0),
                ),
              ],
            ),
          ),
          onTap: () {
            EventBusUtil.getInstance().fire(burnModel.rows[i]);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  //获取压缩站数据
  Future getCompressStations() async {
    FormData formData = new FormData.from({
      "pageNum": "0",
      "pageSize": "-1",
    });
    ResultData res = await HttpManager.getInstance()
        .get(HttpRequestUrl.URL_ALL_COMPRESS, formData);
    if (res.isSuccess) {
      CompressMode compress=CompressMode.fromJson(res.data);
      setState(() {
        compressMode=compress;
        itemCount=compress.rows.length*2;
      });
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
        .get(HttpRequestUrl.URL_CAR_NUM, formData);
    if (res.isSuccess) {
      setState(() {
        carNumModel=CarNumModel.fromJson(res.data);
        itemCount=carNumModel.rows.length*2;
      });
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
        .get(HttpRequestUrl.URL_BURN_STATION, formData);
    if (res.isSuccess) {
      setState(() {
        burnModel= BurnModel.fromJson(res.data);
        itemCount=burnModel.rows.length*2;
      });
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
      "idSysdept": SPUtil.getString(SPUtil.SP_USER_IDSYSDEPT), //组织机构id
    });
    ResultData res = await HttpManager.getInstance()
        .get(HttpRequestUrl.URL_DRIVER, formData);
    if (res.isSuccess) {
      setState(() {
        driverModel= DriverModel.fromJson(res.data);
        itemCount=driverModel.rows.length*2;
      });
    } else {
      Fluttertoast.showToast(msg: res.data.toString());
    }
  }

  void _initSp() async{
    await SPUtil.getInstance();
  }
}
