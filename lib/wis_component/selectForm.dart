import 'package:flutter/material.dart';
import 'dart:convert';

// import 'package:wis_flutter/index.dart';        // wis flutter 组件 


// 下拉框
class SelectForm extends StatefulWidget {

    final dynamic controller;      // 表单名称
    final String label;           // lable
    final bool validator;         // 校验
    final String validatorText;   // 校验提示
    final bool readOnly;          // 只读
    final bool multiple;          // 多选
    final List<Map> children;         // 数据
    final dynamic selectData;        // 选中数据
    final dynamic onSearch;      // 查询回调
    final bool initialData;        // 表单返回选中的 原始数据


    SelectForm({
        Key key,
        this.controller,
        this.label,
        this.validator=false,
        this.validatorText="必填",
        this.readOnly=false,
        this.multiple=false,
        this.children,
        this.selectData,
        this.onSearch,
        this.initialData=false,


    }) : super(key: key);  

    @override
    _SelectFormState createState() => new _SelectFormState();
}

class _SelectFormState extends State<SelectForm> {


    OverlayEntry overlayEntry;
    LayerLink layerLink = new LayerLink();
    final _formKey = GlobalKey<FormState>();
    TextEditingController _valueController =  TextEditingController();     // 查询内容


    // 初始化
    void initState() {
      super.initState();

      this._initPage();  // 页面初始化
    }


    // 页面初始化
    void _initPage(){

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

    // 查询 
    void _onSearch(){
      if(widget.onSearch != null){
        widget.onSearch({
          "value":_valueController.text,
        });
      }      
    }


    // 保存
    void _onSave(){

      this._removeOverlayEntry();  

      // 修改表单值
      this._editForm();

      setState(() {
      });
    }


    // 修改表单值
    void _editForm(){

      List _formList=[];   

      // 设置选中
      for (var i = 0; i < widget.children.length; i++) {
        if( widget.children[i]['_check'] == true ){
          _formList.add(
          widget.initialData ? 
            widget.children[i]
            :
            widget.children[i]['id']
          );
        }
      }  

      widget.controller.text=(_formList.length>0)?jsonEncode(_formList):'';
        
    }

    @override
    void dispose() {
      super.dispose();
    }

  
    // 创建弹框
    void _createOverlayEntry(){
      overlayEntry = createSelectPopupWindow();
      Overlay.of(context).insert(overlayEntry);
      FocusScope.of(context).requestFocus(FocusNode());
    }


    // 关闭弹框
    void _removeOverlayEntry(){
      overlayEntry.remove();

    }

    
    // check 切换 
    void _onChange(option){

      for (var i = 0; i < widget.children.length; i++) {
        // 单选
        if(!widget.multiple) widget.children[i]['_check']=false;

        if( option['id']==widget.children[i]['id']) widget.children[i]['_check']= option['val'];
      }

      _removeOverlayEntry();
      _createOverlayEntry();
    }


    // 创建 弹框
    OverlayEntry createSelectPopupWindow() {
      OverlayEntry overlayEntry = OverlayEntry(builder: (context) {

        final size =MediaQuery.of(context).size;

        return Positioned(
          width: size.width*0.8,
          height: size.height,
          child: CompositedTransformFollower(
            offset: Offset(0.0, 50),
            link: layerLink,
            child: Material(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(12,36,12,20),
                  color: Colors.white,
                  child: Stack(
                    children: <Widget>[

                      // 标题
                      Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 8,
                              child: Text(
                                (widget.multiple)?'多选':'单选',
                                style: TextStyle(
                                  color: const Color.fromRGBO(81,90,110,1),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16
                                ),
                              )
                            ),
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                icon: Icon(
                                  Icons.highlight_off,
                                  color: Color.fromARGB(255, 126, 126, 126), 
                                ),
                                onPressed: (){
                                  this._removeOverlayEntry();
                                }  
                              )
                            ),                              
                          ],
                        ),
                      ),

                      // 查询头  
                      Container(  
                        margin: const EdgeInsets.fromLTRB(8,50,8,0),
                        child: (widget.onSearch!=null)?Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: _valueController,
                              onEditingComplete:(){
                                this._onSearch();
                                FocusScope.of(context).requestFocus(FocusNode());
                              },
                              decoration: InputDecoration(                            
                                  labelText: "请输入...",
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
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.search,
                                        color: Color.fromARGB(255, 126, 126, 126), 
                                      ),
                                      onPressed: (){
                                        this._onSearch();
                                        FocusScope.of(context).requestFocus(FocusNode());
                                      }                                  
                                  ),
                              )
                            ) 
                        ):Text(''),
                      ),

                      // 按钮
                      Container(
                        margin: (widget.onSearch!=null)?EdgeInsets.fromLTRB(0,106,0,0):EdgeInsets.fromLTRB(0,50,0,0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 8,
                              child: Text(''),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                  height: 50,
                                  // color: Colors.red,
                                  child: 
                                InkWell(
                                  onTap: (){
                                    this._onSave();
                                  }, 
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        child: Icon( 
                                          Icons.check,
                                          color: Colors.blue,
                                        )
                                      )
                                    ],
                                  ) 
                                )                                  



                                )
                                                    

                            )                            
                          ],
                        ),
                      ),


                      // body
                      Container(
                        margin: (widget.onSearch!=null)?EdgeInsets.fromLTRB(0,132,0,0):EdgeInsets.fromLTRB(0,90,0,0),
                        child: SingleChildScrollView(
                          child: ListBody(
                              children: widget.children.map((value) {
                                return Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Checkbox(
                                          value: (value['_check']!=null)?value['_check']:false,
                                          activeColor: Colors.blue,
                                          onChanged: (bool val) {
                                            this._onChange({
                                                "id":value['id'],
                                                "val":val
                                            });
                                          },
                                        )
                                      ),

                                      Expanded(
                                        flex: 6,
                                        child: (null!=value['value']) ? Text(
                                            value['value'],
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: const Color.fromRGBO(81,90,110,1),
                                            )
                                        ): Text("Null")
                                      )      
                                    ]
                                  )
                                );
                              }).toList()
                          )
                        )
                      )
                    ]
                  )
                  
                  ),
            ),
          ),
        );
      });
      return overlayEntry;
    }




    @override
    Widget build(BuildContext context) {


        List<Map> _selectedNewList = <Map>[];   // 设置选中

        // 设置选中
        for (var i = 0; i < widget.children.length; i++) {
          if( widget.children[i]['_check'] == true ){
            _selectedNewList.add(widget.children[i]);
          }
        }


        return Padding(
          padding: EdgeInsets.fromLTRB(16,32,16,10),
          child:  Container(
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
                    margin: EdgeInsets.fromLTRB(0,8,0,0),
                    child: Row(
                      children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              controller: widget.controller,
                              readOnly: true,
                              autofocus: false,

                              // enabled: false,
                              style: TextStyle(
                                color: Colors.transparent,
                              ),
                              decoration: InputDecoration(
                                  // contentPadding: EdgeInsets.only(bottom: -18),
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
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        // color: Color.fromARGB(255, 126, 126, 126), 
                                      ),
                                      onPressed: (){},
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
                    ),
                  ),


                  InkWell(
                    onTap: (){
                      if( !widget.readOnly ){
                        this._createOverlayEntry();
                      }
                    },  
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0,0,0,0),
                      // color: Colors.red,
                      height: 60,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 11,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(0,16,0,0),
                                      child: Row(
                                        children: _selectedNewList.map((value) {
                                          return Expanded(
                                            // flex: 1,
                                            child: Container(
                                              width: 60,
                                              height: 25,
                                              margin: const EdgeInsets.fromLTRB(0,0,6,0),
                                              padding: const EdgeInsets.fromLTRB(3,2,3,2),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  // color: const Color.fromRGBO(220,222,226,1),
                                                  color: Colors.grey[500],
                                                  width: 0.5
                                                ),
                                                borderRadius: BorderRadius.circular(2)
                                              ),
                                              child: Text(
                                                (value['value']!=null)?value['value']:'Null',
                                                textAlign: TextAlign.left,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 13.0, 
                                                  height: 1.4,
                                                ),
                                              )
                                            )
                                          ); 
                                        }).toList(),
                                      ), 
                                    )
                                  )
                              ], 
                            )
                          ),

                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0,30,0,0),
                              child: (_selectedNewList.length>0 && widget.multiple) ? Stack(
                                children: <Widget>[
                                  Icon(
                                      Icons.done,
                                      size: 16,
                                      color:Colors.blue,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(20,0,0,0),
                                    child: Text(
                                      _selectedNewList.length.toString(),
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  )
                                ],
                              ):null, 
                            )
                          )
                        ],
                      ),
                    ) 
                  )  
                 
                ]
            )   
          )  
        );
    }  
}


