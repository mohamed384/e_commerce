import 'package:e_commerce/screens/cart/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());

  static CartCubit get(context) => BlocProvider.of(context);

  late DocumentSnapshot mainData;

  void takeData(DocumentSnapshot data){
    mainData=data;
    emit(CartDataShared());

  }





  int productCount=1;
  void addProductCount(){
    productCount++;
    emit(CartAddProductSuccessState());
  }
  void removeProductCount(){
    productCount--;
    emit(CartRemoveProductSuccessState());

  }
  int selectedImage=0;
  void selectImage(int index){
    selectedImage=index;
    emit(CartChangeImageState());

  }

  bool isMore=false;
  void isMoreChange(){
    isMore = !isMore;
    emit(CartIsMoreChange());

  }
  bool isFav=false;
  void isFavChange(){
    //isFav=  FirebaseFirestore.instance.collection('users').doc(uId).collection('favourites').doc().get() as bool;
    isFav = !isFav;
    emit(CartIsFavChange());

  }
  bool isReload=true;
  // void checkFav (data)async{
  //   await   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user!.uid)
  //       .collection('favourites')
  //       .doc(data).get().then((value) {
  //     if (value.exists) {
  //       isFav =true;
  //     }else{
  //       isFav=false;
  //     }
  //   });
  //   isReload=false;
  //
  //   emit(CartCheckFav());
  // }