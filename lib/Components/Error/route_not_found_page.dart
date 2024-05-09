import '../../Export/e_commerce_export.dart';

class NotFound404Error extends StatelessWidget {
  const NotFound404Error({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomImageView(
            imagePath: imagePath,
            height: size.height,
          ),
          Positioned(
            bottom: 230,
            left: 30,
            child: AutoSizeText(
              deadEnd,
              presetFontSizes: const [25.0, 20.0, 15.0, 10.0],
              style: kTitleTextStyle.copyWith(
                  color: Colors.white, overflow: TextOverflow.ellipsis),
            ),
          ),
          Positioned(
            bottom: 170,
            left: 30,
            child: AutoSizeText(
              oopsThePageNotFound,
              presetFontSizes: const [18.0, 12.0, 9.0, 5.0],
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Resources.colors.kGray600,
                  overflow: TextOverflow.ellipsis),
              textAlign: TextAlign.start,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 30,
            right: 250,
            child: CustomButton(
                size: size,
                onPressed: () {
                  NavigatorService.pushNamed(RoutesName.bottomBarScreen);
                },
                buttonText: home),
          ),
        ],
      ),
    );
  }
}

const kTitleTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 25,
  letterSpacing: 1,
  fontWeight: FontWeight.w500,
);
