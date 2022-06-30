import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderComponent extends StatelessWidget {

  final List images;
  const CarouselSliderComponent({Key? key, required this.images,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items:images.map((e){
        return  Image(
          image: CachedNetworkImageProvider(
            e,
              ),
          width: double.infinity,
          fit: BoxFit.cover,
        );
      }).toList(),
      options: CarouselOptions(
        height: 200.0,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        viewportFraction: 1,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
