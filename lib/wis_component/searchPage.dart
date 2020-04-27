import 'package:flutter/material.dart';


// 查询页
class SearchPage extends StatefulWidget {

    // final String title;
    final String label;
    final List<Map> data;
    final dynamic filterData;  // 过滤数据
    final dynamic onSearch;
    final dynamic onRowClick;  // 行点击事件
    final dynamic onFilter;    // 筛选点击


    SearchPage({
        Key key,
        this.label,
        this.data,
        this.filterData,
        this.onSearch,
        this.onRowClick,
        this.onFilter
    }) : super(key: key);

    @override
    _SearchPageState createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

    bool isDrawer=false;    // 打开侧栏

    final _formKey = GlobalKey<FormState>();
    TextEditingController _valueController =  TextEditingController();     // 查询内容


    // 查询
    void _onSearch(){
        
        //读取当前的Form状态
        var loginForm = _formKey.currentState;


        // //验证Form表单
        if(loginForm.validate()){

            // 回调
            if( widget.onSearch != null ) {
              widget.onSearch({
                "value":_valueController.text,
              });
            }

        }
    }   


    // 点击行
    void _onRowClick(option){  

      if( widget.onRowClick != null ) {
        widget.onRowClick( option );
      }

      setState(() {
        isDrawer=false;
      });

    } 


    // 筛选点击
    void _onFilter(){  

      if( widget.onFilter != null ) {
        widget.onFilter( widget.filterData );
      }

      setState(() {
        isDrawer=false;
      });

    }     

    


    // 筛选选中
    void _onSelectFilter (option,item,val){

      for(var i = 0; i < widget.filterData.length; i++){

          var parent=widget.filterData[i];
          if( parent['type']==option['type'] ){

            for(var j = 0; j < parent['children'].length; j++){
               var child=parent['children'][j];

               if( parent['multiple']==false ) child['_check']=false;
               if( child['id']==item['id']){
                  // var result=(child['_check']!=null)?child['_check']:false;
                  child['_check']=val;
               }   
            }
          }
      }

      setState((){});
    }

    // 筛选遍历  
    Widget _bodyInit(option) {
        List<Widget> tiles = [];

        // Widget content; 
        for(var item in option["children"] ) {
          tiles.add(
            Padding(
              padding: const EdgeInsets.fromLTRB(8,0,0,0),
              child: Row(
                children: <Widget>[
                    Container(
                      width: 38,
                      height: 36,
                      child: Checkbox(
                        value: (item['_check']!=null)?item['_check']:false,
                        activeColor: Colors.blue,
                        onChanged: (bool val) {
                          this._onSelectFilter(option,item,val);
                        },
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,0),
                      child: Container(
                      width: 180,
                      height: 36,
                      child: Text(
                        item['value'],
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: const Color.fromRGBO(81,90,110,1),
                          fontSize: 14.0, 
                          height: 2.1,
                        )
                      )
                      ) 
                    )  
                ]
              )
            )
          );
        }


        return Column(
            children: tiles.toList(), 
        );
    }




    @override
    Widget build(BuildContext context){
        return InkWell(
            onTap: (){
              setState(() {
                isDrawer=false;
              });
            },
            child: Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(8,8,8,8),
                  child: (widget.onSearch != null) ? Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            onTap:(){
                              setState(() {
                                isDrawer=false;
                              });                              
                            },
                            onEditingComplete:(){
                              this._onSearch();
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            controller: _valueController,
                            decoration: InputDecoration(
                                labelText: widget.label,
                                labelStyle: TextStyle( 
                                    fontSize: 14.0, 
                                    color: Color.fromARGB(255, 93, 93, 93)
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
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
                            ),
                            // validator: (value) {
                            //   if (value.isEmpty) {
                            //     return '内容';
                            //   }
                            //   return null;
                            // },
                          ),

                        ],
                      ),
                  ): Text('')
                ),

                Container(
                    margin:(widget.onSearch != null)?EdgeInsets.fromLTRB(0,78,0,0):EdgeInsets.fromLTRB(0,0,0,0),
                    child: ListView.builder(
                      itemCount: widget.data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            this._onRowClick(widget.data[index]);
                          },
                          child: Container(
                              padding: EdgeInsets.fromLTRB(8,8,8,8),
                              decoration: BoxDecoration(
                                  border:Border(bottom:BorderSide(width:1,color:Color(0xffe5e5e5)) )
                              ),
                              child: Row(
                                children: [
                                    Expanded(
                                      flex: 11,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.fromLTRB(0,8,0,8),
                                            child: (null!=widget.data[index]["title"]) ? Text(
                                              widget.data[index]["title"],
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ):  null,
                                          ),

                                          Container(
                                            child: (null!=widget.data[index]["content"]) ? Text(
                                              widget.data[index]["content"],
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                              ),
                                            ): null 
                                          )
                                          
                                        ],
                                      ),
                                    ),

                                    Expanded(
                                      flex: 1,
                                      child: ( widget.onRowClick !=null ) ? Icon(
                                          Icons.chevron_right,
                                          color: Color.fromARGB(255, 126, 126, 126), 
                                      ): Text('')
                                    )
                                    // Icon(
                                    //   Icons.search,
                                    //   // color: Colors.red[500],
                                    // ),
                                    // new Text('41'),
                                    // Divider(height:20.0),
                                ],
                              )
                          )
                        );

                      }
                    )
                ),

                Container(
                    child: (isDrawer) ? 
                    InkWell(
                      onTap: (){},
                      child: Drawer(
                        child: Stack(
                          children: <Widget>[
                              Row(
                                children: <Widget>[
                                    Expanded(
                                      flex: 6,
                                      child: Text(" "),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.check,
                                            color: Colors.blue,
                                          ),
                                          onPressed: _onFilter,
                                        )
                                      )
                                    )                                  
                                ],
                              ),

                              Container(
                                  margin: EdgeInsets.fromLTRB(0,38,0,0),
                                  child: (widget.filterData!=null) ? ListView.builder(
                                    itemCount: widget.filterData.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        child: Row(
                                          children: [
                                            Stack(
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(8,0,0,0),
                                                  child: Text(
                                                    (widget.filterData[index]['title']).toString(),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                  )
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(10,30,0,18),
                                                  child: _bodyInit( widget.filterData[index] ) 
                                                ),
                                                // Divider(height:20.0),

                                              ]
                                            )
                                          ]
                                        )
                                      );
                                    }
                                  ): Text("")
                              ),                                
                          ]
                        )
                      ),
                    )                  
                    : null     
                ),


                Positioned(
                  bottom: 55.0,
                  right: 35.0,
                  child: (widget.filterData!=null) ? FloatingActionButton(
                      onPressed: (){
                          setState(() {
                            isDrawer=true;
                          });
                      },
                      child: Text('筛选'),
                  ):Text('')
                )
            ],
            )
        );
    }


}



