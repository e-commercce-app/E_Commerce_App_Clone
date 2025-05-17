import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomFavoriteItemDesign extends StatefulWidget {
  const CustomFavoriteItemDesign({
    required this.imagePath,
    required this.positionStaggeredList,
    required this.productName,
    required this.fullPrice,
    required this.deleteButton,
    super.key,
  });
  final String imagePath;
  final String productName;
  final num fullPrice;
  final int positionStaggeredList;
  final void Function()? deleteButton;
  @override
  State<CustomFavoriteItemDesign> createState() => _CustomCartDesignState();
}

class _CustomCartDesignState extends State<CustomFavoriteItemDesign> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: size.height * 0.2,
        child: AnimationConfiguration.staggeredList(
          position: widget.positionStaggeredList,
          duration: const Duration(milliseconds: 1000),
          child: SlideAnimation(
            curve: Curves.fastLinearToSlowEaseIn,
            verticalOffset: 50,
            child: FadeInAnimation(
              child: Container(
                height: 100,
                width: 200,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 2,
                      blurStyle: BlurStyle.outer,
                      color: Color.fromRGBO(189, 189, 189, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // ! Image Sections
                    Container(
                      height: size.height * 0.09,
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 0.5,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Center(
                        child: CustomImageView(
                          imagePath: widget.imagePath,
                        ),
                      ),
                    ),
                    // some space
                    const CustomSizedBox(
                      widthRatio: 0.04,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ! Product Name Section .
                        Expanded(
                          child: AutoSizeText(
                            widget.productName,
                            presetFontSizes: const [20, 15, 10, 7],
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                        Expanded(
                          child: AutoSizeText(
                            'Price : ${widget.fullPrice}',
                            presetFontSizes: const [20, 13, 9, 5],
                            style: GoogleFonts.alice(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        // Expanded(
                        //   child: AutoSizeText(
                        //     "Quantity : ${widget.quantity.toString()}",
                        //     presetFontSizes: const [20, 13, 9, 5],
                        //     style: GoogleFonts.alice(
                        //         textStyle: Theme.of(context)
                        //             .textTheme
                        //             .bodySmall
                        //             ?.copyWith(
                        //                 overflow: TextOverflow.ellipsis),
                        //         fontWeight: FontWeight.w300),
                        //   ),
                        // )
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: widget.deleteButton ?? () {},
                          child: Icon(
                            CupertinoIcons.delete,
                            color: Resources.colors.kBlack,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
