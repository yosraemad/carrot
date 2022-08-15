import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: getCarouselItems(),
      options: CarouselOptions(),
    );
  }

  List<Widget> getCarouselItems() {
    List<Widget> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Image.asset("assets/images/campaign.png"),
      ));
    }

    return list;
  }
}
