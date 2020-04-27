import 'package:flutter/material.dart';


// 线  横向
class DividerCrosswise extends StatelessWidget{

    final String text;

    DividerCrosswise({
        Key key,
        this.text,
    }) : super(key: key);  

    @override
    Widget build(BuildContext context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(8,16,8,16),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Divider()
              ),       

              Text(
                ( this.text!=null )?'   ${this.text}   '.toString():''
              ),        

              Expanded(
                  child: Divider()
              ),
            ]
          ),  
        );
    }  
}