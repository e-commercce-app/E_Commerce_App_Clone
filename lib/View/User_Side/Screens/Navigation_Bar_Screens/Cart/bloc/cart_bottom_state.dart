part of 'cart_bottom_bloc.dart';

sealed class CartBottomState {
  const CartBottomState();
}

final class CartBottomInitial extends CartBottomState {}

class LoadingBottomCartState extends CartBottomState {}

class LoadedBottomCartState extends CartBottomState {
  List<MyCartModelClass> cartData;
  LoadedBottomCartState({required this.cartData});
}

class ErrorBottomCartState extends CartBottomState {
  String errorMsg;
  ErrorBottomCartState({required this.errorMsg});
}
