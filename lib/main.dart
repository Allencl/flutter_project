import 'package:flutter/material.dart';


import 'package:wis_flutter/home.dart';               // 首页
import 'package:wis_flutter/wis_view/list.dart';     // 列表 展示
import 'package:wis_flutter/wis_view/login.dart';    // 登录页



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            routes: <String, WidgetBuilder> {
              '/': (BuildContext context) => HomePage(),
              '/list': (BuildContext context) => ListPage(),    // 列表
              '/login': (BuildContext context) => LoginPage(),

            },               
        );
    }
}

