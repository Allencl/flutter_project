import 'package:flutter/material.dart';


import 'package:wis_flutter/bottomBar.dart';    // 底部导航条
import 'package:wis_flutter/drawerLeft.dart';   // 左边侧栏

import 'package:wis_flutter/index.dart';        // wis flutter 组件 



// 首页
class HomePage extends StatefulWidget {

    HomePage({
        Key key,
    }) : super(key: key);

    @override
    _HomePageState createState() => new _HomePageState();
}


class _HomePageState extends State<HomePage> {


    @override
    Widget build(BuildContext context) {

      return Scaffold(
          // appBar: AppBar( title: const Text('首页') ),  // 头部导航条
          bottomNavigationBar: BottomBarWidget(),       // 底部导航条
          drawer:  DrawerLeftPage(),   
          backgroundColor: Colors.blue[10],
          body: CustomScrollView(
              slivers: [

                // 自定义 导航条
                WisSliverAppBar(
                  title:'WIS Home',
                  height:200,
                  backgroundImage: Image.asset("assets/images/img2.png", fit: BoxFit.fill),
                  actions: <Widget>[
                      IconButton(
                        icon: Icon(Icons.timeline),
                        onPressed: () {
                          print("点了");
                          Navigator.pushNamed(context,"/BI");
                        },
                      ),
                      PopupMenuButton(
                        icon: Icon(Icons.more_horiz),  
                        onSelected: (value){
                          switch (value) {
                            case 'BI':
                              Navigator.pushNamed(context,"/BI");
                              break;
                            case 'news':
                              Navigator.pushNamed(context,"/textImage");
                              break;
                            default:
                          }
                        },
                        itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                            value: 'BI',
                            child: Row(children: <Widget>[
                              Padding( 
                                padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                                child: Icon(Icons.timeline,color: Colors.black54 )
                              ),
                              Text('报表')
                            ])
                          ),
                          PopupMenuItem(
                            value: 'news',
                            child: Row(children: <Widget>[
                              Padding( 
                                padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                                child: Icon(Icons.flag,color: Colors.black54 )
                              ),
                              Text('消息页面')
                            ])
                          ),
                        ],
                      ),
                  ],                  
                ),  



                // 左右滑动栏
                WisSlideBoxRight(
                  onClick: (option){
                    // 查看详情 回调
                    print(option);
                    Navigator.pushNamed(context,"/textImage");

                  },
                  data:[
                    {
                      "title":"重要的消息",
                      "content":"临时的消息，需要今天处理的消息。",
                      "time":"2020年03月22 21:01",
                      "mark":1
                    },
                    {
                      "title":"未处理的消息",
                      "content":"上周未处理的消息。",
                      "time":"2020年01月21 12:22",
                      "mark":2
                    },
                    {
                      "title":"普通的消息",
                      "content":"一些普通的消息，待处理。",
                      "time":"2020年02月18 01:22"
                    }
                  ]
                ),


                SliverList(
                    delegate: SliverChildListDelegate(
                      [

                        // 轮播图 图片
                        WisCarousel(
                          // height:100,       // 高度默认 100
                          // autoScroll:true,  // 是否轮播
                          // seconds:5,          // 轮播间隔
                          onClick:(option){
                            print(option);
                            Navigator.pushNamed(context,"/textImage");
                          },
                          children:[
                            {
                              "assets":"assets/images/img2.png",
                              // "src":"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1570190499,3408240602&fm=26&gp=0.jpg"
                            },
                            {
                              "assets":"assets/images/img1.jpeg",
                              // "src":"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3241219306,1400876595&fm=26&gp=0.jpg"
                            }
                          ]
                        ), 


                        // 轮播图 文本
                        WisCarousel(
                          height:100,       // 高度默认 100
                          // autoScroll:true,  // 是否轮播
                          // seconds:5,          // 轮播间隔
                          type: 'text',        // 类型
                          onClick:(option){
                            print(option);
                            Navigator.pushNamed(context,"/textImage");

                          },
                          children:[
                            {
                              "assets":"assets/images/img3.jpg",
                              // "src":"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3241219306,1400876595&fm=26&gp=0.jpg",
                              "contents":[
                                "有一条消息未读有一条消息未读有一条消息未读有一条消息未读有一条消息未读有一条消息未读",
                                "有一条消息未读有一条消息未读有一条消息未读有一条消息未读有一条消息未读有一条消息未读",
                                "有一条消息未读有一条消息未读有一条消息未读有一条消息未读有一条消息未读有一条消息未读"
                                "有一条消息未读有一条消息未读有一条消息未读有一条消息未读有一条消息未读有一条消息未读"
                                "有一条消息未读有一条消息未读有一条消息未读有一条消息未读有一条消息未读有一条消息未读"
                                "有一条消息未读有一条消息未读有一条消息未读有一条消息未读有一条消息未读有一条消息未读"
                              ]
                            },
                            {
                              "icon": Icons.chat_bubble,
                              "contents":[
                                "2019/11/11有一条消息未读有一条消息未读有一条消息未读有一条消息未读有一条消息未读有一条消息未读",
                              ]
                            }
                          ]
                        ), 


                        // 首页 body iocn 卡片
                        Container(
                          padding: EdgeInsets.fromLTRB(8,8,8,8),
                          margin: EdgeInsets.fromLTRB(8,8,8,8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(4.0)),
                              border:Border.all(
                                width:1,color:Color(0xffe5e5e5) 
                              )
                          ),
                          child: WisHomeBody(
                            title:'页面示例',
                            onClick:(option){
                              // 点击事件
                              print(option);
                            },
                            children:[
                              {
                                "text":"Table",
                                "icons": Icons.view_list,
                                "navigatorTarget": "/table"   // 跳转页面
                              },
                              {
                                "text":"查询页面",
                                "icons": Icons.search,
                                "navigatorTarget": "/search"
                              },
                              {
                                "text":"Tab页面",
                                "icons": Icons.tab,
                                "color":Colors.pink,
                                "navigatorTarget": "/tab"
                              },                              
                              {
                                "text":"表单示例",
                                "icons": Icons.text_format,
                                "color":Colors.yellow,
                                "navigatorTarget": "/form"
                              },
                              {
                                "text":"图文页面",
                                "icons": Icons.view_list,
                                "navigatorTarget": "/textImage"   // 跳转页面
                              },
                              {
                                "text":"产品展示",
                                "icons": Icons.search,
                                "color": Colors.deepPurple, 
                                "navigatorTarget": "/productToggle"
                              },
                              {
                                "text":"按钮组",
                                "icons": Icons.backup,
                                "color": Colors.yellowAccent, 
                                "navigatorTarget": "/btn"
                              },                              
                              {
                                "text":"测试页面",
                                "icons": Icons.text_format,
                                "navigatorTarget": "/test"
                              }
                            ]
                          )
                        ),

                        // 首页 body 数字 卡片
                        Container(
                          padding: EdgeInsets.fromLTRB(8,8,8,8),
                          margin: EdgeInsets.fromLTRB(8,8,8,8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(4.0)),
                              border:Border.all(
                                width:1,color:Color(0xffe5e5e5) 
                              )
                          ),
                          child: WisHomeBody(
                            type:'number',
                            title:'报表示例',
                            onClick:(option){
                              // 点击事件
                              print(option);
                            },                            
                            children:[
                              {
                                "navigatorTarget": "/BI",
                                "text":"全年总额",
                                "number": 7888,
                                "color":Colors.yellow,
                              },
                              {
                                "navigatorTarget": "/BI",
                                "text":"第一季度",
                                "number": 2121,
                                "color":Colors.red
                              },
                              {
                                "navigatorTarget": "/BI",
                                "text":"第二季度",
                                "number": 687776,

                              },
                              {
                                "navigatorTarget": "/BI",
                                "text":"第三季度",
                                "number": 654322,
                                "color":Colors.orange
                              },
                              {
                                "navigatorTarget": "/BI",
                                "text":"第四季度",
                                "number": 1654322,
                              },
                              {
                                "navigatorTarget": "/BI",
                                "text":"其他的",
                                "number": 1654322,
                                "color":Colors.green
                              }
                            ]
                          )
                        ),


                        // 首页 body
                        Container(
                          padding: EdgeInsets.fromLTRB(8,8,8,8),
                          margin: EdgeInsets.fromLTRB(8,8,8,8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(4.0)),
                              border:Border.all(
                                width:1,color:Color(0xffe5e5e5) 
                              )
                          ),
                          child: WisHomeBody(
                            title:'功能示例',
                            children:[
                              {
                                "text":"弹框",
                                "icons": Icons.directions,
                                "navigatorTarget": "/dialog"   // 跳转页面
                              },
                              {
                                "text":"消息提示",
                                "icons": Icons.message,
                                "navigatorTarget": "/tooltip"
                              },
                              {
                                "text":"表单示例",
                                "icons": Icons.text_format,
                                "navigatorTarget": "/form"
                              },


                              {
                                "text":"Table",
                                "icons": Icons.view_list,
                                "navigatorTarget": "/table"   // 跳转页面
                              },
                              {
                                "text":"查询页面",
                                "icons": Icons.search,
                                "navigatorTarget": "/search"
                              },
                              {
                                "text":"表单示例",
                                "icons": Icons.text_format,
                                "navigatorTarget": "/form"
                              }
                            ]
                          )
                        ),


                        // // 底线
                        WisDivider(
                          text: "到底了",
                        )

                      ],
                    ),
                ),

              ],
          )
      ); 


      // return Scaffold(
      //     appBar: AppBar( title: const Text('首页') ),  // 头部导航条
      //     bottomNavigationBar: BottomBarWidget(),       // 底部导航条
      //     drawer:  DrawerLeftPage(),   
      //     backgroundColor: Colors.blue[10],
      //     body: ListView(
      //         children: <Widget>[
                  
      //             WisTextLabelLine( text: "功能示例" ),
      //             // Divider(height:20.0),
              // 首页body
      //             ),                  
      //         ],
      //     )
      // ); 
    }
}


