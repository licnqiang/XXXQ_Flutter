import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



/*Image.asset(("images/icon_kaoqin.png"),width: 26.0,height: 26.0),
Text("我的考勤",style: TextStyle(color: Colors.black,fontSize: 15.0,)),
Image.asset(("images/icon_arraw_next.png"),width: 15.0,height: 15.0),*/

class MyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return  Container(
      color: Colors.white,
      child:
      Column(

        children: <Widget>[
//          SizedBox(height: 80.0),
          Container(
            padding: const EdgeInsets.all(15.0),
            height: 180.0,
            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[

                Container(
                  alignment: Alignment.center,
                  width: 60,
                  height: 60,
//                  color: Color.fromARGB(255, 51, 51, 51),
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  decoration:  BoxDecoration(color:Color.fromARGB(255, 51, 51, 51),borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child:
                  Text("W",style: TextStyle(color: Colors.white,fontSize: 38.0,fontWeight: FontWeight.w600)),

                ),

                Text("姓名",style: TextStyle(color: Color.fromARGB(255, 60, 60, 60),fontSize: 18.0,fontWeight: FontWeight.w600)),

              ],
            ),

          ),
            Container(
              height: 20.0,
              color: Color.fromARGB(255, 245, 245, 245)
            ),

          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(15),
            child:  Row(
              children: <Widget>[
                Image.asset(("images/icon_kaoqin.png"),width: 24.0,height: 24.0),

                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text("我的考勤",style: buildTextStyle()),
                ),

                Expanded(child:
                Container(
                  alignment:Alignment.centerRight ,
                  child: Image.asset(("images/icon_arraw_next.png"),width: 15.0,height: 15.0),
                ),
                  flex: 1,
                ),

              ],),
          ),

          Container(
              margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
              height: 1.0,
              color: Color.fromARGB(255, 245, 245, 245)
          ),

          Container(
            alignment: Alignment.center,
//            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            padding: EdgeInsets.all(15),
            child:  Row(
              children: <Widget>[
                Image.asset(("images/icon_shangbao.png"),width: 24.0,height: 24.0),

                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text("我的上报",style: buildTextStyle()),
                ),

                Expanded(child:
                Container(
                  alignment:Alignment.centerRight ,
                  child: Image.asset(("images/icon_arraw_next.png"),width: 15.0,height: 15.0),
                ),
                  flex: 1,
                ),

              ],),
          ),

          Container(
              margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
              height: 1.0,
              color: Color.fromARGB(255, 245, 245, 245)
          ),

          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(15),
            child:  Row(
              children: <Widget>[
                Image.asset(("images/icon_edit.png"),width: 24.0,height: 24.0),

                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text("信息修改",style: buildTextStyle()),
                ),

                Expanded(child:
                Container(
                  alignment:Alignment.centerRight ,
                  child: Image.asset(("images/icon_arraw_next.png"),width: 15.0,height: 15.0),
                ),
                  flex: 1,
                ),

              ],),

          ),
          Container(
              margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
              height: 1.0,
              color: Color.fromARGB(255, 245, 245, 245)
          ),


        ],
      ),

    );


  }


  //14dp,#3c3c3c TextView
  TextStyle buildTextStyle(){
    return TextStyle(color: Color.fromARGB(255, 60, 60, 60),fontSize: 14.0);
  }



}

