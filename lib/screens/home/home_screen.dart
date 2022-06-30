
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/screens/cart/cubit/cubit.dart';
import 'package:e_commerce/screens/cart/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {



  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   var cubit = CartCubit.get(context);
    return BlocConsumer<CartCubit, CartStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return   builderBuilder(
            context: context,
          );
        });
  }

  Widget builderBuilder({
    required context,
  }) =>
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items:  const [
                Image(
                  image: CachedNetworkImageProvider(
                      'https://img.freepik.com/free-vector/special-offer-big-sale-colorful-background_1361-3387.jpg?size=338&ext=jpg'),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image(
                  image: CachedNetworkImageProvider(
                      'https://image.freepik.com/free-psd/black-friday-pc-mock-up-with-blue-neon-lights_23-2148330769.jpg'),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image(
                  image: CachedNetworkImageProvider(
                      'https://image.freepik.com/free-vector/fast-free-delivery-logo-with-bike-man-courier_1308-46678.jpg'),
                  width: double.infinity,
                  //fit: BoxFit.cover,
                ),
              ],
              options: CarouselOptions(
                height: 250.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                viewportFraction: 1.0,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      );



}
