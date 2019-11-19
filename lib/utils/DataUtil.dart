import 'package:shared_preferences/shared_preferences.dart';

/**
 * 数据保存
 */
class DataUtil{

  static const String SP_TOKEN ="token";
  static const String SP_USER_ID ="user_id";


  // 保存用户登录信息，data中包含了token等信息
  static saveLoginInfo(Map data)async{
    if(data!=null){
      SharedPreferences sp = await SharedPreferences.getInstance();
      String token=data['token'];
      await sp.setString(SP_TOKEN, token);
      String userId=data['user_id'];
      await sp.setString(SP_USER_ID, userId);
    }
  }


  //清除登录信息
  static clearLoginInfo() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    /*await sp.setString(SP_TOKEN, "");
    await sp.setString(SP_USER_ID, "");*/
    sp.clear();


  }

}