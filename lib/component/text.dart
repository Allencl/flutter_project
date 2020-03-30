import 'package:flutter/material.dart';


// 行标题
class TextLabelLine extends StatelessWidget{

    final String text;

    TextLabelLine({
        Key key,
        this.text,
    }) : super(key: key);  

    @override
    Widget build(BuildContext context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8,8,8,8),
          child:Text(
          '$text',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            // height: 2,
            color: const Color.fromRGBO(81,90,110,1),
            fontWeight: FontWeight.w400,
          ),
        ));
    }  
}