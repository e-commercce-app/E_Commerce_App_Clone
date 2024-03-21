import 'package:e_commerce/Controller/Services/Controller/cart_product_price.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce/View/User_Side/Screens/My_Cart_Screen/Components/custom_my_cart_design.dart';
import 'package:e_commerce/View/User_Side/Screens/My_Cart_Screen/bloc/cart_fetch_data_bloc.dart';

import '../../../../Components/Error/cart_no_item_page.dart';
import '../../../../Components/Widgets/AppBar/app_bar_leading_icon_button.dart';
import '../../../../Components/Widgets/AppBar/custom_appbar.dart';
import '../../../../Controller/Services/Controller/get_my_cart_data.dart';
import '../../../../Export/e_commerce_export.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({
    super.key,
  });
  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  late Size size;

  MyCartFetchDataMethod fetchData = MyCartFetchDataMethod();
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
                                // Expanded(
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       AutoSizeText(
                                //         "Subtotal",
                                //         style: Theme.of(context)
                                //             .textTheme
                                //             .titleMedium!
                                //             .copyWith(
                                //               color: Resources.colors.kGray600,
                                //             ),
                                //       ),
                                //       AutoSizeText(
                                //         "\$1250.00",
                                //         style: Theme.of(context)
                                //             .textTheme
                                //             .titleLarge
                                //             ?.copyWith(
                                //                 color: Resources
                                //                     .colors.kPrimaryContainer),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // Expanded(
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       AutoSizeText("Shopping",
                                //           style: Theme.of(context)
                                //               .textTheme
                                //               .titleMedium!
                                //               .copyWith(
                                //                 color:
                                //                     Resources.colors.kGray600,
                                //               )),
                                //       AutoSizeText(
                                //         "\$40.90",
                                //         style: Theme.of(context)
                                //             .textTheme
                                //             .titleLarge
                                //             ?.copyWith(
                                //                 color: Resources
                                //                     .colors.kPrimaryContainer),
                                //       ),
                                //     ],
                                //   ),
                                // ),

                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AutoSizeText(
                                        "Total Cost",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              color: Resources.colors.kGray600,
                                            ),
                                      ),
                                      AutoSizeText(
                                        "Total ${managePrice.totalPrice.toStringAsFixed(1)}",
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
                                          onPressed: () {},
                                          buttonText: "checkout".toUpperCase()),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const CustomSizedBox(
                          heightRatio: 0.07,
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
      title: const AutoSizeText("My Cart"),
      actions: [
        AppBarLeadingIconButtonOne(
            onTap: () {
              NavigatorService.pushNamed(RoutesName.addToCartScreen);
            },
            child: AutoSizeText("${state.fetchData.length}")),
      ],
    );
  }
}

  // My Cart Custom AppBar Section
//   CustomAppBar myCartAppCart(
//       {AsyncSnapshot<List<MyCartModelClass>>? snapshot}) {
//     return CustomAppBar(
//       size: size,
//       leading: AppBarLeadingIconButtonOne(
//         onTap: () => NavigatorService.goBack(),
//         child: Icon(
//           CupertinoIcons.arrow_left,
//           color: Resources.colors.kBlack,
//           size: size.width * 0.07,
//         ),
//       ),
//       centerTitle: true,
//       title: const AutoSizeText("My Cart"),
//       actions: [
//         AppBarLeadingIconButtonOne(
//             onTap: () {
//               // ! LogOut Button
//               // FirebaseServices.auth.signOut().then((value) {
//               //   Navigator.pushReplacementNamed(context, RoutesName.signInScreen);
//               // Navigator.pop(context);
//               // });
//               NavigatorService.pushNamed(RoutesName.addToCartScreen);
//             },
//             child: AutoSizeText("${snapshot?.data?.length}")),
//       ],
//     );
//   }
// }