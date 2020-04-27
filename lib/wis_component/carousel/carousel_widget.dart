import 'dart:async';
import 'package:flutter/material.dart';

import 'package:wis_flutter/wis_component/carousel/banner_model.dart';  // 轮播图                

class Carousel extends StatefulWidget {

  final String type;        // 类型
  final List<BannerModel> banners;
  final OnTapBannerItem onTap;
  final Color indicatorNormalColor;// 指示器球的正常颜色
  final Color indicatorCurrentColor;// 指示器球的当前颜色
  final double indicatorWidth;// 指示器球的宽高
  final double indicatorMargin;// 指示器球之间间距
  final bool  hiddenIndicator;// 是否影藏指示器
  final bool  hiddenIndicatorForSingle;// 单个图片是否影藏指示器
  final bool  autoScroll; // 是否循环
  final int  seconds; // 轮播间隔
  final List children;     // 数据


  Carousel(
      {Key key,
        @required this.banners,
        @required this.onTap,
        this.type='image',
        this.seconds = 5,
        this.autoScroll = true,
        this.hiddenIndicator = false,
        this.hiddenIndicatorForSingle = true,
        this.indicatorWidth = 6,
        this.indicatorMargin = 1.5,
        this.indicatorCurrentColor = Colors.blue,
        this.indicatorNormalColor = Colors.grey,
        this.children,
  }) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return _BannerState();
  }
}

class _BannerState extends State<Carousel> {

  int _currentIndex = 1;
  PageController controller = PageController(initialPage: 1, viewportFraction: 1);
  Timer _timer;

  @override
  void initState() {
    super.initState();
    if(widget.banners.length == 0) return;
    controller = PageController(initialPage: 1);
    if(widget.autoScroll && widget.banners.length > 1) {
      _setTimer();
    }
  }


  // 创建定时器
  _setTimer(){
    _timer = Timer.periodic(Duration(seconds: widget.seconds), (timer) { // 自动滚动
      /// print(realIndex);
      controller.animateToPage(_currentIndex + 1,
          duration: Duration(milliseconds: 300),
          curve: Curves.linear);
    });
  }

  // 页面退出时销毁定时器
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    _timer.cancel();
  }

  // 是否显示指示器
  _showIndicator() {
    if(widget.banners.length == 0) return false;
    if(widget.hiddenIndicator) return false;
    if(widget.banners.length==1 && widget.hiddenIndicatorForSingle) return false;
    return true;
  }
  // pageView是否可以滚动
  _isCanScroll() {
    if(widget.banners.length == 0 || widget.banners.length == 1) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    List<BannerModel> _list = List();
    if(widget.banners.length > 0) {
      _list
        ..add(widget.banners[widget.banners.length - 1])
        ..addAll(widget.banners)
        ..add(widget.banners[0]);
    }

    return widget.banners.length>0? Container(
      child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            NotificationListener(
              onNotification: (ScrollNotification notification) {
                if(widget.autoScroll && widget.banners.length > 1) {
                  if (notification.depth == 0 &&
                      notification is ScrollStartNotification) {
                    if (notification.dragDetails != null) {
                      _timer.cancel();
                    }
                  } else if (notification is ScrollEndNotification) {
                    _timer.cancel();
                    _setTimer();
                  }
                }
              },
              child:_pageView(_list),
            ),

            _showIndicator() ? _buildIndicator() : Container(), // 下面的小点
          ]),
    ) : Container();
  }


  // 创建轮播 View
  Widget _pageView(List _list) {
     return PageView(
      controller: controller,
      onPageChanged: (page) {
        int newIndex;
        if (page == _list.length - 1) {
          newIndex = 1;
          controller.jumpToPage(newIndex);
        } else if (page == 0) {
          newIndex = _list.length - 2;
          controller.jumpToPage(newIndex);
        } else {
          newIndex = page;
        }
        setState(() {
          _currentIndex = newIndex;
        });
      },
      children: _list.map((model) => _buildItem(model)).toList(),
      physics: _isCanScroll() ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
    );
  }

  // 获取多条消息
  Widget _getContent(list){

    if( list != null ){
      List<Text> body = <Text>[];

      for(var i = 0; i < list.length; i++){
        body.add(
            Text(
              list[i].toString(),
              overflow: TextOverflow.ellipsis,
              softWrap :false,
            )
        );
      }

      return Wrap(
        children:body
      );
    }

    return Text('');
  }

  // 创建item
  Widget _buildItem(BannerModel model) {

    var obj = widget.children[model.index];   //文本数据


    // 文本类型
    if( widget.type == 'text' ){
      return GestureDetector(
        onTap: () { // 按下
          if (widget.onTap != null) {
            widget.onTap(model);
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2, 
                    child: (obj["src"]!=null) ? 
                      Container(
                        width: 80,
                        height: 80,
                        // padding: EdgeInsets.fromLTRB(0,0,0,0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(model.image)
                        )                
                      )
                      :
                        ((obj["assets"]!=null))?
                          Container(
                            width: 80,
                            height: 80,
                            // padding: EdgeInsets.fromLTRB(0,0,0,0),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(obj["assets"])
                            )                
                          )                        
                          :
                          Icon(
                            (obj["icon"]!=null)?obj["icon"]:Icons.notifications,
                            size: 32,
                            color: Colors.blue,
                          )
                  ),
                  Expanded(
                    flex: 6, 
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(12,0,0,0),
                      child: _getContent(obj["contents"])
                    )
                  ),
                  Expanded(
                    flex: 1, 
                    child: Icon(
                      Icons.chevron_right,
                      color: Color.fromARGB(255, 126, 126, 126), 
                    )
                  )
                ],
              )
            )
        
          ],
        ),
      );
    }


    // 图片类型 
    return GestureDetector(
      onTap: () { // 按下
        if (widget.onTap != null) {
          widget.onTap(model);
        }
      },
      child: Stack(
        fit: StackFit.expand,
        children: (model.image!=null) ? <Widget>[
          Image.network(model.image,fit: BoxFit.cover)
        ]:
        <Widget>[
          Image.asset(obj["assets"],fit: BoxFit.cover) 
        ]
        ,
      ),
    );
  }


  // 创建指示器
  Widget _buildIndicator() {
     return Positioned(
      bottom: 15.0,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.banners
            .asMap()
            .map((i, v) => MapEntry(
            i,
            Container(
              width: widget.indicatorWidth,
              height: widget.indicatorWidth,
              margin: EdgeInsets.only(left: 2.0, right: 2.0),
              decoration: ShapeDecoration(
                  color: _currentIndex == i + 1
                      ? widget.indicatorCurrentColor
                      : widget.indicatorNormalColor,
                  shape: CircleBorder()),
            )))
            .values
            .toList(),
      ),
    );
  }
}

typedef void OnTapBannerItem(BannerModel model);