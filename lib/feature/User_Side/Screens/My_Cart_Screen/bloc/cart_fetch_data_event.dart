part of 'cart_fetch_data_bloc.dart';

sealed class CartFetchDataEvent {
  const CartFetchDataEvent();
}

class FetchDataEvents extends CartFetchDataEvent {}

class RemoveItemCartEvent extends CartFetchDataEvent {
  RemoveItemCartEvent({required this.itemID});
  String itemID;
}
