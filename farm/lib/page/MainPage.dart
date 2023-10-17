// import 'package:farm/components/BottomBar.dart';
// import 'package:farm/page/HomePage.dart';
// import 'package:farm/page/VideoPage.dart';
// import 'package:farm/page/login_page.dart';
// import 'package:flutter/material.dart';
// import 'package:farm/page/HomePage.dart';

// class MainPage extends StatelessWidget {
//   final PageController _pageController = PageController();
//   int _selectedPage = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         children: [HomePage(), VideoPage()],
//       ),
//       bottomNavigationBar: BottomBar(
//         onTap: (int index) {
//           _pageController.animateToPage(index,
//               duration: Duration(milliseconds: 300),
//               curve: Curves.easeInOutCubic);
//               StepState
//         },

//         index: _selectedPage,
//       ),
//     );
//   }
// }
// import 'dart:html';

import 'package:farm/components/BottomBar.dart';
import 'package:farm/page/HomePage.dart';
import 'package:farm/page/VideoPage.dart';
import 'package:farm/page/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:farm/page/UserPage.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();

  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    double iconSize = 20;
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: [UserPage()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedItemColor: Color.fromRGBO(111, 156, 103, 1),
        unselectedItemColor: Color.fromRGBO(127, 131, 135, 1),
        onTap: (int index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
          );
          setState(() {
            _selectedPage = index;
          });
        },
        currentIndex: _selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: iconSize,
            ),
            activeIcon: Transform.scale(
              scale: 1.2,
              child: Icon(Icons.home_filled),
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.videocam_rounded,
                size: iconSize,
              ),
              activeIcon: Transform.scale(
                scale: 1.2,
                child: Icon(Icons.videocam_rounded),
              ),
              label: 'text'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart_sharp,
                size: iconSize,
              ),
              activeIcon: Transform.scale(
                scale: 1.2,
                child: Icon(Icons.bar_chart_sharp),
              ),
              label: 'text'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_rounded,
                size: iconSize,
              ),
              activeIcon: Transform.scale(
                scale: 1.2,
                child: Icon(Icons.person_2_rounded),
              ),
              label: 'text'),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
