import 'package:flutter/material.dart';

import 'package:wis_flutter/bottomBar.dart';     // 底部导航条
import 'package:wis_flutter/index.dart';        // wis flutter 组件 



// 
class BtnPage extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar( title: const Text('按钮') ),  // 头部导航条
          bottomNavigationBar: BottomBarWidget(),       // 底部导航条
          backgroundColor: Colors.blue[10],
          body: Wrap(
              children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(flex: 2,child: Text('')),
                      Expanded(
                        flex: 5,
                        child: FlatButton(
                            onPressed: (){
                              
                            },
                            child: Text("扁平按钮"),
                            color: Colors.blue,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(4)),
                        )
                      ),
                      Expanded(flex: 2,child: Text(''))
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FloatingActionButton(
                          onPressed: (){
                            print('button click');
                          },
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.add),
                        ) 
                      )
                    ],
                  ),
                  
                  // Row(
                  //   children: <Widget>[
                  //     Expanded(
                  //       child: FloatingActionButton.extended(
                  //         onPressed: () {
                  //           print('button click');
                  //         },
                  //         foregroundColor: Colors.white,
                  //         backgroundColor: Colors.blue,
                  //         icon: Icon(
                  //           Icons.flag,
                  //           color: Colors.red
                  //         ),
                  //         label: Text('带Icon', maxLines: 1),
                  //       )  
                  //     )                 // Container(
                  //   ],
                  // )
                 
                  // Container(
                  //   child: FloatingActionButton.extended(
                  //     onPressed: () {
                  //       print('button click');
                  //     },
                  //     foregroundColor: Colors.white,
                  //     backgroundColor: Colors.blue,
                  //     icon: CircleAvatar(
                  //       backgroundImage: AssetImage('assets/images/img3.jpg'),
                  //     ),
                  //     label: Text('带图片的按钮', maxLines: 1),
                  //   )  
                  // ),







              ]
          )
      ); 
    }
}




