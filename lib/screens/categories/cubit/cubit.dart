import 'dart:core';
import 'package:e_commerce/screens/categories/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(CategoryInitialState());

  static CategoryCubit get(context) => BlocProvider.of(context);


}
