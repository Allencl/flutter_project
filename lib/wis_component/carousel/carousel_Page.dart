import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:wis_flutter/wis_component/carousel/banner_model.dart';  // 轮播图                
import 'package:wis_flutter/wis_component/carousel/carousel_widget.dart';  // 轮播图                


class CarouselPage extends StatefulWidget {

  final List children;     // 数据
  final double height;     // 高度
  final bool autoScroll;  // 是否轮播
  final int  seconds;    // 轮播间隔
  final dynamic onClick;      // 点击事件
  final String type;        // 类型




  CarouselPage({
      Key key,
      this.children,
      this.height=100,
      this.autoScroll,
      this.seconds = 5,
      this.onClick,
      this.type='image'
  }) : super(key: key);


  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {

  List<BannerModel> banners = List();

  void initState() {
    super.initState();

    _onInit();  
  }

  // 初始化
  void _onInit(){

    for(var i = 0; i < widget.children.length; i++){
        banners.add(
          BannerModel(
            null,
            index:i,  
            image: widget.children[i]['src'],
            data:widget.children[i]
          )
        );
    }

  }


  // 点击 
  void _onClick(option){
    if( widget.onClick != null ) {
      widget.onClick(option);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(8,8,8,8),
              width: double.maxFinite,
              height: widget.height,
              child: Carousel(
                banners: banners,
                type: widget.type,
                autoScroll: widget.autoScroll,
                seconds: widget.seconds,
                children: widget.children,
                onTap: (model){
                  this._onClick(widget.children[model.index]);
                },
              ),
            ),
          ],
        ),
      );
  }
}




