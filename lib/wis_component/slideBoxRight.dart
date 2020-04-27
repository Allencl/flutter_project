import 'package:flutter/material.dart';


// 左右滑动盒子
class SlideBoxRight extends StatefulWidget {

    final List data;     // 数据
    final dynamic onClick;      // 点击事件



    SlideBoxRight({
        Key key,
        this.data,
        this.onClick
    }) : super(key: key);  

    @override
    _SlideBoxRightState createState() => new _SlideBoxRightState();
}


class _SlideBoxRightState extends State<SlideBoxRight> {


    // 初始化
    void initState() {
      super.initState();
    }

    @override
    void dispose() {
      super.dispose();
    }


    // 点击事件
    void _onClick(option){  

      if( widget.onClick != null ) {
        widget.onClick(option);
      }
    }  


    @override
    Widget build(BuildContext context) {
        return SliverToBoxAdapter(
          child: SizedBox(
            height: 135,
            child: ListView.builder(
                itemExtent: 220,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){

                  Widget _markWidget(){
                    var type=widget.data[index]['mark'];

                    if( type!=null ){
                      switch(type){
                        case 1:
                          return Icon(
                            Icons.grade,
                            color: Colors.red,
                            size: 16.0,
                          );
                          break;
                        case 2:
                          return Icon(
                            Icons.grade,
                            color: Colors.yellow,
                            size: 16.0,
                          );
                          break;                          
                        default:
                      }
                    }

                    return Text('');
                  }

                  return Container(
                      padding: EdgeInsets.fromLTRB(8,8,8,8),
                      margin: EdgeInsets.fromLTRB(8,8,8,8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          border:Border.all(
                            width:1,color:Color(0xffe5e5e5) 
                          )
                      ),
                      child: Column(
                        children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0,5,0,0),
                              child: Row(
                                children: <Widget>[
                                  _markWidget(),
                                  Expanded(
                                    child: Text(
                                        widget.data[index]["title"].toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: const Color.fromRGBO(81,90,110,1),
                                          fontWeight: FontWeight.w700,
                                        )
                                      )
                                  )
                                ]
                              )
                            ),

                            Container(
                              margin: EdgeInsets.fromLTRB(0,3,0,0),
                              padding: EdgeInsets.fromLTRB(3,0,0,0),
                              height: 35,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                        widget.data[index]["content"].toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines:2,
                                        style: TextStyle(
                                          fontSize: 12,
                                          // color: const Color.fromRGBO(81,90,110,1),
                                        )
                                      )
                                  )
                                ]
                              )  
                            ),

                            Container(
                              padding: EdgeInsets.fromLTRB(0,12,0,0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child:(widget.data[index]["time"]!=null)?Text(
                                      widget.data[index]["time"].toString(),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 12,
                                        // color: const Color.fromRGBO(81,90,110,1),
                                      )
                                    ):Text("")
                                  ),


                                  Expanded(
                                    flex: 8,
                                    child: 
                                      InkWell(
                                        onTap: (){
                                          this._onClick(widget.data[index]);
                                        },
                                        child: Text(
                                          '查看详情',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontSize: 12,
                                            // color: const Color.fromRGBO(81,90,110,1),
                                          )
                                        )
                                      )                                                                     
                                  ),

                                  Expanded(
                                    flex: 2,
                                    child: Icon(
                                      Icons.chevron_right,
                                      color: Color.fromARGB(255, 126, 126, 126), 
                                    )
                                  )
                                ]
                              )  
                            ),


                        ],
                      ),
                  );
                },
                itemCount: widget.data.length
            ),
          )
      );
    }  
}