
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';



class BrandSlider extends StatelessWidget {
  const BrandSlider({super.key});

  @override
  Widget build(BuildContext context) {
    List slider = ["assets/images/img.png","assets/images/img.png","assets/images/img.png","assets/images/img.png",];
    return CarouselSlider.builder(
      itemCount: slider.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                image: DecorationImage(
                    image: AssetImage(slider[index]), fit: BoxFit.cover)));
      },
      options: CarouselOptions(
        height: 160,
        aspectRatio: 16 / 9,
        viewportFraction: .9,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
