import 'package:flutter/material.dart';


// 文本输入
class TextForm extends StatefulWidget {

    final dynamic controller;      // 表单名称
    final String label;           // lable
    final bool validator;         // 校验
    final String validatorText;   // 校验提示
    final bool readOnly;          // 只读
    final int maxLines;           // 多行文本


    TextForm({
        Key key,
        this.controller,
        this.label,
        this.validator=false,
        this.validatorText="必填",
        this.readOnly=false,
        this.maxLines=1,
    }) : super(key: key);  

    @override
    _TextFormState createState() => new _TextFormState();
}

class _TextFormState extends State<TextForm> {


    // 初始化
    void initState() {
      super.initState();
    }

    @override
    void dispose() {
      // Clean up the controller when the widget is removed from the
      // widget tree.
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: EdgeInsets.fromLTRB(16,32,16,0),
            child: Container(
              // color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Container(
                    // padding: EdgeInsets.fromLTRB(0,0,0,16),
                    child: Row(
                      children: <Widget>[
                        Text(
                          widget.validator?'*':'',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.red
                          )
                        ),  
                        Text(
                          widget.label.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14,
                              color: const Color.fromRGBO(81,90,110,1)
                          ),
                        )
                      ],
                    ),
                  ),


                  Container(
                    margin: (widget.maxLines>1)?EdgeInsets.fromLTRB(0,20,0,0):EdgeInsets.fromLTRB(0,2,0,0),
                    child: TextFormField(
                      //focusNode: FocusNode(),
                      autofocus: false,
                      maxLength:500,
                      maxLines: widget.maxLines,
                      controller: widget.controller,
                      readOnly: widget.readOnly,

                      decoration: InputDecoration(
                          contentPadding: (widget.maxLines>1)? const EdgeInsets.only(bottom:0):const EdgeInsets.only(bottom:-16),
                          // contentMargin:EdgeInsets.only(bottom: 0),
                          labelStyle: TextStyle( 
                              fontSize: 14.0, 
                              color: Color.fromARGB(255, 93, 93, 93)
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width:0.5,color: Colors.grey[500]),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width:0.5,color: Colors.blue),
                          ),  
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width:0.5,color: Colors.red),
                          ),                               
                          // border: InputBorder.none,
                          // suffixIcon: IconButton(
                          //     icon: Icon(
                          //       Icons.close,
                          //       color: Color.fromARGB(255, 126, 126, 126), 
                          //     ),
                          //     // onPressed: onClearUser,
                          // ),
                      ),
                      validator: widget.validator ? (value) {
                        if (value.isEmpty) {
                          return widget.validatorText;
                        }
                        return null;
                      }:null,
                    )
                  )
                ] 
              )
          )          
      );
    }  
}