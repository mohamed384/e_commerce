import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/screens/cart/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se_commerce/layout/social_app/cubit/cubit.dart';
import 'package:se_commerce/layout/social_app/cubit/states.dart';
import 'package:se_commerce/modules/product_details/product_details.dart';
import 'package:se_commerce/shared/components/components.dart';
import 'package:se_commerce/shared/components/constants.dart';
import 'package:se_commerce/styles/themes.dart';

class CartScreen extends StatelessWidget {
  //id of cart product


  var len = 0;

  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartScreen, CartStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return StreamBuilder(
          stream: ,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot1) {
            if (snapshot1.hasError) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot1.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            len = snapshot1.data!.docs.length;
            print(snapshot1.data);

            return Scaffold(
              body: len == 0
                  ? Image.asset('assets/images/background.jpg')
                  : Stack(
                      children: [
                        ListView(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(bottom: 50),
                          children: [
                            Column(
                              children: List.generate(len, (index) {


                                return StreamBuilder<DocumentSnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection('products')
                                        .doc(snapshot1.data!.docs[index].id)
                                        .snapshots(),
                                    builder: (context,
                                        AsyncSnapshot<DocumentSnapshot>
                                            snapshot2) {
                                      if (snapshot2.hasError) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }

                                      if (snapshot2.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                      var data =
                                      snapshot2.data;
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            bottom: 20,
                                            top: 20),
                                        child: InkWell(
                                          onTap: () {
                                            navigateTo(
                                              context,
                                              ProductDetailsScreen(
                                                data: data!.id,
                                              ),
                                            );
                                          },
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image(
                                                    image: NetworkImage(
                                                        "${data!['image']}"),
                                                    width: 140,
                                                    height: 180,
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${data['name']}',
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: const TextStyle(
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          '${data['category']}',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.7),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              data['price'],
                                                              style: TextStyle(
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    mainColor,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              'EGP',
                                                              style: TextStyle(
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    mainColor,
                                                              ),
                                                            ),
                                                            const Spacer(),
                                                            IconButton(
                                                                onPressed:
                                                                    () async {
                                                                  await FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          'users')
                                                                      .doc(user!
                                                                          .uid)
                                                                      .collection(
                                                                          'favourites')
                                                                      .doc(data
                                                                          .id)
                                                                      .delete()
                                                                      .then(
                                                                          (value) {
                                                                    showToast(
                                                                      text:
                                                                          'deleted ',
                                                                      state: ToastStates
                                                                          .SUCCESS,
                                                                    );
                                                                  }).catchError(
                                                                          (error) {
                                                                    showToast(
                                                                      text:
                                                                          'Deletion failed, try again ',
                                                                      state: ToastStates
                                                                          .ERROR,
                                                                    );
                                                                  });
                                                                },
                                                                icon: const Icon(
                                                                  Icons
                                                                      .delete_outline,
                                                                  color: Colors
                                                                      .grey,
                                                                  size: 30,
                                                                ))
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (index < len - 1) myDivider(),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              }),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 100,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Total',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 22,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '4500',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black.withOpacity(0.7),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'EGP',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: MaterialButton(
                                      child: const Text(
                                        'Check Out',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            );
          },
        );
      },
    );
  }
}
