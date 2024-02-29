// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:e_commerce/Controller/Services/get_my_cart_data.dart';

import '../../../../Models/my_cart_model_class.dart';

part 'cart_fetch_data_event.dart';
part 'cart_fetch_data_state.dart';

class CartFetchDataBloc extends Bloc<CartFetchDataEvent, CartFetchDataState> {
  MyCartFetchDataMethod myCartFetchData = MyCartFetchDataMethod();

  CartFetchDataBloc() : super(CartFetchDataInitial()) {
    on<FetchDataEvents>((event, emit) async {
      emit(CartFetchLoadingState());

      try {
        var listOfData = await myCartFetchData.getAddToCartData();
        emit(CartFetchLoadedState(fetchData: listOfData));
      } catch (error) {
        emit(CartFetchErrorState(
            errorMessage: "Do'nt Fetch Data ${error.toString()}"));
      }
    });
  }
}
