// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/Models/my_cart_model_class.dart';
import 'package:e_commerce/core/Controller/Services/Controller/get_my_cart_data.dart';

part 'cart_fetch_data_event.dart';
part 'cart_fetch_data_state.dart';

class CartFetchDataBloc extends Bloc<CartFetchDataEvent, CartFetchDataState> {
  CartFetchDataBloc() : super(CartFetchDataInitial()) {
    on<FetchDataEvents>((event, emit) async {
      emit(CartFetchLoadingState());

      try {
        final listOfData = await myCartFetchData.getAddToCartData();
        emit.call(CartFetchLoadedState(fetchData: listOfData));
      } on Exception catch (error) {
        emit(
          CartFetchErrorState(
            errorMessage: "Do'nt Fetch Data $error",
          ),
        );
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
      } on Exception catch (error) {
        emit(
          CartFetchErrorState(
            errorMessage: "Do'nt Remove Item $error",
          ),
        );
      }
    });
  }
  MyCartFetchDataMethod myCartFetchData = MyCartFetchDataMethod();

  MyCartFetchDataMethod cartFetchDataMethod = MyCartFetchDataMethod();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
}
