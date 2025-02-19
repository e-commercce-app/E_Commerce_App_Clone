// ignore_for_file: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/Models/my_cart_model_class.dart';
import 'package:e_commerce/core/Controller/Services/Controller/get_my_cart_data.dart';

part 'cart_bottom_event.dart';
part 'cart_bottom_state.dart';

class CartBottomBloc extends Bloc<CartBottomEvent, CartBottomState> {
  CartBottomBloc() : super(CartBottomInitial()) {
    on<CartBottomEvent>((event, emit) async {
      emit.call(LoadingBottomCartState());

      try {
        final getData = await fetchCartData.getAddToCartData();
        emit.call(LoadedBottomCartState(cartData: getData));
      } on Exception catch (e) {
        emit.call(ErrorBottomCartState(errorMsg: 'No Found Cart Data.'));
      }
    });

    on<RemoveItemBottomCartEvent>((event, emit) async {
      try {
        await cartFetchDataMethod
            .deleteCartProduct(itemID: event.itemID)
            .then((value) {
          emit(LoadingBottomCartState());
          NavigatorService.goBack();
          CustomDialog.toastMessage(message: 'Delete Item');
        });
      } on Exception catch (error) {
        emit(
          ErrorBottomCartState(
            errorMsg: "Do'nt Remove Item $error",
          ),
        );
      }
    });
  }
  MyCartFetchDataMethod fetchCartData = MyCartFetchDataMethod();

  MyCartFetchDataMethod cartFetchDataMethod = MyCartFetchDataMethod();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
}
