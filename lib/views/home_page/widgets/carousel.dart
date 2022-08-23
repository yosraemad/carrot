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
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Image.asset("assets/images/campaign.png"),
        ),
      ));
    }

    return list;
  }
}
