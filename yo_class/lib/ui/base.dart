import 'package:coursehub/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:coursehub/chatpage.dart';

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _current = 0;
  final List<Widget> _screens = [
    HomePage(),
    ExplorePage(),
    SingleCoursePage(),
    chatpage(),
  ];

  void _onTap(int index) {
    try {
      // Catch RangeError for missing pages
      setState(() {
        _current = index;
      });
    } catch (e) {
      // page unimplemented
      print('Missing Page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_current],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        currentIndex: _current,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color(0xff4769FF),
              ),
              label: 'home',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.launch,
                color: Color(0xff4769FF),
              ),
              label: 'explore'),
          // backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.grid_on,
                color: Color(0xff4769FF),
              ),
              label: 'courses',
              backgroundColor: Colors.white),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.person,
          //       color: Color(0xff4769FF),
          //     ),
          //     label: 'profile',
          //     backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
                color: Color(0xff4769FF),
              ),
              label: 'Chartroom'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_call, color: Color(0xff4769FF)),
              label: 'live class'),
        ],
      ),
    );
  }
}
