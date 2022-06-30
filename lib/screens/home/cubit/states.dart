abstract class HomeScreenStates {}
class HomeScreenInitialState extends HomeScreenStates{}



class HomeScreenProductErrorState extends HomeScreenStates{
  final String error;
  HomeScreenProductErrorState(this.error);
}
