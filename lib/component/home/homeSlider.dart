import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:market/viewModel/home.dart';

class HomeSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  const HomeSlider({super.key, required this.bannerList});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;

  Widget _getSlider() {
    return CarouselSlider(
      carouselController: _controller,
      items: List.generate(widget.bannerList.length, (int index) {
        return Image.network(
          widget.bannerList[index].imageUrl,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        );
      }),
      options: CarouselOptions(
        autoPlayAnimationDuration: Duration(seconds: 3),
        autoPlayInterval: Duration(seconds: 10),
        height: 300,
        viewportFraction: 1,
        autoPlay: true,
        onPageChanged: (int index, reason) {
          _currentIndex = index;
          setState(() {});
        },
      ),
    );
  }

  Widget _getSearch() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 30,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            "搜索……",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _getDot() {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (int index) {
            return GestureDetector(
              onTap: () {
                _controller.animateToPage(index);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 250),
                height: 6,
                width: (index == _currentIndex) ? 40 : 20,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: (index == _currentIndex)
                      ? Colors.white
                      : Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider(), _getSearch(), _getDot()]);
  }
}
