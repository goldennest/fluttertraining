import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyCarouselPage extends StatelessWidget {
  final List<String> images = [
    'assets/risk.png',
    'assets/riskassesment.png',
    'assets/technology.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Carousel Slider Example'),
        ),
        body: Center(
          child: CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (BuildContext context, int itemIndex, int realIndex) {
              return Container(
                height: 260,
                width: 300,
                color: Colors.grey,
                child: Image.asset(
                  images[itemIndex],
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction:0.9,
              aspectRatio: 1.0,
              initialPage: 0,
              // Add other options as needed
            ),
          ),
        ));
  }
}
