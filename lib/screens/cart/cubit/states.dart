abstract class CartStates {}
class CartInitialState extends CartStates{}

class CartChangeBottomNavState extends CartStates{}

class CartProductLoadingState extends CartStates{}
class CartProductSuccessState extends CartStates{}
class CartProductErrorState extends CartStates{
  final String error;
  CartProductErrorState(this.error);
}
class CartAddProductSuccessState extends CartStates{}
class CartRemoveProductSuccessState extends CartStates{}

class CartChangeImageState extends CartStates{}

class CartIsMoreChange extends CartStates{}

class CartIsFavChange extends CartStates{}

class CartCheckFav extends CartStates{}

class CartDataShared extends CartStates{}

class CartCartData extends CartStates{}