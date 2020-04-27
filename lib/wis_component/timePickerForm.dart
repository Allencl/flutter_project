import 'package:flutter/material.dart';

// 时间
class TimePickerForm extends StatefulWidget {

    final dynamic controller;      // 表单名称
    final String label;           // lable
    final bool validator;         // 校验
    final String validatorText;   // 校验提示
    final bool readOnly;          // 只读



    TimePickerForm({
        Key key,
        this.controller,
        this.label,
        this.validator=false,
        this.validatorText="必填",
        this.readOnly=false,   
    }) : super(key: key);  

    @override
    _TimePickerFormState createState() => new _TimePickerFormState();
}

class _TimePickerFormState extends State<TimePickerForm> {

    // 初始化
    void initState() {
      super.initState();      
    }



    // change 
    void _onChange(val){

      var hour;
      var minute;

      // 补零
      hour= (val.hour<10) ? '0${val.hour}':'${val.hour}';
      minute= (val.minute<10) ? '0${val.minute}':'${val.minute}';

      widget.controller.text='${hour.toString()}:${minute.toString()}';
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
                              autofocus: false,
                              readOnly: true,
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

                        showTimePicker(
                            context: context,
                              initialTime: (widget.controller.text!='') ? 
                                  TimeOfDay(
                                    hour: int.parse( widget.controller.text.split(":")[0] ),
                                    minute: int.parse( widget.controller.text.split(":")[1] )
                                  )
                                  :TimeOfDay.now(),
                        ).then((val) {
                            // print(val);
                            this._onChange(val);
                        }).catchError((err) {
                            print(err);
                        });

                      }
                    },  
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0,0,0,0),
                      height: 50,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,24,0,0),
                            child:(widget.controller.text!='')? Text(
                              '${widget.controller.text}',
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


