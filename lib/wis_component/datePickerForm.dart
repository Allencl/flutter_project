import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

// 日期
class DatePickerForm extends StatefulWidget {

    final dynamic controller;      // 表单名称
    final String label;           // lable
    final bool validator;         // 校验
    final String validatorText;   // 校验提示
    final bool readOnly;          // 只读
    final DateTime firstDate;     // 开始日期
    final DateTime lastDate;     // 结束日期
    final dynamic formatDate;     // 日期格式化


    DatePickerForm({
        Key key,
        this.controller,
        this.label,
        this.validator=false,
        this.validatorText="必填",
        this.readOnly=false,
        this.firstDate,
        this.lastDate,   
        this.formatDate     
    }) : super(key: key);  

    @override
    _DatePickerFormState createState() => new _DatePickerFormState();
}

class _DatePickerFormState extends State<DatePickerForm> {

    // DateTime _selectedDate = DateTime.now();    //当前选中的日期


    // 初始化
    void initState() {
      super.initState();

    }



    // change 
    void _onChange(val){
      widget.controller.text=formatDate(val, [yyyy,"-",mm,"-",dd]);
      setState((){});
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
          padding: EdgeInsets.fromLTRB(16,32,16,16),
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
                    margin: EdgeInsets.fromLTRB(0,4,0,0),
                    child: Row(
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
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      if( !widget.readOnly ){
                        FocusScope.of(context).requestFocus(FocusNode());

                        showDatePicker(
                            context: context,
                            initialDate: (widget.controller.text!='')?DateTime.parse(widget.controller.text):DateTime.now(),
                            firstDate: (widget.firstDate!=null)?widget.firstDate:DateTime(1970,1,1),
                            lastDate: (widget.lastDate!=null)?widget.lastDate:DateTime(2070,1,1),
                        ).then((DateTime val) {
                            this._onChange(val);
                        }).catchError((err) {
                            // print(err);
                        });
                      }
                    },  
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0,0,0,0),
                      // color: Colors.red,
                      height: 50,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,24,0,0),
                            child:(widget.controller.text!='')? Text(
                              // "${formatDate (DateTime.parse(widget.controller.text), [yyyy,"年",mm,"月",dd])}",
                              "${formatDate (DateTime.parse(widget.controller.text),(widget.formatDate!=null)?widget.formatDate:['yyyy',"-",'mm',"-",'dd'] )}",
                              style: TextStyle(
                                fontSize: 16.0, 
                                // height: 1.5,
                              ),
                            ):null
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


