import 'package:community_dev/views/Teams/TeamsScreen.dart';
import 'package:flutter/material.dart';
import 'package:community_dev/constants/style.dart';
import 'package:community_dev/views/DashboardScreen.dart';
import 'package:community_dev/views/profile/Profile.dart';

import 'package:community_dev/views/Timeline/TimelineScreen.dart';
import 'package:flutter/cupertino.dart';

class HouseScreen extends StatefulWidget {
  @override
  HouseScreenState createState() => HouseScreenState();
}

class HouseScreenState extends State<HouseScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardSecond(),
    TimelineScreen(
      isMyPost: false,
    ),
    TeamsScreen(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: colors.fields,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: BottomNavigationBar(
                  backgroundColor: colors.navigation,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_rounded), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.view_timeline), label: "Timeline"),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.person_3_fill),
                        label: "Teams"),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.person_crop_circle),
                        label: "Profile"),
                  ],
                  currentIndex: _selectedIndex,
                  elevation: 0,
                  selectedItemColor: colors.primary,
                  unselectedItemColor: colors.white,
                  onTap: _onItemTapped,
                )))
                );
  }
}
