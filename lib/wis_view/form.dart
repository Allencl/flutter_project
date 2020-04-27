import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:wis_flutter/bottomBar.dart';     // 底部导航条
import 'package:wis_flutter/index.dart';        // wis flutter 组件 



// form
class FormPage extends StatefulWidget {

    FormPage({
        Key key,
    }) : super(key: key);

    @override
    _FormPageState createState() => new _FormPageState();
}



class _FormPageState extends State<FormPage> {


  // 定义 表单 字段 
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _nameController =  TextEditingController();           // 文本框
  TextEditingController _nameSController =  TextEditingController();          // 文本框

  TextEditingController _selectController =  TextEditingController();         // 下拉框
  TextEditingController _selectSController =  TextEditingController();         // 下拉框

  TextEditingController _datePickerController =  TextEditingController();     // 时间控件
  TextEditingController _timePickerController =  TextEditingController();     // 时间控件

  TextEditingController _checkboxController =  TextEditingController();     // 复选框 单选
  TextEditingController _checkboxSController =  TextEditingController();     // 复选框 多选




  // 初始化
  void initState() {
    super.initState();


    // 表单初始化
    // this._nameController.text = 'ptbird';                 // 设置初始值


    // this._datePickerController.text = '2020-04-07';    // 设置日期初始值
    // this._timePickerController.text = '21:01';            // 设置时间初始值


  }

  // 保存提交
  void _forSubmitted() {
    var _form = _formKey.currentState;

    if (_form.validate()) {
      //  _form.save();

      print( _nameController.text );    
      print( _selectController.text );  
      print( _selectSController.text );  

      print( _datePickerController.text );     

      print( _checkboxController.text );     
      print( _checkboxSController.text );     

      // print(_password);
    }
  } 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:false,
        appBar: AppBar( title: const Text('Form') ),  // 头部导航条
        bottomNavigationBar: BottomBarWidget(),       // 底部导航条
        backgroundColor: Colors.blue[10],
        floatingActionButton: FloatingActionButton(
          onPressed: _forSubmitted,
          child: Text('提交'),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
              padding: EdgeInsets.fromLTRB(0,2,0,62),
              children: <Widget>[

                  // 单行文本
                  WisTextForm(
                    controller: _nameController,   // 表单名
                    label:'单行文本输入框',
                    //readOnly:true,                 // 只读
                    validator: true,                // 必填  
                    validatorText:"必填",       // 必填提示
                    // maxLines:1,                 // 多行文本 默认值1
                  ),


                  // 多行文本
                  WisTextForm(
                    controller: _nameSController,   // 表单名
                    label:'多行文本输入框',
                    //readOnly:true,                 // 只读
                    validator: true,                // 必填  
                    validatorText:"必填",       // 必填提示
                    maxLines:1,                 // 多行文本 默认值1
                  ),


                  // 单选下拉框
                  WisSelectForm(
                    controller: _selectController,    // 表单名
                    label:'单选下拉框',
                    // readOnly:!!true,                   // 只读
                    validator: true,
                    // validatorText:"下拉必填",
                    //multiple: !false,                  // 是否多选
                    onSearch:(option){
                      print(option);
                    },
                    initialData:false,                // 表单返回选中的 原始数据
                    selectData:[3],               // 默认选中值 [id]
                    children:[
                        {
                          "id":1,
                          "value":"撒打算12q"
                        },
                        {
                          "id":3,
                          "value":"教育厅"
                        }   
                    ]
                  ),


                  // 多选下拉框
                  WisSelectForm(
                    controller: _selectSController,    // 表单名
                    label:'多选下拉框',
                    // readOnly:!!true,                   // 只读
                    validator: true,
                    // validatorText:"下拉必填",
                    multiple: true,                  // 是否多选
                    onSearch:(option){
                      print(option);
                    },
                    initialData:false,                // 表单返回选中的 原始数据
                    selectData:[],               // 默认选中值 [id]
                    children:[
                        {
                          "id":11,
                          "value":"AA撒打算12q"
                        },
                        {
                          "id":33,
                          "value":"QQ教育厅"
                        }   
                    ]
                  ),


                  // 日期选择
                  WisDatePickerForm(
                    controller: _datePickerController,   // 表单名
                    label:'日期选择',
                    readOnly:!true,                      // 只读
                    validator: true,                     // 必填  
                    // validatorText:"必填提示",
                    // formatDate:['yyyy',"年",'mm',"月",'dd'],   // 日期格式化
                    // firstDate: DateTime(2020,4,5),       // 开始日期
                    // lastDate: DateTime(2020,4,26),       // 结束日期

                  ),


                  // 时间选择
                  WisTimePickerForm(
                    controller: _timePickerController,   // 表单名
                    label:'时间选择',
                    readOnly:!true,                      // 只读
                    validator: true,                     // 必填  
                    // validatorText:"必填提示",
                  ),


                  // 复选框单选
                  WisCheckboxForm(
                    controller: _checkboxController,    // 表单名
                    label:'复选框-单选',
                    validator: true,
                    validatorText:"下拉必填",
                    // readOnly:!!true,                   // 只读
                    //multiple: !false,                  // 是否多选
                    initialData:false,                // 表单返回选中的 原始数据
                    selectData:[1],               // 默认选中值 [id]
                    children:[
                      {
                        "id":1,
                        "value":"已读",
                      },
                      {
                        "id":2,
                        "value":"未读"                        
                      }
                    ],
                    onSearch:(option){
                      print(option);
                    },
                  ),



                  // 复选框多选
                  WisCheckboxForm(
                    controller: _checkboxSController,    // 表单名
                    label:'复选框-多选',
                    validator: true,
                    validatorText:"下拉必填",
                    // readOnly:!!true,                   // 只读
                    multiple: true,                  // 是否多选
                    initialData:false,                // 表单返回选中的 原始数据
                    // selectData:[1],               // 默认选中值 [id]
                    children:[
                      {
                        "id":1,
                        "value":"已读",
                      },
                      {
                        "id":2,
                        "value":"未读"                        
                      }
                    ],
                    onSearch:(option){
                      print(option);
                    },
                  ),




              ],
          )
        )
    ); 
  }

}








