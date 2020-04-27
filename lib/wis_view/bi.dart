import 'package:flutter/material.dart';

import 'package:wis_flutter/bottomBar.dart';     // 底部导航条
import 'package:wis_flutter/index.dart';        // wis flutter 组件 




// 
class BIPage extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar( title: const Text('BI-报表') ),  // 头部导航条
          bottomNavigationBar: BottomBarWidget(),       // 底部导航条
          backgroundColor: Colors.blue[10],
          body: ListView(
              children: <Widget>[
                  WisPieChart2(),    // 饼图1
                  WisPieChart1(),     // 饼图2

                  WisBarChart1(),     // 条形图1
                  WisBarChart2(),     // 条形图2

                  WisLineChart1(),    // 折线图
                 
              ],
          )
      ); 
    }
}








