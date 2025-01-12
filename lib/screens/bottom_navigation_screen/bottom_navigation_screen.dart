import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/styles/icons/icons_app.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  static const String routeName = '/bottom_navigation_screen';

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedPage = 0;

  static const List<Widget> _widgetOptions = [
    Text('SADASDSA'),
    Text('aaaaaaaaaaaaa'),
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
            icon: SvgPicture.asset(
              KittyIcons.report,
            ),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(KittyIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(KittyIcons.setting),
            label: 'Setting',
          ),
        ],
        onTap: onSelectedTab,
      ),
    );
  }
}
