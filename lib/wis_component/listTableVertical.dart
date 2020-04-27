import 'package:flutter/material.dart';




// table 纵向
class ListPageTableVertical extends StatefulWidget {


  final List data;

  
  ListPageTableVertical({
      Key key,
      this.data,
  }) : super(key: key);

  @override
  _ListPageTableVertical createState() => _ListPageTableVertical();
}

class _ListPageTableVertical extends State<ListPageTableVertical> {


    // table init
    _tableRowInit() {

          List dataNow = this.widget.data;
          var lenData = dataNow.length;


          // body 
          List<TableRow> list = <TableRow>[];


          // 数据
          dynamic row;
          for (var i = 0; i < lenData; i++) {
                row = TableRow(
                    children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(8,5,8,5),
                            child: Text(
                                dataNow[i]['name'],
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: const Color.fromRGBO(81,90,110,1),
                                    fontWeight: FontWeight.w700,
                                )
                            )
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(8,5,8,5),
                            child: Text(
                                dataNow[i]['value'],
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: const Color.fromRGBO(81,90,110,1),
                                    // fontWeight: FontWeight.w700,
                                )
                            )
                        ),                        
                        // Padding(
                        //     padding: const EdgeInsets.fromLTRB(8,5,8,5),
                        //     child: Text(
                        //             dataNow[i]['value'],
                        //             textAlign: TextAlign.left,
                        //             style: TextStyle(
                        //             color: const Color.fromRGBO(81,90,110,1)
                        //     )
                        // ),




                    ]
                );


                
                //   Padding(
                //     padding: const EdgeInsets.fromLTRB(8,5,8,5),
                //     child:Text(
                //         dataNow[i][columnsNow[j]['key']],
                //         textAlign: TextAlign.left,
                //         style: TextStyle(
                //         color: const Color.fromRGBO(81,90,110,1)
                //     ),
                // ));

              list.add(row);
          }

          return list;
    }

    @override
    Widget build(BuildContext context) {
        return Container(
          margin: EdgeInsets.fromLTRB(8,8,8,8),
          padding: EdgeInsets.fromLTRB(8,8,8,8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(width:1,color:Colors.white),
          ),
          child: Table(
              children:  _tableRowInit(),
          ),
        );
    }  
}