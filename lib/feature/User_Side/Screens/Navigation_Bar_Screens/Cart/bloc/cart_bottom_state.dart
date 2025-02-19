part of 'cart_bottom_bloc.dart';

sealed class CartBottomState {
  const CartBottomState();
}

final class CartBottomInitial extends CartBottomState {}

class LoadingBottomCartState extends CartBottomState {}

class LoadedBottomCartState extends CartBottomState {
  LoadedBottomCartState({required this.cartData});
  List<MyCartModelClass> cartData;
}

class ErrorBottomCartState extends CartBottomState {
  ErrorBottomCartState({required this.errorMsg});
  String errorMsg;
}

// ! Delete Item State
class RemoveItemCartBottomState extends CartBottomState {}
