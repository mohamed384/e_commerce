import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se_commerce/layout/social_app/cubit/states.dart';
import 'package:se_commerce/modules/cart/cart_screen.dart';
import 'package:se_commerce/modules/categories/categories_screen.dart';
import 'package:se_commerce/modules/home/home_screen.dart';
import 'package:se_commerce/shared/components/constants.dart';

import '../../../modules/profile/profile_screen.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

late DocumentSnapshot mainData;

void takeData(DocumentSnapshot data){
  mainData=data;
  emit(SocialDataShared());

}

//for bottomNavigationBar
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  List<String> titles = [
    'Home',
    'Categories',
    'Your Cart',
    'Profile',
  ];List<String> categoriesTitles = [
    'Mobiles',
    'Electronics',
    'Accessories',
    'Electrical Devices',
  ];
  List<String> categoriesImg = [
    'assets/images/mobiles.jpg',
    'assets/images/electronics.jpg',
    'assets/images/accessories.jpg',
    'assets/images/devices.jpg',
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(SocialChangeBottomNavState());
  }

  int productCount=1;
  void addProductCount(){
    productCount++;
    emit(SocialAddProductSuccessState());
  }
  void removeProductCount(){
    productCount--;
    emit(SocialRemoveProductSuccessState());

  }
  int selectedImage=0;
  void selectImage(int index){
    selectedImage=index;
    emit(SocialChangeImageState());

  }

  bool isMore=false;
  void isMoreChange(){
    isMore = !isMore;
    emit(SocialIsMoreChange());

  }
  bool isFav=false;
  void isFavChange(){
    //isFav=  FirebaseFirestore.instance.collection('users').doc(uId).collection('favourites').doc().get() as bool;
    isFav = !isFav;
    emit(SocialIsFavChange());

  }
  bool isReload=true;
  void checkFav (data)async{
 await   FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('favourites')
        .doc(data).get().then((value) {
      if (value.exists) {
        isFav =true;
      }else{
        isFav=false;
      }
    });
 isReload=false;

    emit(SocialCheckFav());
  }


  // getProduct() {
  //   return FirebaseFirestore.instance
  //       .collection('products')
  //       .snapshots()
  //       .map((QuerySnapshot querySnapshot) =>
  //           querySnapshot.docs.map((DocumentSnapshot documentSnapshot) => {
  //             image=documentSnapshot['image'],
  //             name=documentSnapshot['name'],
  //             price=documentSnapshot['price'],
  //             oldPrice=documentSnapshot['oldPrice'],
  //             discount=documentSnapshot['discount'],
  //           }));
  //
  //   // emit(SocialProductLoadingState());
  //   //  FirebaseFirestore.instance
  //   //     .collection('products')
  //   //     .doc(idProduct[0])
  //   //     .get()
  //   //     .then((value) {
  //   //   image = value['image'];
  //   //   name = value['name'];
  //   //   price = value['price'];
  //   //   oldPrice = value['oldPrice'];
  //   //   discount = value['discount'];
  //   //   emit(SocialProductSuccessState());
  //   // }).catchError((error) {
  //   //   emit(SocialProductErrorState(error.toString()));
  //   // });
  // }


}
