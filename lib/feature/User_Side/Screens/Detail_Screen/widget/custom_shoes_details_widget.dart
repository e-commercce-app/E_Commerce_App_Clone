import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/Models/shoes_product_home_page.dart';
import 'package:readmore/readmore.dart';

class CustomShoesDetailsWidget extends StatelessWidget {
  const CustomShoesDetailsWidget({
    required this.productHomeScreen,
    required this.currentPrice,
    super.key,
  });
  final ProductShoesHomePage productHomeScreen;
  final num currentPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customProductShoesInfoText(
          context: context,
          messageText: bestSeller.toUpperCase(),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Resources.colors.kButtonColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
        ),
        customProductShoesInfoText(
          context: context,
          messageText: productHomeScreen.productName.toString(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
        ),
        customProductShoesInfoText(
          context: context,
          messageText: currentPrice.toString(),
          style: GoogleFonts.almendraSc(
            textStyle: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(overflow: TextOverflow.ellipsis),
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
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
                overflow: TextOverflow.ellipsis,
              ),
            ),
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
