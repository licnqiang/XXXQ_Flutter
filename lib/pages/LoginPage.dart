
import 'package:flutter/material.dart';

/**
 * 登录页
 */
class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new LoginPageState();
  }

}

class LoginPageState extends State<LoginPage>{


  String _name,_password;
  bool _isObscure = true;
  Color _eyeColor;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            children: <Widget>[
              SizedBox(height: kToolbarHeight,),
              buildTitle(),
              SizedBox(height: 70.0,),
              buildNameTextField(),
              SizedBox(height: 70.0,),
              buildPasswordTextField(context),
              SizedBox(height: 60.0),
              buildLoginButton(context),
              SizedBox(height: 30.0),

            ],
      )),
      
    );
  }


  Align buildLoginButton(BuildContext context){
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: RaisedButton(
          child: Text(
            '登录',
              style: TextStyle(color: Colors.white,fontSize: 20.0),
          ),
          color: Colors.blue,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              ///只有输入的内容符合要求通过才会到达此处
              _formKey.currentState.save();
              //TODO 执行登录方法
              print('name:$_name , password:$_password');
            }
          },
          shape: StadiumBorder(side: BorderSide()),
        ),
      ),
    );
  }



  TextFormField buildPasswordTextField(BuildContext context){
    return TextFormField(
      onSaved: (String value)=> _password=value,
      obscureText: _isObscure,
      validator: (String value){
        if(value.isEmpty){
          return '请输入密码';
        }
      },

      decoration: InputDecoration(
        labelText: '请输入密码',
        suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye,color: _eyeColor,),
          onPressed: (){
            setState(() {
              _isObscure = !_isObscure;
              _eyeColor = _isObscure
                  ? Colors.grey
                  : Theme.of(context).iconTheme.color;
            });
          },

        )
        ),

    );
  }

  TextFormField buildNameTextField(){
    return TextFormField(
      decoration: InputDecoration(

        labelText:'请输入用户名'),
      validator: (String value){
        if(value.isEmpty){
          return '请输入正确的用户名';
        }
      },
      onSaved: (String value) =>_name=value,
    );
  }


  Padding buildTitle(){
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('您好，请登录',style: TextStyle(fontSize: 30.0),
      ),
    );
  }


}