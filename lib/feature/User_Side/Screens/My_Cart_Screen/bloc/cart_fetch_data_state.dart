part of 'cart_fetch_data_bloc.dart';

sealed class CartFetchDataState {
  const CartFetchDataState();
}

class CartFetchDataInitial extends CartFetchDataState {}

class CartFetchLoadingState extends CartFetchDataState {}

class CartFetchLoadedState extends CartFetchDataState {
  CartFetchLoadedState({required this.fetchData});
  List<MyCartModelClass> fetchData;
}

class CartFetchErrorState extends CartFetchDataState {
  CartFetchErrorState({required this.errorMessage});
  String errorMessage;
}

// ! Delete Item State
class RemoveItemCartState extends CartFetchDataState {}
