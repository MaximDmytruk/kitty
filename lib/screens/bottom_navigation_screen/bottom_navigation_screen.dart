import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';

import '../home_screen/home_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  static const String routeName = '/bottom_navigation_screen';

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedPage = 1;

  static const List<Widget> _widgetOptions = [
    Text('aaaaaaaaaaaaa'),
    HomeScreen(),
    Text('asddddddddddddd'),
  ];

  void onSelectedTab(int index) {
    if (_selectedPage == index) return;
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedPage]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: _selectedPage == 0
                ? SvgPicture.asset(KittyIcons.reportSelected)
                : SvgPicture.asset(KittyIcons.report),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: _selectedPage == 1
                ? SvgPicture.asset(KittyIcons.homeSelected)
                : SvgPicture.asset(KittyIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedPage == 2
                ? SvgPicture.asset(KittyIcons.settingSelected)
                : SvgPicture.asset(KittyIcons.setting),
            label: 'Setting',
          ),
        ],
        selectedItemColor: KittyColors.grey66,
        backgroundColor: KittyColors.white,
        onTap: onSelectedTab,
      ),
    );
  }
}
