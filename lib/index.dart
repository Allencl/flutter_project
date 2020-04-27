import 'package:flutter/material.dart';


import 'package:wis_flutter/wis_view/login.dart';             // 登录页
import 'package:wis_flutter/wis_component/homeBody.dart';     // home页 body
import 'package:wis_flutter/wis_component/searchPage.dart';    // 查询页面


import 'package:wis_flutter/wis_component/text.dart';                 // 标题栏
import 'package:wis_flutter/wis_component/listTableCross.dart';       // table 横向  
import 'package:wis_flutter/wis_component/listTableVertical.dart';    // table 纵向 

import 'package:wis_flutter/wis_component/textForm.dart';             //  input 输入框
import 'package:wis_flutter/wis_component/selectForm.dart';           //  下拉框
import 'package:wis_flutter/wis_component/datePickerForm.dart';       //  日期
import 'package:wis_flutter/wis_component/timePickerForm.dart';       //  时间
import 'package:wis_flutter/wis_component/checkBox.dart';       //  复选框


import 'package:wis_flutter/wis_component/slideBoxRight.dart';       // 左右滑动
import 'package:wis_flutter/wis_component/carousel/carousel_Page.dart';  // 轮播图                

import 'package:wis_flutter/wis_component/divider.dart';  // 线    
import 'package:wis_flutter/wis_component/sliverAppBar.dart';  // 自定义 头部导航条                


import 'package:wis_flutter/wis_component/BI/PieChartSample1.dart';  // 饼图 1              
import 'package:wis_flutter/wis_component/BI/PieChartSample2.dart';  // 饼图 2              
import 'package:wis_flutter/wis_component/BI/BarChartSample1.dart';  // 条形图 1     
import 'package:wis_flutter/wis_component/BI/BarChartSample2.dart';  // 条形图 2              
import 'package:wis_flutter/wis_component/BI/LineChartSample1.dart';  // 条形图 1     



// 自定义 头部导航条
class WisSliverAppBar extends StatelessWidget {

    final String title;          // 标题
    final List<Widget> actions;  // 按钮
    final double height;    // 高度
    final Widget backgroundImage;    // 背景图片



    WisSliverAppBar({
        Key key,
        this.title='WIS Home',
        this.actions,
        this.height=200,
        this.backgroundImage
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return SliverAppBarCustom(
        title: this.title,
        actions: this.actions,
        height: this.height,
        backgroundImage: this.backgroundImage
      ); 
    }
}





// 折线图 1
class WisLineChart1 extends StatelessWidget {

    WisLineChart1({
        Key key,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return LineChartSample1(
      ); 
    }
}


// 条形图 2
class WisBarChart2 extends StatelessWidget {

    WisBarChart2({
        Key key,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return BarChartSample2(
      ); 
    }
}


// 条形图 1
class WisBarChart1 extends StatelessWidget {

    WisBarChart1({
        Key key,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return BarChartSample1(
      ); 
    }
}


// 饼图 1
class WisPieChart1 extends StatelessWidget {

    WisPieChart1({
        Key key,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return PieChartSample1(
      ); 
    }
}


// 饼图 2
class WisPieChart2 extends StatelessWidget {

    WisPieChart2({
        Key key,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return PieChartSample2(
      ); 
    }
}


// ******  复选框
class WisCheckboxForm extends StatelessWidget {

    final dynamic controller;      // 表单名称
    final String label;           // lable
    final bool validator;         // 校验
    final String validatorText;  // 校验提示
    final bool readOnly;          // 只读
    final bool multiple;          // 多选
    final List<Map> children;         // 数据
    final dynamic onSearch;      // 查询回调
    final dynamic selectData;        // 选中数据
    final bool initialData;        // 表单返回选中的 原始数据


    WisCheckboxForm({
        Key key,
        this.label,
        this.validator=false,
        this.validatorText="必填",
        this.controller,
        this.readOnly=false,
        this.multiple=false,
        this.children,
        this.onSearch,
        this.selectData,
        this.initialData=false,

    }) : super(key: key);


    @override
    Widget build(BuildContext context) {
      return CheckboxForm(
          controller: this.controller,
          label: this.label, 
          validator: this.validator,
          validatorText: this.validatorText,
          readOnly:this.readOnly,
          multiple:this.multiple,
          children:this.children,
          onSearch:this.onSearch,
          selectData:this.selectData,
          initialData:this.initialData
      ); 
    }
}






// 横线
class WisDivider extends StatelessWidget {

    final String text;            // 文本

    WisDivider({
        Key key,
        this.text,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return DividerCrosswise(
          text: this.text,
      ); 
    }
}


// 轮播图
class WisCarousel extends StatelessWidget {

    final List children;  // 数据
    final double height;    // 高度
    final bool autoScroll;  // 是否轮播
    final int  seconds;    // 轮播间隔
    final dynamic onClick;      // 点击事件
    final String type;        // 类型



    WisCarousel({
        Key key,
        this.children,
        this.height=100,
        this.autoScroll=true,
        this.onClick,
        this.seconds = 5,
        this.type='image'
    }) : super(key: key);


    @override
    Widget build(BuildContext context) {
      return CarouselPage(
        children:this.children,
        height:this.height,
        autoScroll:this.autoScroll,
        seconds:this.seconds,
        onClick:this.onClick,
        type: this.type
      ); 
    }
}




// 左右滑动盒子
class WisSlideBoxRight extends StatelessWidget {

    final List data;            // 数据
    final dynamic onClick;      // 点击事件



    WisSlideBoxRight({
        Key key,
        this.data,
        this.onClick
    }) : super(key: key);


    @override
    Widget build(BuildContext context) {
      return SlideBoxRight(
          data: this.data,
          onClick: this.onClick
      ); 
    }
}



// 时间
class WisTimePickerForm extends StatelessWidget {

    final dynamic controller;      // 表单名称
    final String label;           // lable
    final bool validator;         // 校验
    final String validatorText;  // 校验提示
    final bool readOnly;          // 只读

    WisTimePickerForm({
        Key key,
        this.label,
        this.validator=false,
        this.validatorText="必填",
        this.controller,
        this.readOnly=false,
    }) : super(key: key);


    @override
    Widget build(BuildContext context) {
      return TimePickerForm(
          controller: this.controller,
          label: this.label, 
          validator: this.validator,
          validatorText: this.validatorText,
          readOnly:this.readOnly,
      ); 
    }
}



// ******  datePicker 日期
class WisDatePickerForm extends StatelessWidget {

    final dynamic controller;      // 表单名称
    final String label;           // lable
    final bool validator;         // 校验
    final String validatorText;  // 校验提示
    final bool readOnly;          // 只读
    final DateTime firstDate;     // 开始日期
    final DateTime lastDate;     // 结束日期
    final dynamic formatDate;     // 日期格式化



    WisDatePickerForm({
        Key key,
        this.label,
        this.validator=false,
        this.validatorText="必填",
        this.controller,
        this.readOnly=false,
        this.firstDate,
        this.lastDate,
        this.formatDate
    }) : super(key: key);


    @override
    Widget build(BuildContext context) {
      return DatePickerForm(
          controller: this.controller,
          label: this.label, 
          validator: this.validator,
          validatorText: this.validatorText,
          readOnly:this.readOnly,
          firstDate:this.firstDate,
          lastDate:this.lastDate,
          formatDate:this.formatDate

      ); 
    }
}




// ******  下拉框
class WisSelectForm extends StatelessWidget {

    final dynamic controller;      // 表单名称
    final String label;           // lable
    final bool validator;         // 校验
    final String validatorText;  // 校验提示
    final bool readOnly;          // 只读
    final bool multiple;          // 多选
    final List<Map> children;         // 数据
    final dynamic selectData;        // 选中数据
    final dynamic onSearch;      // 查询回调
    final bool initialData;        // 表单返回选中的 原始数据



    WisSelectForm({
        Key key,
        this.label,
        this.validator=false,
        this.validatorText="必填",
        this.controller,
        this.readOnly=false,
        this.multiple=false,
        this.children,
        this.selectData,
        this.onSearch,
        this.initialData=false,

    }) : super(key: key);


    @override
    Widget build(BuildContext context) {
      return SelectForm(
          controller: this.controller,
          label: this.label, 
          validator: this.validator,
          validatorText: this.validatorText,
          readOnly:this.readOnly,
          multiple:this.multiple,
          children:this.children,
          selectData:this.selectData,
          onSearch:this.onSearch,
          initialData:this.initialData

      ); 
    }
}





// ******  input 输入框
class WisTextForm extends StatelessWidget {

    final dynamic controller;      // 表单名称
    final String label;           // lable
    final bool validator;         // 校验
    final String validatorText;  // 校验提示
    final bool readOnly;          // 只读
    final int maxLines;           // 多行文本



    WisTextForm({
        Key key,
        this.label,
        this.validator=false,
        this.validatorText="必填",
        this.controller,
        this.readOnly=false,
        this.maxLines=1,
    }) : super(key: key);


    @override
    Widget build(BuildContext context) {
      return TextForm(
          controller: this.controller,
          label: this.label, 
          validator: this.validator,
          validatorText: this.validatorText,
          readOnly:this.readOnly,
          maxLines:this.maxLines
      ); 
    }
}


// ******  table 纵向
class WisListPageTableVertical extends StatelessWidget {

    final List<Map> data;  // 数据


    WisListPageTableVertical({
        Key key,
        this.data,
    }) : super(key: key);


    @override
    Widget build(BuildContext context) {
      return ListPageTableVertical(
          data: this.data, 
      ); 
    }
}



// ******  table 横向
class WisListPageTableCross extends StatelessWidget {

    final List<Map> columns;  // 列
    final List<Map> data;  // 数据


    WisListPageTableCross({
        Key key,
        this.columns,
        this.data,
    }) : super(key: key);


    @override
    Widget build(BuildContext context) {
      return ListPageTableCross(
          columns: this.columns,
          data: this.data, 
      ); 
    }
}


// ******  标题栏
class WisTextLabelLine extends StatelessWidget {

    final String text;        // text

    WisTextLabelLine({
        Key key,
        this.text,
    }) : super(key: key);


    @override
    Widget build(BuildContext context) {
      return TextLabelLine(text: this.text ); 
    }
}




// ******  查询页面
class WisSearchPage extends StatelessWidget {

    final String label;        // label
    final List<Map> data;      // 数据
    final dynamic filterData;  // 过滤数据
    final dynamic onSearch;   // 回调
    final dynamic onRowClick;  // 行点击事件
    final dynamic onFilter;    // 筛选点击

    
    WisSearchPage({
        Key key,
        this.label="请输入...",
        this.data,
        this.filterData,
        this.onSearch,
        this.onRowClick,
        this.onFilter
    }) : super(key: key);


    @override
    Widget build(BuildContext context) {

      return SearchPage(
          label: this.label,
          data: this.data,
          filterData: this.filterData,
          onRowClick:this.onRowClick,
          onFilter: this.onFilter,
          onSearch: this.onSearch
      ); 
    }
}




// ******  home页 body
class WisHomeBody extends StatelessWidget {

    final String title;         // 标题
    final List<Map> children;   // 列表组
    final dynamic onClick;     // 点击事件
    final dynamic type;        // 卡片类型




    WisHomeBody({
        Key key,
        this.type,
        this.children,
        this.onClick,
        this.title
    }) : super(key: key);


    @override
    Widget build(BuildContext context) {

      return HomePageBody(
          type: this.type,
          title: this.title,
          children: this.children,
          onClick: this.onClick
      ); 
    }
}



// ********** 页面 登录页
class WisLogonPage extends StatelessWidget {

    final String title;        // 标题
    final Function onLogin;    // 回调

    WisLogonPage({
        Key key,
        this.title,
        this.onLogin,
    }) : super(key: key);


    @override
    Widget build(BuildContext context) {

      return LoginPage(
          title:title,
          onLogin:(option){
            this.onLogin(option);
          }
      ); 
    }
}