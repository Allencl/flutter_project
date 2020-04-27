import 'package:flutter/material.dart';
import 'package:wis_flutter/bottomBar.dart';     // 底部导航条



// 弹框页面
class DialogPage extends StatefulWidget {
  DialogPage({Key key}) : super(key: key);

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {

    void _onDialog2(context){
      showDialog<Null>(
          context: context,
          builder: (BuildContext context) {
              return SimpleDialog(
                  title: Text('选择'),
                  children: <Widget>[
                      SimpleDialogOption(
                          child: Text('选项 1'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                      ),
                      SimpleDialogOption(
                          child: Text('选项 2'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                      ),
                  ],
              );
          },
      ).then((val) {
          print(val);
      });
    }



    void _onDialog1(context){
        showDialog<Null>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
                return AlertDialog(
                    title: Text('标题'),
                    content: SingleChildScrollView(
                        child: ListBody(
                            children: <Widget>[
                                Text('内容 1'),
                                Text('内容 2'),
                            ]
                        ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('取消'),
                        onPressed:(){
                          Navigator.of(context).pop(); 
                        }
                      ),                        
                      FlatButton(
                        child: Text('确定'),
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                );
            },
        ).then((val) {
            print(val);
        });      
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar( title: const Text('弹框') ),  // 头部导航条
          bottomNavigationBar: BottomBarWidget(),       // 底部导航条
          backgroundColor: Colors.blue[10],
          body: Wrap(
              children: <Widget>[
                FlatButton(
                  onPressed: (){
                      this._onDialog2(context);   
                  },
                  child: Text("普通-弹框"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4)),
                ),

                FlatButton(
                  onPressed: (){
                      this._onDialog1(context);   
                  },
                  child: Text("带按钮-弹框"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4)),
                )


              ]
          )
      ); 
    }
}




