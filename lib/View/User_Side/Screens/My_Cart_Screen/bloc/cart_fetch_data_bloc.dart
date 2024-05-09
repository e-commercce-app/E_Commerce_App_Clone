// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Controller/Services/Controller/get_my_cart_data.dart';

import '../../../../../Export/e_commerce_export.dart';
import '../../../../../Models/my_cart_model_class.dart';

part 'cart_fetch_data_event.dart';
part 'cart_fetch_data_state.dart';

class CartFetchDataBloc extends Bloc<CartFetchDataEvent, CartFetchDataState> {
  MyCartFetchDataMethod myCartFetchData = MyCartFetchDataMethod();

  MyCartFetchDataMethod cartFetchDataMethod = MyCartFetchDataMethod();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  CartFetchDataBloc() : super(CartFetchDataInitial()) {
    on<FetchDataEvents>((event, emit) async {
      emit(CartFetchLoadingState());

      try {
        var listOfData = await myCartFetchData.getAddToCartData();
        emit.call(CartFetchLoadedState(fetchData: listOfData));
      } catch (error) {
        emit(CartFetchErrorState(
            errorMessage: "Do'nt Fetch Data ${error.toString()}"));
      }
    });

    on<RemoveItemCartEvent>((event, emit) async {
      try {
        await cartFetchDataMethod
            .deleteCartProduct(itemID: event.itemID)
            .then((value) {
          emit(CartFetchLoadingState());
          NavigatorService.goBack();
          CustomDialog.toastMessage(message: 'Delete Item');
        });
      } catch (error) {
        emit(CartFetchErrorState(
            errorMessage: "Do'nt Remove Item ${error.toString()}"));
      }
    });
  }
}
