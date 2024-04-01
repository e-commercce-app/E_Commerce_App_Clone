part of 'cart_fetch_data_bloc.dart';

sealed class CartFetchDataEvent {
  const CartFetchDataEvent();
}

class FetchDataEvents extends CartFetchDataEvent {}

class RemoveItemCartEvent extends CartFetchDataEvent {
  String itemID;
  RemoveItemCartEvent({required this.itemID});
}
