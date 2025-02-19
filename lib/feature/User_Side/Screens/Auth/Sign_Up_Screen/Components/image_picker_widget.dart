import 'package:flutter/cupertino.dart';

import 'package:e_commerce/Export/e_commerce_export.dart';

class SignUpGalleryImage extends StatelessWidget {
  const SignUpGalleryImage({
    required this.image,
    required this.size,
    this.onTap,
    super.key,
  });
  final Widget? image;
  final GestureTapCallback? onTap;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: size.height * 0.11,
          width: size.width * 0.27,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            color: Colors.amber,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(70),
            child: Center(child: image ?? const Icon(Icons.camera)),
          ),
        ),
        Positioned(
          top: 70,
          left: 65,
          bottom: 0,
          child: InkWell(
            onTap: onTap,
            child: Icon(
              size: 30,
              CupertinoIcons.camera,
              color: Resources.colors.kButtonColor,
            ),
          ),
        ),
      ],
    );
  }
}
