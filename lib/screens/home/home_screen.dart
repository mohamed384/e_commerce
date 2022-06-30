import 'package:e_commerce/screens/home/cubit/cubit.dart';
import 'package:e_commerce/screens/home/cubit/states.dart';
import 'package:e_commerce/screens/home/poduct_card.dart';
import 'package:e_commerce/shared/component/carousel_slider.dart';
import 'package:e_commerce/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {



  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   const List images=[
      'https://img.freepik.com/free-vector/special-offer-big-sale-colorful-background_1361-3387.jpg?size=338&ext=jpg',
      'https://image.freepik.com/free-psd/black-friday-pc-mock-up-with-blue-neon-lights_23-2148330769.jpg',
      'https://image.freepik.com/free-vector/fast-free-delivery-logo-with-bike-man-courier_1308-46678.jpg',
    ];
    return BlocProvider(
      create: (context) => HomeScreenCubit(),
      child: BlocConsumer<HomeScreenCubit, HomeScreenStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = HomeScreenCubit.get(context);
            return   SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const CarouselSliderComponent(images: images),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Row(
                          children:  const [
                            Text(
                              'hot offers',
                              style: TextStyle(
                                fontSize: titleSize,
                                color: mainColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'see all',
                              style: TextStyle(

                                fontSize: 20.0,
                                fontWeight: FontWeight.w800,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 200.0,

                          child: ListView.separated(

                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => ProductCard(image: images[index], title: 'iphone', price: 20000, oldPrice: 18000, press: (){}),
                              separatorBuilder: (context, index) => const SizedBox(
                                width: 10.0,
                              ),
                              itemCount: images.length),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            );
          }),
    );
  }




}
