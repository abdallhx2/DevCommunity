import 'package:community_dev/Controller/dashboardController.dart';
import 'package:community_dev/components/NewsCard.dart';


import 'package:community_dev/constants/style.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DotSlider extends StatefulWidget {
  const DotSlider({super.key});

  @override
  State<DotSlider> createState() => _DotSliderState();
}

class _DotSliderState extends State<DotSlider> {
  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.find();
    List? list = controller.News;

    final CarouselController ccontroller = CarouselController();
    List<Widget> items = [];

    if (list != null)
      items = [
        NewsCard(
          title: list[0]["title"].toString(),
          Link: list[0]["Link"].toString(),
        ),
        NewsCard(
          title: list[1]["title"].toString(),
          Link: list[1]["Link"].toString(),
        ),
        NewsCard(
          title: list[2]["title"].toString(),
          Link: list[2]["Link"].toString(),
        ),
        NewsCard(
          title: list[3]["title"].toString(),
          Link: list[3]["Link"].toString(),
        ),
        NewsCard(
          title: list[4]["title"].toString(),
          Link: list[4]["Link"].toString(),
        ),
      ];

    return Column(
      children: [
        CarouselSlider(
          carouselController: ccontroller,
          items: items,
          options: CarouselOptions(
            height: 100,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {},
            scrollDirection: Axis.horizontal,
          ),
        ),
        // Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: items.asMap().entries.map((entry) {
        //       return GestureDetector(
        //         onTap: () => _ccontroller.animateToPage(entry.key),
        //         child: Container(
        //           width: 7,
        //           height: 7,
        //           margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        //           decoration: BoxDecoration(
        //               shape: BoxShape.circle,
        //               color: (Theme.of(context).brightness == Brightness.dark
        //                       ? colors.primary
        //                       : Colors.white)
        //                   .withOpacity(_current == entry.key ? 0.9 : 0.4)),
        //         ),
        //       );
        //     }).toList()),
      ],
    );
  }
}
