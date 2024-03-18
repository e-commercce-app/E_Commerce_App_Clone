import '../../../../../../Export/e_commerce_export.dart';

class CustomPickImageView extends StatelessWidget {
  const CustomPickImageView({
    super.key,
    required this.size,
    required this.imagePath,
  });

  final Size size;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: size.height * 0.15,
        width: size.width * 0.4,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                backgroundColor: Resources.colors.kGrey,
                maxRadius: 50,
                child: Image(image: NetworkImage(imagePath)),
              ),
            ),
            Positioned(
              bottom: 0,
              child: CircleAvatar(
                backgroundColor: Resources.colors.kButtonColor,
                maxRadius: 20,
                child: const Icon(
                  Icons.camera,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
