
import 'package:flutter/material.dart';

//人员列表
class UserListPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new UserListState();
  }


}

class UserListState extends State<UserListPage>{
  @override
  void initState() {
    super.initState();

    getData();
  }


  void getData() async{
    try{

//      var respone= await HttpUtil().get(Api.HOME_NEWS_LIST_URL, Api.BASE_OUTER_URL,data: {"pageNum":"1","pageSize":"30"});


    }catch(e){
      print(e);
    }

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         child: Text("人员列表"),

       ),

    );
  }



}