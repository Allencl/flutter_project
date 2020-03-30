import 'package:flutter/material.dart';

import './home.dart';       // 首页
import './view/list.dart';  // 列表

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            routes: <String, WidgetBuilder> {
              '/': (BuildContext context) => HomePage(),
              '/list': (BuildContext context) => ListPage(),

            },               
        );
    }
}

