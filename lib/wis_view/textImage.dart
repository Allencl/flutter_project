import 'package:flutter/material.dart';

// import 'package:wis_flutter/bottomBar.dart';     // 底部导航条



// 图文页面
class TextImagePage extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar( title: const Text('图文-页面') ),  // 头部导航条
          // bottomNavigationBar: BottomBarWidget(),       // 底部导航条
          backgroundColor: Colors.blue[10],
          body: Container(
            padding: EdgeInsets.fromLTRB(8,8,8,8),
            child: ListView(
            children: <Widget>[
                Image.asset(
                  "assets/images/img1.jpeg",
                  // "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1570190499,3408240602&fm=26&gp=0.jpg",
                  fit: BoxFit.cover,
                  height: 200,
                ),

                Text(
                  "      我叫马亨德拉·苏贝迪，是尼泊尔国家通讯社高级副编辑。我认为，“一带一路”是一块经济蛋糕，覆盖面广，涉及宽领域多层次的合作，有助于各参与国深化合作、协同发展"
                  "可以肯定的是，通过促进经济一体化和强化基础设施建设，“一带一路”倡议使我们距离共创人类美好未来的目标又近了一步"
                  "我的国家尼泊尔在2017年与中国签署了“一带一路”合作备忘录，正式加入了“一带一路”倡议。我坚信“一带一路”倡议极具远见，为各方提供了互利合作和建立伙伴关系的机遇。",
                  style: TextStyle(
                    fontSize: 14
                  )
                ),

                Text(
                  "      我叫马亨德拉·苏贝迪，是尼泊尔国家通讯社高级副编辑。我认为，“一带一路”是一块经济蛋糕，覆盖面广，涉及宽领域多层次的合作，有助于各参与国深化合作、协同发展"
                  "可以肯定的是，通过促进经济一体化和强化基础设施建设，“一带一路”倡议使我们距离共创人类美好未来的目标又近了一步"
                  "我的国家尼泊尔在2017年与中国签署了“一带一路”合作备忘录，正式加入了“一带一路”倡议。我坚信“一带一路”倡议极具远见，为各方提供了互利合作和建立伙伴关系的机遇。",
                  style: TextStyle(
                    fontSize: 14
                  )
                ),

                Image.asset(
                  "assets/images/img2.png",
                  // "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1570190499,3408240602&fm=26&gp=0.jpg",
                  fit: BoxFit.cover,
                  height: 200,
                ),

                Text(
                  "      我叫马亨德拉·苏贝迪，是尼泊尔国家通讯社高级副编辑。我认为，“一带一路”是一块经济蛋糕，覆盖面广，涉及宽领域多层次的合作，有助于各参与国深化合作、协同发展"
                  "可以肯定的是，通过促进经济一体化和强化基础设施建设，“一带一路”倡议使我们距离共创人类美好未来的目标又近了一步"
                  "我的国家尼泊尔在2017年与中国签署了“一带一路”合作备忘录，正式加入了“一带一路”倡议。我坚信“一带一路”倡议极具远见，为各方提供了互利合作和建立伙伴关系的机遇。",
                  style: TextStyle(
                    fontSize: 14
                  )
                ),

            ],
          ),
          )
          

      ); 
    }
}




