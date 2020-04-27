import 'package:flutter/material.dart';
import 'dart:convert';



// 复选框
class CheckboxForm extends StatefulWidget {

    final dynamic controller;      // 表单名称
    final String label;           // lable
    final bool validator;         // 校验
    final String validatorText;   // 校验提示
    final bool readOnly;          // 只读
    final List<Map> children;         // 数据
    final bool multiple;          // 多选
    final dynamic onSearch;      // 查询回调
    final dynamic selectData;        // 选中数据
    final bool initialData;        // 表单返回选中的 原始数据


    CheckboxForm({
        Key key,
        this.controller,
        this.label,
        this.validator=false,
        this.validatorText="必填",
        this.readOnly=false,
        this.multiple=false,
        this.children,
        this.onSearch,
        this.selectData,
        this.initialData=false,

    }) : super(key: key);  

    @override
    _CheckboxFormState createState() => new _CheckboxFormState();
}

class _CheckboxFormState extends State<CheckboxForm> {



    // 初始化
    void initState() {
      super.initState();
      _dataInit();   // 数据初始化
      _bodyInit();  // 
    }

    // 数据初始化
    void _dataInit(){

      if( widget.selectData != null ){

        var _list=widget.selectData;
        for (var i = 0; i < _list.length; i++) {
          for (var j = 0; j < widget.children.length; j++) {
            if(widget.children[j]['id']==_list[i]){
              widget.children[j]['_check']=true;
            }
          }
        }

        this._editForm();  // 修改表单值
        setState(() {});
      }

    }

    // change 
    void _onChange(option,val){

      // 只读
      if( !widget.readOnly ){

        for (var i = 0; i < widget.children.length; i++){
          if( option["id"]==widget.children[i]["id"] ){
            widget.children[i]["_check"]=(widget.children[i]["_check"]!=null)?!widget.children[i]["_check"]:val;
          } else{
            // 单选
            if( !widget.multiple ) widget.children[i]["_check"]=false;
          }
        }

        // 设置表单
        this._editForm();

        if(widget.onSearch != null){
            widget.onSearch(option);
        }

        setState((){});

      }
    }


    // 修改表单值
    void _editForm(){
      List _formList=[];   
      for (var k = 0; k < widget.children.length; k++){
        if(widget.children[k]['_check']==true) _formList.add(
          widget.initialData ? 
          widget.children[k]
          :
          widget.children[k]['id']
        );
      }

      widget.controller.text=(_formList.length>0)?jsonEncode(_formList):'';
    }


    @override
    void dispose() {
      super.dispose();
    }


    // 组件 初始化 
    _bodyInit() {

        List<Widget> listBody = <Widget>[];

        
        widget.children.forEach((o) {
            listBody.add( 
              Container(
                height: 28,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Checkbox(
                        value: (o['_check']!=null)?o['_check']:false,
                        activeColor: Colors.blue,
                        onChanged: (bool val) {
                          FocusScope.of(context).requestFocus(FocusNode());
                          this._onChange(o,val);
                        },
                      )
                    ),

                    Expanded(
                      flex: 8,
                      child: (true) ? Text(
                          (o["value"]!=null)?o["value"].toString():'null',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14,
                              color: const Color.fromRGBO(81,90,110,1),
                          )
                      ): Text("Null")
                    )      
                  ]
                )
              )
            );
        });

        return Wrap(
          children: listBody,
        );
    }    


    @override
    Widget build(BuildContext context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(16,32,16,16),
          child:  Container(
            // color: Colors.white,
            child: Stack(
                children: <Widget>[

                  Container(
                    // padding: EdgeInsets.fromLTRB(0,0,0,16),
                    // height: 16,
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
                    // padding: EdgeInsets.fromLTRB(0,14,0,0),
                    // margin: EdgeInsets.fromLTRB(0,24,0,0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(0,46,0,0),
                          child: _bodyInit(),
                        ),
                        Container(
                          // padding: EdgeInsets.fromLTRB(0,-50,0,0),
                          child:Row(
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  controller: widget.controller,
                                  readOnly: true,
                                  autofocus: false,
                                  style: TextStyle(
                                    color: Colors.transparent,
                                  ),
                                  decoration: InputDecoration(
                                      // labelText: widget.label,
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
                                  ),
                                  validator: widget.validator ? (value) {
                                    if (value.isEmpty) {
                                      return widget.validatorText;
                                    }
                                    return null;
                                  }:null,
                                )
                              )
                            ],
                          )
                        )
                      ],
                    )
                  )             
                ]
            )   
          )  
        );
    }  
}


