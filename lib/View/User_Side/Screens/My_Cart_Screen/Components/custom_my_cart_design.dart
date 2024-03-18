import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../../Components/Widgets/custom_image_view.dart';
import '../../../../../Export/e_commerce_export.dart';

class CustomCartDesign extends StatefulWidget {
  const CustomCartDesign({
    super.key,
    required this.imagePath,
    required this.positionStaggeredList,
    required this.productName,
    required this.productPrice,
    required this.quantity,
  });
  final String imagePath;
  final String productName;
  final num productPrice;
  final int quantity;
  final int positionStaggeredList;
  @override
  State<CustomCartDesign> createState() => _CustomCartDesignState();
}

class _CustomCartDesignState extends State<CustomCartDesign> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: size.height * 0.2,
          child: AnimationConfiguration.staggeredList(
            position: widget.positionStaggeredList,
            duration: const Duration(milliseconds: 1000),
            child: SlideAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              verticalOffset: 50.0,
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
                            color: Color.fromRGBO(189, 189, 189, 1))
                      ]),
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
                                  blurRadius: 2),
                            ]),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ! Product Name Section .
                          Expanded(
                            child: AutoSizeText(
                              widget.productName.toString(),
                              presetFontSizes: const [20, 15, 10, 7],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: AutoSizeText(
                              widget.productPrice.toString(),
                              presetFontSizes: const [23, 13, 9, 5],
                              style: GoogleFonts.almendraSc(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          overflow: TextOverflow.ellipsis),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Expanded(
                            child: AutoSizeText(
                              widget.quantity.toString(),
                              presetFontSizes: const [23, 13, 9, 5],
                              style: GoogleFonts.almendraSc(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          overflow: TextOverflow.ellipsis),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          // increment and decrement Sections
                          Expanded(
                            child: Row(
                              children: [
                                IconButton(
                                    color: Colors.blue,
                                    alignment: Alignment.center,
                                    onPressed: () {},
                                    highlightColor: Colors.blue,
                                    icon: const Center(
                                      child: Icon(
                                        Icons.minimize_outlined,
                                        color: Colors.black,
                                      ),
                                    )),
                                AutoSizeText(
                                  "1",
                                  presetFontSizes: const [20, 15, 10, 7],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                IconButton(
                                    color: Colors.blue,
                                    alignment: Alignment.center,
                                    onPressed: () {},
                                    highlightColor: Colors.blue,
                                    icon: const Center(
                                      child: Icon(
                                        Icons.minimize_outlined,
                                        color: Colors.black,
                                      ),
                                    )),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
