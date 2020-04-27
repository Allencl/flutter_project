import 'package:flutter/material.dart';

import 'package:wis_flutter/bottomBar.dart';     // 底部导航条
import 'package:wis_flutter/index.dart';        // wis flutter 组件 



// tab 页面
class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() =>new _TabPageState();
}


class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this,length: 8);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab切换页面"),
        bottom: TabBar(
          controller: _tabController,  // 记得要带上tabController
          isScrollable:true,
          tabs: <Widget>[
            Tab(text: "热门"),
            Tab(text: "推荐"),
            Tab(text: "关注"),
            Tab(text: "收藏"),
            Tab(text: "新增"),
            Tab(text: "点赞"),
            Tab(text: "文学"),
            Tab(text: "其它"),


          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
              child: WisSearchPage(
              label:"查询...",
              data: [
                {
                  "title":"初始值11",
                  "content":"内容11",
                },{
                  "title":"初始值22",
                  "content":"内容22",
                }
              ],
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
                  // this._onSearch(option);
              },
              onFilter:(option){
                  // 筛选 点击
                  // this._onFilter(option);
              },
              onRowClick:(option){
                  // 行数据 列表点击
                  // this._onRowClick(option);
              }              
          )
          ),
          Center(
              child: Text("这是推荐的内容")
          ),
          Center(
              child: Text("这是关注的内容")
          ),
          Center(
              child: Text("这是收藏的内容")
          ),
          Center(
              child: Text("这是新增的内容")
          ),
          Center(
              child: Text("这是点赞的内容")
          ),
          Center(
              child: Text("这是文学的内容")
          ),
          Center(
              child: Text("这是其它的内容")
          )
        ],
      ),
    );
  }
}






