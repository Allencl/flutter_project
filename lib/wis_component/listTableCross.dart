import 'package:flutter/material.dart';




// table 横向
class ListPageTableCross extends StatefulWidget {

  // final List<Object> columns;
  // final List<Object> data;
  final List columns;
  final List data;

  
  ListPageTableCross({
      Key key,
      this.columns,
      this.data,
  }) : super(key: key);

  @override
  _ListPageTableCross createState() => _ListPageTableCross();
}

class _ListPageTableCross extends State<ListPageTableCross> {


    // table init
    _tableRowInit() {

          List columnsNow = this.widget.columns;
          List dataNow = this.widget.data;

          var lenTitle = this.widget.columns.length;
          var lenData = dataNow.length;

          // 表头
          List<Padding> listHead = <Padding>[];

          // body 
          List<TableRow> list = <TableRow>[
            TableRow(
              children: listHead,
            ),
          ];


          // 表头
          dynamic head;   // 表头
          for (var i = 0; i < lenTitle; i++) {
              head = Padding(                      
                  padding: const EdgeInsets.fromLTRB(8,5,8,5),
                  child:Text(
                      columnsNow[i]['name'],
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: const Color.fromRGBO(81,90,110,1),
                          fontWeight: FontWeight.w700,
                      ),
                  )
              ); 
              listHead.add(head);
          }


          // 数据
          dynamic row;   // 行数据
          dynamic content;
          for (var i = 0; i < lenData; i++) {

              List<Padding> rows = <Padding>[];

              for (var j = 0; j < lenTitle; j++) {
                row = Padding(
                    padding: const EdgeInsets.fromLTRB(8,5,8,5),
                    child:Text(
                        dataNow[i][columnsNow[j]['key']],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                        color: const Color.fromRGBO(81,90,110,1)
                    ),
                ));
                rows.add(row);
              }

              content = TableRow(
                children: rows,
              );
              list.add(content);
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