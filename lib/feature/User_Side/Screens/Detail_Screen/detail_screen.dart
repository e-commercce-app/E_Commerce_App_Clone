// ignore_for_file: must_be_immutable, prefer_is_empty

import 'dart:developer';

import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/Models/add_to_favorite_item.dart';
import 'package:e_commerce/Models/my_cart_model_class.dart';
import 'package:e_commerce/Models/shoes_product_home_page.dart';
import 'package:e_commerce/feature/User_Side/Screens/Detail_Screen/widget/custom_shoes_details_widget.dart';
import 'package:e_commerce/feature/User_Side/Screens/Detail_Screen/widget/quantity_section.dart';
import 'package:flutter/cupertino.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({required this.productHomeScreen, super.key});

  ProductShoesHomePageModel productHomeScreen = ProductShoesHomePageModel();
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  // Animation Objects .
  late Animation<double> turns;
  late AnimationController controller;

  var quantity = 1;
  num currentPrice = 0.0;

  //! Favorite Model Class
  FavorIteItemModelClass favorIteItemModelClass = FavorIteItemModelClass();

  @override
  void initState() {
    super.initState();
    initializeAnimation();
    currentPrice = (widget.productHomeScreen.isSale == true &&
            widget.productHomeScreen.salePrice!.isNotEmpty)
        ? num.parse(widget.productHomeScreen.salePrice!.toString())
        : num.parse(widget.productHomeScreen.fullPrice?.toString() ?? '0');
  }

  //! Initialize animation controller
  void initializeAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    turns = Tween<double>(begin: 0.8, end: 1).animate(controller);
    controller.forward(); // start Animation .
  }

  //! Add to favorite
  Future<void> addToFavorite() async {
    final dateAndTime = DateTime.now().microsecondsSinceEpoch.toString();
    final current = FirebaseServices.auth.currentUser;
    favorIteItemModelClass
      ..favoriteID = '$dateAndTime${FirebaseServices.currentUser!.uid}'
      ..favoriteImageUrl = widget.productHomeScreen.productImage
      ..favoriteName = widget.productHomeScreen.productName
      ..favoritePrice = widget.productHomeScreen.fullPrice;
    await FirebaseServices.currentUserCollection
        .doc(current?.uid)
        .collection('addToFavorite')
        .doc('$dateAndTime${FirebaseServices.currentUser!.uid}')
        .set(favorIteItemModelClass.toMap())
        .then((value) {
      CustomDialog.showCustomSnackBar(
        context: context,
        title: 'Favorite',
        message: 'Your Product added to Favorite',
        contentType: ContentType.success,
      );
    });
  }

  //! Increment quantity
  void increment() {
    setState(() {
      quantity++;
      currentPrice = widget.productHomeScreen.fullPrice! * quantity;
    });
  }

  //! Decrement quantity
  void decrement() {
    setState(() {
      if (quantity >= 2 && quantity != 0) {
        quantity--;
        currentPrice = currentPrice - widget.productHomeScreen.fullPrice!;
      }
    });
  }

  //! Add to cart
  Future<void> itemAddToCart() async {
    final dateAndTime = DateTime.now().microsecondsSinceEpoch.toString();
    final myCart = MyCartModelClass()
      ..productUid = '$dateAndTime${FirebaseServices.currentUser?.uid}'
      ..productImage = widget.productHomeScreen.productImage.toString()
      ..productName = widget.productHomeScreen.productName.toString()
      ..fullPrice = currentPrice
      ..quantity = quantity;
    await FirebaseServices.currentUserCollection
        .doc(FirebaseServices.currentUser?.uid)
        .collection('MyPersonalCart')
        .doc('$dateAndTime${FirebaseServices.currentUser?.uid}')
        .set(myCart.toJson())
        .then((value) {
      CustomDialog.showCustomSnackBar(
        context: context,
        title: 'My Cart',
        message: 'Your item is added successfully',
        contentType: ContentType.success,
      );
    }).onError((error, stackTrace) {
      log('Add To Cart Error : $error');
      CustomDialog.showCustomSnackBar(
        context: context,
        title: 'Error',
        message: error.toString(),
        contentType: ContentType.failure,
      );
    });
  }

  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      bottomNavigationBar: buildBottomAppBar(),
    );
  }

  //! Build app bar
  PreferredSizeWidget buildAppBar() {
    return CustomAppBar(
      size: size,
      leading: AppBarLeadingIconButtonOne(
        onTap: NavigatorService.goBack,
        child: Icon(
          CupertinoIcons.arrow_left,
          color: Resources.colors.kBlack,
          size: size.width * 0.07,
        ),
      ),
      centerTitle: true,
      title: AppBarSubtitleOne(
        text: menShoes,
        margin: const EdgeInsets.only(left: 40),
      ),
      actions: [
        StreamBuilder(
          stream: FirebaseServices.currentUserCollection
              .doc(FirebaseServices.currentUser?.uid)
              .collection('addToFavorite')
              .where(
                'favoritePrice',
                isEqualTo: widget.productHomeScreen.fullPrice,
              )
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Text('');
            }
            return AppBarLeadingIconButtonOne(
              onTap: () => snapshot.data?.docs.length == 0
                  ? addToFavorite()
                  : 'Already added to Favorites',
              child: snapshot.data?.docs.length == 0
                  ? Icon(
                      Icons.favorite_outline,
                      color: Resources.colors.kButtonColor,
                    )
                  : Icon(
                      Icons.favorite,
                      color: Resources.colors.kButtonColor,
                    ),
            );
          },
        ),
        const CustomSizedBox(widthRatio: 0.04),
      ],
    );
  }

  //! Build body
  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildImageSection(),
          buildDetailsSection(),
          QuantitySection(
            quantity: quantity,
            increment: increment,
            decrement: decrement,
          ),
        ],
      ),
    );
  }

  //! Build image section
  Widget buildImageSection() {
    return RotationTransition(
      turns: turns,
      child: CustomImageView(
        imagePath: widget.productHomeScreen.productImage.toString(),
        fit: BoxFit.fill,
        height: size.height * 0.3,
        width: double.infinity,
      ),
    );
  }

  //! Build details section
  Widget buildDetailsSection() {
    return Container(
      height: size.height * 0.3,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Resources.colors.kWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: CustomShoesDetailsWidget(
          productHomeScreen: widget.productHomeScreen,
          currentPrice: currentPrice,
        ),
      ),
    );
  }

  //! Build bottom app bar
  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      child: Container(
        height: size.height * 0.07,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Resources.colors.kWhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildPriceInfo(),
            buildAddToCartButton(),
          ],
        ),
      ),
    );
  }

  //! Build price info
  Widget buildPriceInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customProductShoesInfoText(
          context: context,
          messageText: totalPrice.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
        ),
        customProductShoesInfoText(
          context: context,
          messageText: '\$ $currentPrice',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
        ),
      ],
    );
  }

  //! Build add to cart button
  Widget buildAddToCartButton() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: CustomButton(
        size: size,
        onPressed: itemAddToCart,
        buttonText: addToCart,
      ),
    );
  }
}
