import 'package:flutter/material.dart';
import 'package:wis_flutter/bottomBar.dart';     // 底部导航条



// 消息提示
class TooltipPage extends StatefulWidget {

  TooltipPage({Key key}) : super(key: key);

  @override
  _TooltipPageState createState() => _TooltipPageState();
}

class _TooltipPageState extends State<TooltipPage> {




    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar( title: const Text('消息提示') ),  // 头部导航条
          bottomNavigationBar: BottomBarWidget(),       // 底部导航条
          backgroundColor: Colors.blue[10],
          body: Builder(builder: (BuildContext context) {
            return Wrap(
              children: <Widget>[
                FlatButton(
                  onPressed: (){
                    final snackBar = SnackBar(
                      backgroundColor: Colors.blue[500],
                      content: Row(
                        children: <Widget>[
                          Icon(Icons.check),
                          Text('  下载成功')
                        ],
                      ),
                      duration: Duration(seconds: 3),  // 延时
                      action: SnackBarAction(
                        label: '撤消',
                        textColor: Colors.white,
                        onPressed: () {}
                      ),
                      // behavior: SnackBarBehavior.floating, 
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                  child: Text("底栏提示-固定底栏"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4)
                  ),
                ),


                FlatButton(
                  onPressed: (){
                    final snackBar = SnackBar(
                      backgroundColor: Colors.blue[500],
                      content: Row(
                        children: <Widget>[
                          Icon(Icons.check),
                          Text('  下载成功')
                        ],
                      ),
                      duration: Duration(seconds: 3),  // 延时
                      action: SnackBarAction(
                        label: '撤消',
                        textColor: Colors.white,
                        onPressed: () {}
                      ),
                      behavior: SnackBarBehavior.floating, 
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                  child: Text("底栏提示-悬浮底栏"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4)
                  ),
                )


              ]
            );
          })
      ); 
    }
}




