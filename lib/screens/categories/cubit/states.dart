abstract class SocialStates {}
class SocialInitialState extends SocialStates{}

class SocialChangeBottomNavState extends SocialStates{}

class SocialProductLoadingState extends SocialStates{}
class SocialProductSuccessState extends SocialStates{}
class SocialProductErrorState extends SocialStates{
  final String error;
  SocialProductErrorState(this.error);
}
class SocialAddProductSuccessState extends SocialStates{}
class SocialRemoveProductSuccessState extends SocialStates{}

class SocialChangeImageState extends SocialStates{}

class SocialIsMoreChange extends SocialStates{}

class SocialIsFavChange extends SocialStates{}

class SocialCheckFav extends SocialStates{}

class SocialDataShared extends SocialStates{}

class SocialCartData extends SocialStates{}
