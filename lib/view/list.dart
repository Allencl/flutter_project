import 'package:flutter/material.dart';

import '../bottomBar.dart';                      // 底部导航条
import '../component/listTableCross.dart';       // table 横向  
import '../component/listTableVertical.dart';    // table 纵向  

import '../component/text.dart';                // 标题栏



// 列表
class ListPage extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar( title: const Text('列表-展示') ),  // 头部导航条
          bottomNavigationBar: BottomBarWidget(),       // 底部导航条
          backgroundColor: Colors.blue[10],
          body: ListView(
              children: <Widget>[
                  TextLabelLine(text:'Table-横向'),
                  ListPageTableCross(
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


                  TextLabelLine(text:'Table-纵向'),
                  ListPageTableVertical(
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

                  // TextLabelLine(text:'Table-横向'),
                  // ListPageTableCross(),   // table 横向

                  // TextLabelLine(text:'Table-横向'),
                  // ListPageTableCross(),   // table 横向
                  
                  Divider(height:20.0),

                 
              ],
          )
      ); 
    }
}




