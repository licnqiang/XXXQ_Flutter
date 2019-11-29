
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xxxq_flutter/constants/Constants.dart';
import 'package:xxxq_flutter/http/HttpManager.dart';
import 'package:xxxq_flutter/http/HttpRequestUrl.dart';
import 'package:xxxq_flutter/http/ResultData.dart';
import 'package:xxxq_flutter/model/ContactModel.dart';
import 'package:xxxq_flutter/widgets/TitleBar.dart';

//人员列表
class UserListPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new UserListState();
  }


}

class UserListState extends State<UserListPage>{

  int _page = 0;
  List<Rows> dataList=List();

  @override
  void initState() {
    super.initState();

    getData();
  }


  void getData() async{
    ResultData res  =await  HttpManager.getInstance().get(HttpRequestUrl.URL_FIND_ALL_USER, {"pageNum":_page,"pageSize":Constants.PAGE_SIZE});
    if(res.isSuccess){
      ContactModel contactModel=ContactModel.fromJson(res.data);
      setState(() {
        if(_page==0){
          dataList.clear();
        }else{
          if(contactModel.rows.length<1){
            Fluttertoast.showToast(msg: "暂无更多");
          }
        }
        dataList.addAll(contactModel.rows);
      });
    }else{
      Fluttertoast.showToast(msg: res.data.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: TitleBar().backAppbar(context, "人员列表"),

       body: EasyRefresh.custom(
         onRefresh: () async {
           _page=0;
           getData();
         },
         onLoad: () async {
           _page++;
           getData();

         },
         slivers: <Widget>[

            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context,index){
                  return getRow(context,index);
                },
                childCount: dataList.length,
              ),
            ),

       /*   ListView.builder(
            itemBuilder: (context,index){
            return   getRow(context,index);
          },
            itemCount: dataList.length,

          )*/
         ],

       ),

    );
  }


  Widget getRow(BuildContext context,int position){

    return GestureDetector(
        child:
        Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person,size: 40,),
          ),
          title: Text(dataList[position].name),
          subtitle: Text(dataList[position].deptNameCount),
          trailing: Icon(Icons.keyboard_arrow_right),

        ),


      ),
    );
  }


}