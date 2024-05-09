import 'package:flutter/cupertino.dart';

import '../../../../Components/Error/cart_no_item_page.dart';
import '../../../../Components/Widgets/AppBar/app_bar_leading_icon_button.dart';
import '../../../../Components/Widgets/AppBar/custom_appbar.dart';
import '../../../../Controller/Services/Controller/cart_product_price.dart';
import '../../../../Controller/Services/Controller/get_my_cart_data.dart';
import '../../../../Export/e_commerce_export.dart';
import 'Components/custom_delete_cart_dialog.dart';
import 'Components/custom_my_cart_design.dart';
import 'bloc/cart_fetch_data_bloc.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({
    super.key,
  });
  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  late Size size;

  MyCartFetchDataMethod cartFetchDataMethod = MyCartFetchDataMethod();
  CartProductManagePrice managePrice = CartProductManagePrice();
  @override
  void initState() {
    super.initState();
    managePrice.fetchProductPrice();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // ! Initial Events Calls .
    context.read<CartFetchDataBloc>().add(FetchDataEvents());
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => CartFetchDataBloc(),
      child: Scaffold(
        body: BlocBuilder<CartFetchDataBloc, CartFetchDataState>(
          bloc: context.read<CartFetchDataBloc>(),
          builder: (context, state) {
            if (state is CartFetchLoadingState ||
                state is CartFetchDataInitial) {
              return Center(
                  child: CircularProgressIndicator.adaptive(
                backgroundColor: Resources.colors.kButtonColor,
              ));
            } else if (state is CartFetchLoadedState) {
              // ! Load Data .
              return state.fetchData.isEmpty
                  ? const CartNoItemFound()
                  : Column(
                      children: [
                        // ! My Cart Custom App Bar
                        customMyCart(state),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.fetchData.length,
                            itemBuilder: (context, index) {
                              return CustomCartDesign(
                                imagePath: state.fetchData[index].productImage
                                    .toString(),
                                positionStaggeredList: state.fetchData.length,
                                productName: state.fetchData[index].productName
                                    .toString(),
                                productPrice:
                                    state.fetchData[index].productPrice ?? 0,
                                quantity: state.fetchData[index].quantity ?? 0,
                                deleteButton: () {
                                  // ! Show Delete Dialog .
                                  customDeleteCartDialogWidget(
                                    context: context,
                                    state: state,
                                    index: index,
                                    size: size,
                                    onPressedOky: () async {
                                      context.read<CartFetchDataBloc>().add(
                                          RemoveItemCartEvent(
                                              itemID: state
                                                  .fetchData[index].productUid
                                                  .toString()));
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),

                        Container(
                          height: size.height * 0.15,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Resources.colors.kWhite,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 0.2,
                                    spreadRadius: 0.2,
                                    color: Resources.colors.kGrey)
                              ]),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AutoSizeText(
                                        totalCost,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              color: Resources.colors.kGray600,
                                            ),
                                      ),
                                      AutoSizeText(
                                        "\$${managePrice.totalPrice.toStringAsFixed(1)}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                                color: Resources
                                                    .colors.kPrimaryContainer),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: CustomSizedBox(
                                    widthRatio: 0.9,
                                    heightRatio: 0.06,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: CustomButton(
                                          size: size,
                                          onPressed: () {
                                            if (state.fetchData.isNotEmpty) {
                                              NavigatorService.pushNamed(
                                                  RoutesName.checkOutScreen);
                                            }
                                          },
                                          buttonText: checkout.toUpperCase()),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const CustomSizedBox(
                          heightRatio: 0.06,
                        )
                      ],
                    );
            } else {
              return Center(
                  child: Text((state as CartFetchErrorState).errorMessage));
            }
          },
        ),
      ),
    );
  }

  CustomAppBar customMyCart(CartFetchLoadedState state) {
    return CustomAppBar(
      size: size,
      leading: AppBarLeadingIconButtonOne(
        onTap: () => NavigatorService.goBack(),
        child: Icon(
          CupertinoIcons.arrow_left,
          color: Resources.colors.kBlack,
          size: size.width * 0.07,
        ),
      ),
      centerTitle: true,
      title: AutoSizeText(myCart),
      actions: [
        AppBarLeadingIconButtonOne(
            onTap: null, child: AutoSizeText("${state.fetchData.length}")),
      ],
    );
  }
}
