import 'package:flutter/material.dart';

import './bottomBar.dart';     // 底部导航条
import './drawerLeft.dart';    // 左边侧栏


// 首页
class HomePage extends StatelessWidget {

    @override
    Widget build(BuildContext context) {

      return Scaffold(
          appBar: AppBar( title: const Text('首页') ),  // 头部导航条
          bottomNavigationBar: BottomBarWidget(),       // 底部导航条
          drawer:  DrawerLeftPage(),   
          backgroundColor: Colors.blue[10],
          body: ListView(
              children: <Widget>[
                  Container(
                    child: _HomePageHead()   // 首页头部
                  ),
                  
                  // Divider(height:20.0),

                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          border: Border.all(width:1,color:Colors.white),
                      ),
                      margin: EdgeInsets.fromLTRB(8,8,8,8),
                      padding: EdgeInsets.fromLTRB(8,8,8,8),
                      child: _HomePageBody() // 首页body
                  ),                  
              ],
          )
      ); 
    }
}



// 首页 头部 
class _HomePageHead extends StatelessWidget{

    @override
    Widget build(BuildContext context) {
        return  Row(
            children: <Widget>[
                Expanded( child: Text("33")),
                Expanded( child: Text("55")),
            ]
        ); 
    }  
}



// 首页 body 
class _HomePageBody extends StatelessWidget{

    @override
    Widget build(BuildContext context) {
        return  Wrap(
            spacing: 10.0, 
            runSpacing: 10.0, 
            children: <Widget>[
                _HomePageBodyICON(
                    text:"列表",
                    name:"list",
                    icons: Icons.view_list,
                    navigatorTarget: "/list"
                ),
                _HomePageBodyICON(
                    text:"列表1",
                    name:"detail22",
                    icons: Icons.view_list,
                    navigatorTarget: "/list"
                )
            ]
        ); 
    }  
}


// 首页 body ICON
class _HomePageBodyICON extends StatelessWidget{

    final String text;
    final String name;
    final IconData icons;
    final String navigatorTarget;

    _HomePageBodyICON({
        Key key,
        this.text,
        this.name,
        this.icons = Icons.accessible,
        this.navigatorTarget
    }) : super(key: key);




    @override
    Widget build(BuildContext context) {
        return InkWell(
            onTap:(){
                Navigator.pushNamed(context,"$navigatorTarget");
            },
            child: Container(
                width: 80,
                height: 80,
                padding: EdgeInsets.fromLTRB(8,8,8,8),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    border: Border.all(width:1,color:const Color.fromRGBO(232, 234, 236,1)),
                ),
                child: Column(
                    children: <Widget>[
                        Icon(
                            icons,
                            size: 32,
                            color:Colors.green,
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0,3,0,0),
                            child: Text(
                                "$text",
                                style: TextStyle(
                                    letterSpacing: 1.0, 
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500, 
                                    color: const Color.fromRGBO(58,58,58,1)
                                ),
                            ),                    
                        )
                    ], 
                )
            )
        );  
        

    }

}
