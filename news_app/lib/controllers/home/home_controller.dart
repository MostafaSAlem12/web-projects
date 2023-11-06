import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ionicons/ionicons.dart';

class HomeController extends GetxController {
  int _tab = 0;
  int get tab => _tab;

  final List<BottomNavigationBarItem> tabs = const [
    BottomNavigationBarItem(
      icon: Icon(Ionicons.home_outline),
      tooltip: 'Home',
      activeIcon: Icon(Ionicons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Ionicons.trending_up_outline),
      tooltip: 'Trending',
      activeIcon: Icon(Ionicons.trending_up),
      label: 'Trending',
    ),
    BottomNavigationBarItem(
      icon: Icon(Ionicons.globe_outline),
      tooltip: 'Global',
      activeIcon: Icon(Ionicons.globe),
      label: 'Global',
    ),
    BottomNavigationBarItem(
      icon: Icon(Ionicons.settings_outline),
      tooltip: 'Settings',
      activeIcon: Icon(Ionicons.settings),
      label: 'Settings',
    ),
  ];

  void setTab(int tab) {
    _tab = tab;
    update();
  }
}
