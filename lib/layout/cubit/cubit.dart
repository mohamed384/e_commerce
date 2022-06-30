import 'package:e_commerce/layout/cubit/states.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const Text('Home2'),
    const Text('Home3'),
    const Text('Home4'),
  ];
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeButtonNavState());
  }
}
