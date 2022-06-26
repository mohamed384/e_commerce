import 'package:e_commerce/layout/cubit/states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [
    Text('Home1'),
    Text('Home2'),
    Text('Home3'),
    Text('Home4'),
  ];
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeButtonNavState());
  }
}
