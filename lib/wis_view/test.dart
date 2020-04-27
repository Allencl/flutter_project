import 'package:flutter/material.dart';

import 'package:wis_flutter/bottomBar.dart';     // 底部导航条



// 
class TestPage extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar( title: const Text('测试') ),  // 头部导航条
          bottomNavigationBar: BottomBarWidget(),       // 底部导航条
          backgroundColor: Colors.blue[10],
          body: ListView(
              children: <Widget>[
                  Text('111')

                 
              ],
          )
      ); 
    }
}




