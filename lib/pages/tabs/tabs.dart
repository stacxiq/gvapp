import 'package:flutter/material.dart';
import 'package:greenvilllage/pages/home/home.dart';
import 'package:greenvilllage/pages/news/news.dart';
import 'package:greenvilllage/pages/settings/setting.dart';
import 'package:iconsax/iconsax.dart';

//
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;

  final _pages = [
    HomePage(),
    Concept9List(),
    SettingsPage(),
  ];
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.bookmark),
            label: 'الاخبار',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.setting),
            label: 'الاعدادات',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff28635F),
        onTap: _onItemTapped,
      ),
    );
  }
}
