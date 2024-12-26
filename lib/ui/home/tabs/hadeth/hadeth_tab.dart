import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_c13/ui/home/tabs/hadeth/hadeth_page.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: double.infinity,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
      ),
      items: List.generate(
        50,
        (index) => index + 1,
      ).map((index) {
        return HadethPage(
          index,
          key: Key("hadeth-$index"),
        );
      }).toList(),
    );
  }
}
