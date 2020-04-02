import 'package:flutter/material.dart';



// 登录页
class LoginPage extends StatefulWidget {
    @override
    _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

    final _formKey = GlobalKey<FormState>();

    TextEditingController _nameController =  TextEditingController();     // 账号
    TextEditingController _passwordController =  TextEditingController(); // 密码


    bool isShowPassWord = false;    // 显示密码


    // 显示密码
    void onShowPassWord() {
        setState(() {
            isShowPassWord = !isShowPassWord;
        });
    }

    // 登录
    void onLogin(){
        
        //读取当前的Form状态
        var loginForm = _formKey.currentState;

        // //验证Form表单
        if(loginForm.validate()){
          print("登录了");
          print(_nameController.text);
          print(_passwordController.text);
        }
    }    

    @override
    Widget build(BuildContext context){
      return new MaterialApp(
        title: '登录页',
        home: Scaffold(
          body: ListView(
            children: <Widget>[
                Container(
                    padding: const EdgeInsets.fromLTRB(16,90,16,0),
                    child: new Text(
                        'WIS',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(40, 122, 230, 1),
                            fontSize: 50.0,
                            fontStyle: FontStyle.italic
                            // fontFamily: 'song'
                        ),
                    )
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(16,16,16,16),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                                labelText: '请输入账号',
                                labelStyle: TextStyle( 
                                    fontSize: 14.0, 
                                    color: Color.fromARGB(255, 93, 93, 93)
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                //获得焦点下划线设为蓝色
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),                                
                                // border: InputBorder.none,
                                // suffixIcon: IconButton(
                                //     icon: Icon(
                                //       Icons.close,
                                //       color: Color.fromARGB(255, 126, 126, 126), 
                                //     ),
                                //     // onPressed: onClearUser,
                                // ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return '账号不能为空';
                              }
                              return null;
                            },
                          ),

                          TextFormField(  
                              controller: _passwordController,
                              decoration: InputDecoration(
                                  labelText: '请输入密码',
                                  labelStyle: TextStyle( 
                                      fontSize: 14.0, 
                                      color: Color.fromARGB(255, 93, 93, 93)
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      isShowPassWord ? Icons.visibility : Icons.visibility_off,
                                      color: Color.fromARGB(255, 126, 126, 126), 
                                    ),
                                    onPressed: onShowPassWord,
                                  )
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return '密码不能为空';
                                }
                                return null;
                              },
                              obscureText: !isShowPassWord,
                          ),

                        // 登录按钮 
                        Container(
                          height: 45.0,
                          margin: EdgeInsets.only(top: 40.0),
                          child: SizedBox.expand(   
                            child: RaisedButton(
                              onPressed: onLogin,
                              color: Color.fromRGBO(40, 122, 230, 1),
                              child: Text(
                                '登录',
                                style: TextStyle(
                                  letterSpacing:16.0,
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ), 
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(45.0)
                              ),
                            ), 
                          ),  
                        ),


                        ],
                      ),
                  )
                )
            ],
          ),
        ),
      );
    }
}

