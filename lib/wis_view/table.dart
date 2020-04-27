import 'package:flutter/material.dart';

import 'package:wis_flutter/bottomBar.dart';     // 底部导航条
import 'package:wis_flutter/index.dart';        // wis flutter 组件 



// 列表
class TablePage extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar( title: const Text('列表-展示') ),  // 头部导航条
          bottomNavigationBar: BottomBarWidget(),       // 底部导航条
          backgroundColor: Colors.blue[10],
          body: ListView(
              children: <Widget>[
                  WisTextLabelLine(text:'Table-横向'),
                  WisListPageTableCross(
                      columns:[
                          { "key":"name1","name":"姓名" },
                          { "key":"name2","name":"时间" },
                      ],
                      data:[
                          {
                            "name1": "的111111111111111111",
                            "name2": "多1111111111111111111岁的",
                          },
                          {
                            "name1": "尔尔",
                            "name2": "突然一天",
                          }
                      ]
                  ),



                  WisTextLabelLine(text:'Table-纵向'),
                  WisListPageTableVertical(
                      data:[
                          {
                            "name": "姓名",
                            "value": "你的那份",
                          },
                          {
                            "name": "尔姓名姓",
                            "value": "sdaasass",
                          }
                      ]                    
                  ),


                 
              ],
          )
      ); 
    }
}




