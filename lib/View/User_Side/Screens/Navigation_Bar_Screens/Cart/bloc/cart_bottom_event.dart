part of 'cart_bottom_bloc.dart';

sealed class CartBottomEvent {
  const CartBottomEvent();
}

class FetchBottomCartEvent extends CartBottomEvent {}
