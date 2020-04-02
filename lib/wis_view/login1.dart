import 'package:flutter/material.dart';



// 登录页
class LoginPage extends StatefulWidget {
    @override
    _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

    //获取Key用来获取Form表单组件
    // TextEditingController _userName = new TextEditingController();
    GlobalKey<FormState> loginKey = new GlobalKey<FormState>();

    String userName;
    String password;

    bool clearUser = false;         // 清空用户
    bool isShowPassWord = false;    // 显示密码


    void onLogin(){
        //读取当前的Form状态
        var loginForm = loginKey.currentState;

        //验证Form表单
        if(loginForm.validate()){
          // loginForm.save();
          print('userName: ' + userName + ' password: ' + password);
        }
    }

    // 显示密码
    void showPassWord() {
        setState(() {
            isShowPassWord = !isShowPassWord;
        });
    }

    // 清空用户
    void onClearUser(){
      // print(userName);
      // print("333");
      // setState(() {
      //     // clearUser = true;
      //     // _userName.text = "";
      // });
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
                  key: loginKey,
                  autovalidate: true,
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(218,222,224,0.6),
                              width: 1.0
                            )
                          )
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: '请输入账号',
                            labelStyle: TextStyle( 
                                fontSize: 14, 
                                color: Color.fromARGB(255, 93, 93, 93)
                            ),
                            border: InputBorder.none,
                            // suffixIcon: clearUser ? IconButton(
                            //     icon: Icon(
                            //       Icons.close,
                            //       color: Color.fromARGB(255, 126, 126, 126), 
                            //     ),
                            //     onPressed: onClearUser,
                            // ):null,
                          ),
                          // onChanged: (value){
                          //       setState(() {
                          //             clearUser = (value.length !=0)?true:false;
                          //       });
                          // } 
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(218,222,224,0.6),
                              width: 1.0
                            )
                          )
                        ),
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '请输入密码',
                              labelStyle: TextStyle( 
                                  fontSize: 14.0, 
                                  color: Color.fromARGB(255, 93, 93, 93)
                              ),
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isShowPassWord ? Icons.visibility : Icons.visibility_off,
                                  color: Color.fromARGB(255, 126, 126, 126), 
                                ),
                                onPressed: showPassWord,
                              )
                            ),
                          obscureText: !isShowPassWord,
                          onSaved: (value) {
                            password = value;
                          },
                        ),
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



                      // Container(
                      //   margin: EdgeInsets.only(top: 30.0),
                      //   padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: <Widget>[
                      //       Container(
                      //         child:  Text(
                      //           '注册账号',
                      //           style: TextStyle(
                      //             fontSize: 13.0,
                      //             color: Color.fromARGB(255, 53, 53, 53)
                      //           ),
                      //         ),
                              
                      //       ),
                          
                      //       Text(
                      //         '忘记密码？',
                      //         style: TextStyle(
                      //           fontSize: 13.0,
                      //           color: Color.fromARGB(255, 53, 53, 53)
                      //         ),
                      //       ),
                      //     ],
                      //   ) ,
                      // ),
                      
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
}

