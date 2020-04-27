import 'package:flutter/material.dart';

import 'package:wis_flutter/index.dart';        // wis flutter 组件 

// 查询  页面  示例
class SearchPage extends StatefulWidget {

    SearchPage({
        Key key,
    }) : super(key: key);

    @override
    _SearchPageState createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

    // 列表 数据 初始值
    List<Map> newList = <Map>[
      {
        "title":"初始值11",
        "content":"内容11",
      },                {
        "title":"初始值22",
        "content":"内容22",
      }
    ];
 

    // 查询回调
    void _onSearch(option){
        print(option["value"]);  // 查询值

        // 修改 查询值
        setState(() {
          newList=[
                {
                  "title":"新的标题111",
                  "content":"内容qqq",
                },
                {
                  "title":"新的标题222",
                  "content":"内容yyy",
                }
          ];
        });
    }


    // 行点击 事件
    void _onRowClick(option){
      print(option);
    }

    // 筛选点击
    void _onFilter(option){
      print(option);
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          resizeToAvoidBottomInset:false,
          appBar: AppBar( title: const Text('查询页') ),  // 头部导航条  
          body: WisSearchPage(
              label:"查询...",
              data: newList,
              // 过滤数据
              filterData:[
                {
                  "type":"mark",
                  "title":"是否已读",
                  "children":[
                    {
                      "id":1,
                      "value":"已读"
                    },
                    {
                      "id":2,
                      "value":"未读"
                    }                 
                  ]
                },
                {
                  "type":"status",
                  "title":"状态",
                  "multiple": false,    // 是否多选
                  "children":[
                    {
                      "id":1,
                      "value":"状态1"
                    },
                    {
                      "id":2,
                      "value":"状态2"
                    }                   
                  ]
                }                  
              ],
              onSearch:(option){
                  // 查询点击
                  this._onSearch(option);
              },
              onFilter:(option){
                  // 筛选 点击
                  this._onFilter(option);
              },
              onRowClick:(option){
                  // 行数据 列表点击
                  this._onRowClick(option);
              }              
          ),
        );

    }
}


