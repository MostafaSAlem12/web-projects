import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/controllers/home/home_controller.dart';
import 'package:news_app/views/screens/home/tabs/settings_tab.dart';
import 'package:news_app/views/screens/home/tabs/top_headline_tab.dart';
import 'package:news_app/views/widgets/home/globe/empty_globe_widget.dart';
import 'package:news_app/views/widgets/home/trend/empty_trend_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Ionicons.newspaper_outline,
              ),
              SizedBox(
                width: 10,
              ),
              Text('News'),
            ],
          ),
          actions: [
            if (controller.tabs[controller.tab].label != 'Settings')
              IconButton(
                onPressed: () {},
                tooltip: 'Search',
                style: IconButton.styleFrom(
                  shape: const CircleBorder(),
                ),
                icon: const Icon(
                  Ionicons.search,
                ),
              ),
          ],
        ),
        body: _getPage(controller.tab),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.tab,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: controller.setTab,
          items: controller.tabs,
        ),
      );
    });
  }

  Widget _getPage(int page) {
    switch (page) {
      case 0:
        return const TopHeadlineTab();
      case 1:
        return const EmptyTrendWidget();
      case 2:
        return const EmptyGlobeWidget();
      default:
        return const SettingsTab();
    }
  }
}
