import 'package:flutter/material.dart';

import 'package:market/component/home/homeSlider.dart';
import 'package:market/component/home/category.dart';
import 'package:market/component/home/suggestion.dart';
import 'package:market/component/home/hot.dart';
import 'package:market/component/home/moreList.dart';
import 'package:market/viewModel/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _bannerList = [
    BannerItem(
      ID: "1",
      imageUrl:
          "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.png",
    ),
    BannerItem(
      ID: "2",
      imageUrl:
          "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png",
    ),
    BannerItem(
      ID: "3",
      imageUrl:
          "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.png",
    ),
  ];

  List<Widget> _getScrollChild() {
    return [
      SliverToBoxAdapter(child: HomeSlider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Category()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Suggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: Hot()),
              SizedBox(width: 10),
              Expanded(child: Hot()),
            ],
          ),
        ),
      ),

      SliverToBoxAdapter(child: SizedBox(height: 10)),
      MoreList(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChild());
  }
}
