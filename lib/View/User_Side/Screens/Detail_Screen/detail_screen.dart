// ignore_for_file: must_be_immutable, prefer_is_empty
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:readmore/readmore.dart';

import 'package:e_commerce/Models/add_to_favorite_item.dart';
import 'package:e_commerce/Models/my_cart_model_class.dart';

import '../../../../Components/Widgets/AppBar/app_bar_leading_icon_button.dart';
import '../../../../Components/Widgets/AppBar/app_bar_subtitle_one.dart';
import '../../../../Components/Widgets/AppBar/custom_appbar.dart';
import '../../../../Components/Widgets/custom_shoes_page_design.dart';
import '../../../../Export/e_commerce_export.dart';
import '../../../../Models/shoes_product_home_page.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({super.key, required this.productHomeScreen});

  ProductShoesHomePage productHomeScreen = ProductShoesHomePage();
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
    currentPrice = widget.productHomeScreen.productPrice!;
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    turns = Tween<double>(begin: 0.8, end: 1.0).animate(controller);

    controller.forward(); // start Animation .
  }

  // ! Add To Favorite .
  Future<void> addToFavorite() async {
    var dateAndTime = DateTime.now().microsecondsSinceEpoch.toString();
    User? current = FirebaseServices.auth.currentUser;
    favorIteItemModelClass.favoriteID =
        "$dateAndTime${FirebaseServices.currentUser!.uid}";
    favorIteItemModelClass.favoriteImageUrl =
        widget.productHomeScreen.productImage;
    favorIteItemModelClass.favoriteName = widget.productHomeScreen.productName;
    favorIteItemModelClass.favoritePrice =
        widget.productHomeScreen.productPrice;
    FirebaseServices.currentUserCollection
        .doc(current?.uid)
        .collection("addToFavorite")
        .doc("$dateAndTime${FirebaseServices.currentUser!.uid}")
        .set(favorIteItemModelClass.toMap())
        .then((value) {
      CustomDialog.toastMessage(message: "Add To Favorite");
    });
  }

  // screen size
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      // ! App Bar section
      appBar: CustomAppBar(
        size: size,
        leading: AppBarLeadingIconButtonOne(
          child: Icon(
            CupertinoIcons.arrow_left,
            color: Resources.colors.kBlack,
            size: size.width * 0.07,
          ),
          onTap: () => NavigatorService.goBack(),
        ),
        centerTitle: true,
        title: AppbarSubtitleOne(
          text: menShoes,
          margin: const EdgeInsets.only(left: 40),
        ),
        actions: [
          StreamBuilder(
            stream: FirebaseServices.currentUserCollection
                .doc(FirebaseServices.currentUser?.uid)
                .collection("addToFavorite")
                .where("favoritePrice",
                    isEqualTo: widget.productHomeScreen.productPrice)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const Text("");
              }
              return AppBarLeadingIconButtonOne(
                  onTap: () => snapshot.data?.docs.length == 0
                      ? addToFavorite()
                      : "Already added to Favorites",
                  child: snapshot.data?.docs.length == 0
                      ? Icon(
                          Icons.favorite_outline,
                          color: Resources.colors.kButtonColor,
                        )
                      : Icon(
                          Icons.favorite,
                          color: Resources.colors.kButtonColor,
                        ));
            },
          ),
          // Some Space
          const CustomSizedBox(
            widthRatio: 0.04,
          ),
        ],
      ),

      // ! Body Sections
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ! Shoes Image Section .
            RotationTransition(
              turns: turns,
              child: CustomImageView(
                imagePath: widget.productHomeScreen.productImage.toString(),
                fit: BoxFit.fill,
                height: (size.height * 0.3),
                width: double.infinity,
              ),
            ),
            // ! _Custom Shoes Details Widget
            Container(
              height: size.height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Resources.colors.kWhite),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: _customShoesDetailsWidget(context),
              ),
            ),
            const CustomSizedBox(
              heightRatio: 0.04,
            ),

            // ! Text Decrement and Increment Number  .
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.small(
                  onPressed: increment,
                  heroTag: "float1",
                  backgroundColor: Resources.colors.kWhite,
                  child: Icon(
                    CupertinoIcons.plus_app_fill,
                    color: Resources.colors.kButtonColor,
                  ),
                ),
                const CustomSizedBox(
                  widthRatio: 0.01,
                ),
                // Text
                AutoSizeText(
                  quantity.toString(),
                  style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                    fontSize: 25,
                    color: Resources.colors.kBlack,
                    fontWeight: FontWeight.bold,
                  )),
                  overflow: TextOverflow.ellipsis,
                ),
                const CustomSizedBox(widthRatio: 0.01),
                FloatingActionButton.small(
                  onPressed: decrement,
                  heroTag: "float2",
                  backgroundColor: Colors.white,
                  child: Icon(
                    CupertinoIcons.minus_rectangle_fill,
                    size: 20,
                    color: Resources.colors.kButtonColor,
                  ),
                ),
              ],
            ),

            // ! AddToCart Button Section
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: (size.height * 0.07),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Resources.colors.kWhite),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customProductShoesInfoText(
                      context: context,
                      messageText: totalPrice.toUpperCase().toString(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          )),
                  customProductShoesInfoText(
                      context: context,
                      messageText: "\$ ${currentPrice.toString()}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          )),
                ],
              ),
              // ! My Cart Button Section .
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                    size: size,
                    onPressed: () async {
                      // ! (Cart model class) fireStore Set data sections
                      var dateAndTime =
                          DateTime.now().microsecondsSinceEpoch.toString();
                      MyCartModelClass myCart = MyCartModelClass();

                      myCart.productUid =
                          "$dateAndTime${FirebaseServices.currentUser?.uid}";
                      myCart.productImage =
                          widget.productHomeScreen.productImage.toString();
                      myCart.productName =
                          widget.productHomeScreen.productName.toString();
                      myCart.productPrice = currentPrice;
                      myCart.quantity = quantity;
                      await FirebaseServices.currentUserCollection
                          .doc(FirebaseServices.currentUser?.uid)
                          .collection("MyPersonalCart")
                          .doc(
                              "$dateAndTime${FirebaseServices.currentUser?.uid}")
                          .set(myCart.toJson())
                          .then((value) {
                        CustomDialog.toastMessage(message: "Add To Cart");
                      }).onError((error, stackTrace) {
                        log("Add To Cart Error : ${error.toString()}");
                        CustomDialog.toastMessage(message: error.toString());
                      });
                    },
                    buttonText: addToCart),
              )
            ],
          ),
        ),
      ),
    );
  }

  void increment() {
    setState(() {
      quantity++;
      currentPrice = widget.productHomeScreen.productPrice! * quantity;
    });
  }

  void decrement() {
    setState(() {
      if (quantity >= 2 && quantity != 0) {
        quantity--;
        currentPrice = currentPrice - widget.productHomeScreen.productPrice!;
      }
    });
  }

  //  _Custom Shoes Details Widget
  Widget _customShoesDetailsWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // ! Product Best Seller .
        customProductShoesInfoText(
            context: context,
            messageText: bestSeller.toUpperCase(),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Resources.colors.kButtonColor,
                fontSize: 15,
                fontWeight: FontWeight.w500)),
        // ! Product Name .
        customProductShoesInfoText(
            context: context,
            messageText: widget.productHomeScreen.productName.toString(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                )),
        // ! Product Price .
        customProductShoesInfoText(
            context: context,
            messageText: currentPrice.toString(),
            style: GoogleFonts.almendraSc(
                textStyle: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(overflow: TextOverflow.ellipsis),
                fontSize: 30,
                fontWeight: FontWeight.w500)),
        // ! Shoes Detail Sections .
        Expanded(
          child: ReadMoreText(
            shoesDetails,
            trimLines: 3,
            textAlign: TextAlign.justify,
            preDataText: thisShoes,
            preDataTextStyle: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
            style: GoogleFonts.aBeeZee(
                textStyle: TextStyle(
                    fontSize: 10,
                    color: Resources.colors.kBlack,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis)),
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: showMore,
            trimExpandedText: showLess,
          ),
        ),
      ],
    );
  }
}
