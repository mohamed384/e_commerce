import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se_commerce/layout/social_app/cubit/cubit.dart';
import 'package:se_commerce/layout/social_app/cubit/states.dart';
import 'package:se_commerce/styles/themes.dart';



class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit = SocialCubit.get(context);

    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2.2,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                ),
                itemCount: cubit.categoriesImg.length,
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
                                image: AssetImage(cubit.categoriesImg[index]),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black45, BlendMode.hardLight)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: cubit.categoriesTitles[index],
                                  style: TextStyle(
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
    );
  }
}
