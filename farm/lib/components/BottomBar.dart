import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final Function(int) onTap;
  final int index;
  const BottomBar({super.key, required this.onTap, required this.index});
  @override
  Widget build(BuildContext context) {
    double iconSize = 20;

    return BottomNavigationBar(
      backgroundColor: Colors.red,
      selectedItemColor: Color.fromRGBO(111, 156, 103, 1),
      unselectedItemColor: Color.fromRGBO(127, 131, 135, 1),
      currentIndex: index,
      
      onTap: onTap,
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
    );
  }
}
