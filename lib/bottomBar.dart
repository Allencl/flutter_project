import 'package:flutter/material.dart';


// 底部 导航条
class BottomBarWidget extends StatefulWidget {
  BottomBarWidget({Key key}) : super(key: key);

  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
                      
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
           
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,

        // 选中颜色
        // selectedItemColor: Colors.amber[800],
        onTap: (index){
            setState(() {
              _selectedIndex = index;
            });

            // 页面跳转
            switch (index) {
                case 0:
                    Navigator.pushNamed(context,"/");
                break;
            default:
          }
        },
      );
  }
}