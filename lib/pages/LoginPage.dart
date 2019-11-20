
import 'package:flutter/material.dart';
import 'package:xxxq_flutter/main.dart';

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

  //手机号的控制器
  TextEditingController nameController = TextEditingController();

  //密码的控制器
  TextEditingController pwdController = TextEditingController();

  String _name,_password;
  bool _isObscure = true;
  Color _eyeColor;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(home:
      Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/xh.png"),
                  fit: BoxFit.cover,
          ),
          ),
          child: Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                children: <Widget>[
                  SizedBox(height: kToolbarHeight,),
                  buildTitle(),
                  SizedBox(height: 80.0),
                  buildNameTextField(),
                  SizedBox(height: 50.0),
                  buildPasswordTextField(context),
                  SizedBox(height: 60.0),
                  buildLoginButton(context),

                ],
              )),
        ),
      ) ,);

  }


  Align buildLoginButton(BuildContext context){
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: RaisedButton(
          child: Text(
            '登录',
              style: TextStyle(color: Colors.white,fontSize: 18.0),
          ),
          color: Colors.blue,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              ///只有输入的内容符合要求通过才会到达此处
              _formKey.currentState.save();
              //TODO 执行登录方法
              print({'name':nameController.text,'pwd':pwdController.text});

              Navigator.push(context, new MaterialPageRoute(builder: (context)=>new MyApp()));

            }
          },
//          shape: StadiumBorder(side: BorderSide(color: Colors.blue)),
        shape: const RoundedRectangleBorder(
          side: BorderSide.none,borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        ),
      ),
    );
  }



  ConstrainedBox buildPasswordTextField(BuildContext context){

    return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 45,
          maxWidth: 200,
        ),

      child: new TextField(
        obscureText: _isObscure,
        decoration: InputDecoration(

          contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
          hintText: '请输入密码',
          hintStyle: TextStyle(color: Color.fromARGB(255, 91, 91, 91),fontSize: 14.0),

          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye,color: _eyeColor,),
          onPressed: () {
            setState(() {
            _isObscure = !_isObscure;
             _eyeColor = _isObscure
            ? Colors.grey
           : Theme.of(context).iconTheme.color;
    });
           },
        ),

        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none),
        filled: true,
        fillColor:Color.fromARGB(77, 255, 255, 255),//内部颜色
      ),

        controller: pwdController,
      ),
    );


/*    return TextFormField(
      onSaved: (String value)=> _password=value,
      obscureText: _isObscure,
      validator: (String value){
        if(value.isEmpty){
          return '请输入密码';
        }
      },

      decoration: InputDecoration(
        hintText: '请输入密码',
        hintStyle: TextStyle(color: Color.fromARGB(255, 91, 91, 91),fontSize: 14.0),
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

    );*/
  }

  ConstrainedBox buildNameTextField(){

    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: 45,
          maxWidth: 200
      ),
      child: new TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
          hintText: '请输入用户名',
            hintStyle: TextStyle(color: Color.fromARGB(255, 91, 91, 91),fontSize: 14.0),
          prefixIcon: Icon(Icons.perm_identity),
          // contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          filled: true,
          fillColor:Color.fromARGB(77, 255, 255, 255),//内部颜色

        ),

        controller: nameController,
      ),

    );

/*    return TextFormField(
      decoration: InputDecoration(
      hintText:'请输入用户名',
       hintStyle: TextStyle(color: Color.fromARGB(255, 91, 91, 91),fontSize: 14.0),

      ),
      validator: (String value){
        if(value.isEmpty){
          return '请输入正确的用户名';
        }
      },
      onSaved: (String value) =>_name=value,
    );*/
  }


  Padding buildTitle(){
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('您好，请登录',style: TextStyle(fontSize: 28.0,color: Colors.white,fontWeight: FontWeight.w600),

      ),
    );
  }


}