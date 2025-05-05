// ignore_for_file: must_be_immutable

import 'package:e_commerce/Export/e_commerce_export.dart';

class CustomProductShoesDesign extends StatefulWidget {
  const CustomProductShoesDesign({
    required this.heroTag,
    required this.onTap,
    required this.productImage,
    required this.productName,
    required this.fullPrice,
    this.salePrice,
    this.isSale,
    super.key,
  });
  final String? productImage;
  final String? productName;
  final num? fullPrice;
  final String? salePrice;
  final bool? isSale;
  final String heroTag;
  final VoidCallback onTap;
  @override
  State<CustomProductShoesDesign> createState() =>
      _CustomProductShoesDesignState();
}

class _CustomProductShoesDesignState extends State<CustomProductShoesDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: widget.onTap,
      splashColor: Colors.grey,
      child: Card(
        color: Resources.colors.kGrey,
        elevation: 8,
        child: Container(
          // height: 100,
          // width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Resources.colors.kWhite,
            boxShadow: [
              BoxShadow(
                blurRadius: 0.7,
                spreadRadius: 0.1,
                color: Resources.colors.kGrey,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ! Product Image .
              Expanded(
                flex: 5,
                child: Hero(
                  tag: widget.heroTag,
                  child: CustomImageView(
                    imagePath: widget.productImage.toString(),
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ),
              ),
              // ! Product Best Seller .
              customProductShoesInfoText(
                context: context,
                messageText: 'Best Seller'.toUpperCase(),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Resources.colors.kButtonColor,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              // ! Product Name .
              customProductShoesInfoText(
                context: context,
                messageText: widget.productName.toString(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
              ),
              // ! Product Price .
              Row(
                children: [
                  customProductShoesInfoText(
                    context: context,
                    // ignore: use_if_null_to_convert_nulls_to_bools
                    messageText:
                        (widget.isSale == true && widget.salePrice != '')
                            ? widget.salePrice
                            : widget.fullPrice.toString(),
                    style: GoogleFonts.almendraSc(
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(overflow: TextOverflow.ellipsis),
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (widget.isSale == true && widget.salePrice != '')
                    Text(
                      ' PKR: ${widget.fullPrice} ',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.red,
                      ),
                    ),
                ],
              ),

              //  widget.productModel.isSale == true &&
              //                       widget.productModel.salePrice != ''
              //                   ? Text(
              //                       "PKR: " + widget.productModel.salePrice,
              //                     )
              //                   : Text(
              //                       "PKR: " + widget.productModel.fullPrice,
              //                     ),
            ],
          ),
        ),
      ),
    );
  }
}

// ! _Custom Product Shoes Info Text
Widget customProductShoesInfoText({
  required BuildContext context,
  required String? messageText,
  required TextStyle? style,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: AutoSizeText(
      messageText ?? 'Nike Shoes'.toLowerCase(),
      style: style ??
          Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Resources.colors.kButtonColor,
                fontWeight: FontWeight.w300,
              ),
    ),
  );
}
