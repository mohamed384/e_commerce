import 'package:e_commerce/layout/cubit/cubit.dart';
import 'package:e_commerce/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text('ECommerce'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_box_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.message),
                  ),
                ],
              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottomNav(index);
                },
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(cubit.currentIndex == 0
                        ? Ionicons.home
                        : Ionicons.home_outline),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(cubit.currentIndex == 1
                          ? Ionicons.grid
                          : Ionicons.grid_outline),
                      label: 'Category'),
                  BottomNavigationBarItem(
                      icon: Icon(cubit.currentIndex == 2
                          ? Ionicons.person
                          : Ionicons.person_outline),
                      label: 'Person'),
                  BottomNavigationBarItem(
                      icon: Icon(cubit.currentIndex == 3
                          ? Ionicons.cart
                          : Ionicons.cart_outline),
                      label: 'Profile'),
                ],
              ),
            );
          },
        ));
  }
}
