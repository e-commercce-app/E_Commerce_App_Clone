part of 'cart_fetch_data_bloc.dart';

sealed class CartFetchDataState {
  const CartFetchDataState();
}

class CartFetchDataInitial extends CartFetchDataState {}

class CartFetchLoadingState extends CartFetchDataState {}

class CartFetchLoadedState extends CartFetchDataState {
  List<MyCartModelClass> fetchData;
  CartFetchLoadedState({required this.fetchData});
}

class CartFetchErrorState extends CartFetchDataState {
  String errorMessage;
  CartFetchErrorState({required this.errorMessage});
}
