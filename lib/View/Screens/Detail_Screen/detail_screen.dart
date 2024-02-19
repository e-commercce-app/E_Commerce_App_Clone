// ignore_for_file: must_be_immutable
import 'package:readmore/readmore.dart';

import 'package:e_commerce/Components/Localization/app_strings.dart';
import 'package:e_commerce/Components/Widgets/custom_image_view.dart';

import '../../../Components/Widgets/custom_shoes_page_design.dart';
import '../../../Export/e_commerce_export.dart';
import '../../../Models/shoes_product_home_page.dart';
import 'Components/detail_screen_app_bar.dart';

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

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    turns = Tween<double>(begin: 0.8, end: 1.0).animate(controller);

    controller.forward(); // start Animation .
  }

  // screen size
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
        // ! App Bar section
        appBar: homePageAppBar(context, size: size),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // ! Shoes Image Section .
              RotationTransition(
                turns: turns,
                child: CustomImageView(
                  imagePath: widget.productHomeScreen.productImage.toString(),
                  fit: BoxFit.cover,
                  height: (size.height * 0.35),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: _customShoesDetailsWidget(context),
                ),
              ),
              const CustomSizedBox(
                heightRatio: 0.1,
              ),
              // ! AddToCart Button Section
              Container(
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
                            messageText: "Total Price".toUpperCase().toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                )),
                        customProductShoesInfoText(
                            context: context,
                            messageText: "\$8500.00",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                          size: size,
                          onPressed: () {},
                          buttonText: "Add To Cart"),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
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
            messageText: "Best Seller".toUpperCase(),
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
            messageText: widget.productHomeScreen.productPrice.toString(),
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
            preDataText: "This Shoes",
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
            trimCollapsedText: '...Show more',
            trimExpandedText: ' show less',
          ),
        ),
      ],
    );
  }
}
