import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:flutter/cupertino.dart';

class QuantitySection extends StatelessWidget {
  const QuantitySection({
    required this.quantity,
    required this.increment,
    required this.decrement,
    super.key,
  });
  final num quantity;
  final VoidCallback increment;
  final VoidCallback decrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton.small(
          onPressed: increment,
          heroTag: 'float1',
          backgroundColor: Resources.colors.kWhite,
          child: Icon(
            CupertinoIcons.plus_app_fill,
            color: Resources.colors.kButtonColor,
          ),
        ),
        const CustomSizedBox(widthRatio: 0.01),
        AutoSizeText(
          quantity.toString(),
          style: GoogleFonts.aBeeZee(
            textStyle: TextStyle(
              fontSize: 25,
              color: Resources.colors.kBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const CustomSizedBox(widthRatio: 0.01),
        FloatingActionButton.small(
          onPressed: decrement,
          heroTag: 'float2',
          backgroundColor: Colors.white,
          child: Icon(
            CupertinoIcons.minus_rectangle_fill,
            size: 20,
            color: Resources.colors.kButtonColor,
          ),
        ),
      ],
    );
  }
}
