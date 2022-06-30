import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
//tt
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<String> categoriesImg = [
      'assets/images/mobiles.jpg',
      'assets/images/electronics.jpg',
      'assets/images/accessories.jpg',
      'assets/images/devices.jpg',
    ];
    List<String> categoriesTitles = [
      'Mobiles',
      'Electronics',
      'Accessories',
      'Electrical Devices',
    ];

    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: BlocConsumer<CategoryCubit, CategoryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          CategoryCubit cubit = CategoryCubit.get(context);
          return Scaffold(
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2.2,
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 0.0,
                  ),
                  itemCount: categoriesImg.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              image: DecorationImage(
                                  image: AssetImage(categoriesImg[index]),
                                  fit: BoxFit.cover,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.black45, BlendMode.hardLight)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: categoriesTitles[index],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          );
        },
      ),
    );
  }
}
