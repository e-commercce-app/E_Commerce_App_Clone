// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';

import '../../../../../../Controller/Services/Controller/get_my_cart_data.dart';
import '../../../../../../Models/my_cart_model_class.dart';

part 'cart_bottom_event.dart';
part 'cart_bottom_state.dart';

class CartBottomBloc extends Bloc<CartBottomEvent, CartBottomState> {
  MyCartFetchDataMethod fetchCartData = MyCartFetchDataMethod();
  CartBottomBloc() : super(CartBottomInitial()) {
    on<CartBottomEvent>((event, emit) async {
      emit.call(LoadingBottomCartState());

      try {
        var getData = await fetchCartData.getAddToCartData();
        emit.call(LoadedBottomCartState(cartData: getData));
      } catch (e) {
        emit.call(ErrorBottomCartState(errorMsg: "No Found Cart Data."));
      }
    });
  }
}
