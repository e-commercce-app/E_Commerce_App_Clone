// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/Components/Widgets/custom_image_view.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/Models/shoes_product_home_page.dart';

class CustomProductShoesDesign extends StatefulWidget {
  CustomProductShoesDesign({super.key, required this.productShoes});
  ProductShoesHomePage productShoes = ProductShoesHomePage();

  @override
  State<CustomProductShoesDesign> createState() =>
      _CustomProductShoesDesignState();
}

class _CustomProductShoesDesignState extends State<CustomProductShoesDesign> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Resources.colors.white,
        boxShadow: const [BoxShadow(blurRadius: 1, spreadRadius: 1)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // ! Product Image .
          Expanded(
            flex: 5,
            child: CustomImageView(
              imagePath: widget.productShoes.productImage.toString(),
              fit: BoxFit.cover,
            ),
          ),
          // ! Product Best Seller .
          _customProductShoesInfoText(
              context: context,
              messageText: "Best Seller".toUpperCase(),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Resources.colors.buttonColor,
                  fontWeight: FontWeight.w300)),
          // ! Product Name .
          _customProductShoesInfoText(
              context: context,
              messageText: widget.productShoes.productName.toString(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  )),
          // ! Product Price .
          _customProductShoesInfoText(
              context: context,
              messageText: widget.productShoes.productPrice.toString(),
              style: GoogleFonts.almendraSc(
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(overflow: TextOverflow.ellipsis),
                  fontSize: 25,
                  fontWeight: FontWeight.w500))
        ],
      ),
    );
  }

  // ! _Custom Product Shoes Info Text
  Padding _customProductShoesInfoText(
      {required BuildContext context,
      required String? messageText,
      required TextStyle? style}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Expanded(
          child: AutoSizeText(
        messageText ?? "Nike Shoes".toLowerCase(),
        style: style ??
            Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Resources.colors.buttonColor,
                fontWeight: FontWeight.w300),
      )),
    );
  }
}
