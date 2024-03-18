import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/View/User_Side/Screens/Navigation_Bar_Screens/Cart/bloc/cart_bottom_bloc.dart';

import '../../../../../Components/Error/cart_no_item_page.dart';
import '../../../../../Components/Widgets/AppBar/app_bar_leading_icon_button.dart';
import '../../../../../Components/Widgets/AppBar/custom_appbar.dart';
import '../../My_Cart_Screen/Components/custom_my_cart_design.dart';

class CartBottomBarScreen extends StatefulWidget {
  const CartBottomBarScreen({super.key});

  @override
  State<CartBottomBarScreen> createState() => _CartBottomBarScreenState();
}

class _CartBottomBarScreenState extends State<CartBottomBarScreen> {
  late Size size;
  @override
  void initState() {
    super.initState();
    context.read<CartBottomBloc>().add(FetchBottomCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: BlocBuilder<CartBottomBloc, CartBottomState>(
        bloc: context.read<CartBottomBloc>(),
        builder: (context, state) {
          if (state is CartBottomInitial || state is LoadingBottomCartState) {
            return Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Resources.colors.kButtonColor,
              ),
            );
          } else if (state is LoadedBottomCartState) {
            return state.cartData.isEmpty
                ? const CartNoItemFound()
                : Column(children: [
                    // ! My Cart Custom App Bar
                    customBottomCartAppBar(state),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.cartData.length,
                        itemBuilder: (context, index) {
                          return CustomCartDesign(
                            imagePath:
                                state.cartData[index].productImage.toString(),
                            positionStaggeredList: state.cartData.length,
                            productName:
                                state.cartData[index].productName.toString(),
                            productPrice:
                                state.cartData[index].productPrice ?? 0,
                            quantity: state.cartData[index].quantity ?? 0,
                          );
                        },
                      ),
                    )
                  ]);
          } else if (state is ErrorBottomCartState) {
            return Center(child: Text(state.errorMsg.toString()));
          } else {
            return const Center(child: Text("No Data "));
          }
        },
      ),
    );
  }

  CustomAppBar customBottomCartAppBar(LoadedBottomCartState state) {
    return CustomAppBar(
      size: size,
      centerTitle: true,
      title: const AutoSizeText("My Cart"),
      actions: [
        AppBarLeadingIconButtonOne(
            onTap: () {
              NavigatorService.pushNamed(RoutesName.addToCartScreen);
            },
            child: AutoSizeText("${state.cartData.length}")),
      ],
    );
  }
}
