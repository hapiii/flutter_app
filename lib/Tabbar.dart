import 'package:flutter/material.dart';
import 'Controllers/HomeController.dart';
import 'Controllers/MyController.dart';
import 'Controllers/ClassController.dart';

class Tabbar extends StatefulWidget {
  @override
  createState() => new TabbarState();
}

class TabbarState extends State<Tabbar> {//<>是谁的state

  int _selectedIndex = 0;
  List<Widget> _pages = List<Widget>();

  void initState(){
    super.initState();
    _pages.add(HomeController());
    _pages.add(ClassController());
    _pages.add(MyController());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('在行')),
          BottomNavigationBarItem(icon: Icon(Icons.my_location), title: Text('知乎日报')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.red,
        onTap: (int index){
          setState(() {
            _selectedIndex = index;
          });
        },

      ),
      body:_pages[_selectedIndex],
    );
  }

}