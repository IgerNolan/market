import 'package:flutter/material.dart';

import 'package:market/page/cart/index.dart';
import 'package:market/page/category/index.dart';
import 'package:market/page/home/index.dart';
import 'package:market/page/mine/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, String>> _tabList = [
    {
      "icon": "lib/asset/home_normal.png",
      "active_icon": "lib/asset/home_active.png",
      "name": "首页",
    },
    {
      "icon": "lib/asset/category_normal.png",
      "active_icon": "lib/asset/category_active.png",
      "name": "分类",
    },
    {
      "icon": "lib/asset/cart_normal.png",
      "active_icon": "lib/asset/cart_active.png",
      "name": "购物车",
    },
    {
      "icon": "lib/asset/mine_normal.png",
      "active_icon": "lib/asset/mine_active.png",
      "name": "我的",
    },
  ];

  int _currentIndex = 0;

  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_tabList.length, (index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]["active_icon"]!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]["name"],
      );
    });
  }

  List<Widget> _getChildWidget() {
    return [HomeView(), CategoryView(), CartView(), MineView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getChildWidget()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          _currentIndex = index;
          setState(() {});
        },
        currentIndex: _currentIndex,
        items: _getTabBarWidget(),
      ),
    );
  }
}
