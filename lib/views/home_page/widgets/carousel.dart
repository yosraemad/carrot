import 'package:carrot_app/constants/app_doubles.dart';
import 'package:carrot_app/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

/// Carousel shown on top of the [HomePage]
class Carousel extends StatelessWidget {
  const Carousel({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: getCarouselItems(),
      options: CarouselOptions(autoPlay: true, enlargeCenterPage: true),
    );
  }

  List<Widget> getCarouselItems() {
    List<Widget> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(AppDoubles.carouselBorderRadius),
          ),
          child: Image.asset(AppImages.campaignImage),
        ),
      ));
    }

    return list;
  }
}
