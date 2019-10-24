import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigationPage extends StatefulWidget {
  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  final PageController _pageController = PageController();
  num _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Navy Bar")),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Center(child: Text('Home', style: TextStyle(color: Colors.white))),
          Center(child: Text('Users', style: TextStyle(color: Colors.white))),
          Center(child: Text('Messages', style: TextStyle(color: Colors.white))),
          Center(child: Text('Settings', style: TextStyle(color: Colors.white))),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(icon: Icon(Icons.apps), title: Text('Home'), activeColor: Colors.red),
          BottomNavyBarItem(icon: Icon(Icons.people), title: Text('Users'), activeColor: Colors.purpleAccent),
          BottomNavyBarItem(icon: Icon(Icons.message), title: Text('Messages'), activeColor: Colors.pink),
          BottomNavyBarItem(icon: Icon(Icons.settings), title: Text('Settings'), activeColor: Colors.blue),
        ],
      ),
    );
  }
}