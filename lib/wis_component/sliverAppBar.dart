import 'package:flutter/material.dart';


// 自定义 头部导航条
class SliverAppBarCustom extends StatefulWidget {

    final String title;    // 标题
    final List<Widget> actions;  // 按钮
    final double height;    // 高度
    final Widget backgroundImage;    // 背景图片

    
    


    SliverAppBarCustom({
        Key key,
        this.title='WIS Home',
        this.actions,
        this.height=200,
        this.backgroundImage
    }) : super(key: key);  

    @override
    _SliverAppBarCustomState createState() => new _SliverAppBarCustomState();
}


class _SliverAppBarCustomState extends State<SliverAppBarCustom> {


    @override
    Widget build(BuildContext context) {


      print( widget.backgroundImage );
      return SliverAppBar(
        // stretch: true,
        // onStretchTrigger: () {
        //   print('sss');
        //   // Function callback for stretch
        //   return;
        // },
        expandedHeight: widget.height,
        floating: false,
        pinned: true,
        snap: false, 
        actions: (widget.actions!=null)?widget.actions:<Widget>[], 
        flexibleSpace: FlexibleSpaceBar(
          stretchModes: <StretchMode>[
            StretchMode.zoomBackground,
            StretchMode.blurBackground,
            StretchMode.fadeTitle,
          ],
          centerTitle: true,
          title: Text( 
            widget.title
          ),          
          background: Stack(
            fit: StackFit.expand,
            children: [
              // Image.network(
              //   'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
              //   fit: BoxFit.cover,
              // ),
              // Image.asset("assets/images/img2.png", fit: BoxFit.fill),
              Container(
                child: (widget.backgroundImage!=null)?widget.backgroundImage:null,
              ),                  
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.0, 0.5),
                    end: Alignment(0.0, 0.0),
                    colors: <Color>[
                      Color(0x60000000),
                      Color(0x00000000),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }  
}