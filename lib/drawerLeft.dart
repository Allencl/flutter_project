import 'package:flutter/material.dart';


// 左边 侧栏
class DrawerLeftPage extends StatefulWidget {


    DrawerLeftPage({
        Key key,
    }) : super(key: key);

    @override
    _DrawerLeftPageState createState() => new _DrawerLeftPageState();
}

class _DrawerLeftPageState extends State<DrawerLeftPage> {


    @override
    Widget build(BuildContext context) {
      return Drawer(
        child: Stack(
          children: <Widget>[

            Container(
              color: Colors.blue,
              padding: const EdgeInsets.fromLTRB(0,42,0,0),
              height: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.fromLTRB(0,10,0,0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/images/img3.jpg")
                        )                
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(0,22,0,5),
                        child: Text(
                          '李某某',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(0,5,0,5),
                        child: Text(
                          '项目经理',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(0,5,0,5),
                        child: Text(
                          '18732129809',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(0,2,0,5),
                        child: Text(
                          'jieama_sdsd@outlook.com.cn',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white
                          ),
                        ),
                      ),                      

                    ],
                  )
                ],
              ),
            ),

            Container(
              margin:EdgeInsets.fromLTRB(0,300,0,0),
              child: ListView(
                children: <Widget>[

                    BTNMenu(
                      label:'年度计划',
                      icon: Icon( 
                        Icons.flight, 
                        color: Colors.deepPurple, 
                        size: 24.0
                      ),
                      // suffixIcon:true,  // 后面icon
                      onTap:(){
                        // print('新闻');
                        Navigator.pushNamed(context,"/BI");
                      }
                    ), 

                    BTNMenu(
                      label:'新闻',
                      icon: Icon( Icons.flag, color: Colors.orange, size: 24.0),
                      // suffixIcon:true,  // 后面icon
                      onTap:(){
                        // print('新闻');
                        Navigator.pushNamed(context,"/textImage");
                      }
                    ), 

                    BTNMenu(
                      label:'退出登录',
                      icon: Icon( Icons.arrow_back, color: Colors.green, size: 24.0),
                      // suffixIcon:true,  // 后面icon
                      onTap:(){
                        // print('退出登录');
                        Navigator.pushNamed(context,"/login");
                      }
                    ), 

                    

                ],
              ),
            )

          ]
        )
      ); 
    }
}




// 按钮
class BTNMenu extends StatefulWidget {

    final String label;
    final Function onTap;
    final Icon icon;
    final bool suffixIcon;

    BTNMenu({
        Key key,
        this.label,
        this.onTap,
        this.icon,
        this.suffixIcon=true
    }) : super(key: key);

    @override
    _BTNMenuState createState() => new _BTNMenuState();
}

class _BTNMenuState extends State<BTNMenu> {

  @override
  Widget build(BuildContext context) {

    return InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0, top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                Container(
                  child:  (widget.icon!=null)?Container(
                    width: 35.0,
                    height: 35.0,
                    margin: const EdgeInsets.only(right: 10.0),
                    // decoration: BoxDecoration(
                    //   // color: Colors.black54,
                    //   borderRadius: BorderRadius.circular(3.0),
                    // ),
                    alignment: Alignment.center,
                    child: widget.icon,
                  )
                  :null
                ),
                Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 15
                  ),
                ),
                Expanded(child:Container()),
                Container(
                  child: (widget.suffixIcon)?IconButton(
                    icon: Icon(Icons.chevron_right, color: Colors.black26),
                    onPressed: (){}
                  ):null,
                )
            ],
          ),
        ),
    );    
  }

}







