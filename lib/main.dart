import 'package:flutter/material.dart';


import 'package:wis_flutter/home.dart';               // 首页
import 'package:wis_flutter/wis_view/login.dart';    // 登录页
import 'package:wis_flutter/wis_view/test.dart';     // 测试页


import 'package:wis_flutter/wis_view/table.dart';      // table展示
import 'package:wis_flutter/wis_view/search.dart';     // 查询页面
import 'package:wis_flutter/wis_view/form.dart';     // 查询页面
import 'package:wis_flutter/wis_view/textImage.dart';     // 图文页面
import 'package:wis_flutter/wis_view/product.dart';     // 产品展示 切换
import 'package:wis_flutter/wis_view/bi.dart';     // 报表
import 'package:wis_flutter/wis_view/btn.dart';     // 按钮
import 'package:wis_flutter/wis_view/dialog.dart';     // 弹框
import 'package:wis_flutter/wis_view/tooltip.dart';     // 提示
import 'package:wis_flutter/wis_view/tab.dart';     // tab 切换页面



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            routes: <String, WidgetBuilder> {
              '/': (BuildContext context) => HomePage(),
              '/test': (BuildContext context) => TestPage(),              // 测试页面
              '/textImage': (BuildContext context) => TextImagePage(),      // 图文页面
              '/productToggle': (BuildContext context) => ProductTogglePage(), // 产品展示 切换
              '/BI': (BuildContext context) => BIPage(), // 报表
              '/btn': (BuildContext context) => BtnPage(), // 按钮页面
              '/dialog': (BuildContext context) => DialogPage(), // 弹框页面
              '/tooltip': (BuildContext context) => TooltipPage(), // 提示页面

             
              
              
              '/login': (BuildContext context) => LoginPage(),
              '/table': (BuildContext context) => TablePage(),     // table展示
              '/search': (BuildContext context) => SearchPage(),  // 查询页面
              '/form': (BuildContext context) => FormPage(),      // form页面
              '/tab': (BuildContext context) => TabPage(),      // tab 切换页面


              

            },               
        );
    }
}

