import '../../Export/e_commerce_export.dart';
import '../Widgets/custom_image_view.dart';

class NotFound404Error extends StatefulWidget {
  const NotFound404Error({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;
  @override
  State<NotFound404Error> createState() => _NotFound404ErrorState();
}

class _NotFound404ErrorState extends State<NotFound404Error> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomImageView(
            imagePath: widget.imagePath,
            height: size.height,
          ),
          Positioned(
            bottom: 230,
            left: 30,
            child: AutoSizeText(
              'Dead End',
              presetFontSizes: const [25.0, 20.0, 15.0, 10.0],
              style: kTitleTextStyle.copyWith(
                  color: Colors.white, overflow: TextOverflow.ellipsis),
            ),
          ),
          Positioned(
            bottom: 170,
            left: 30,
            child: AutoSizeText(
              'Oops! The page you are looking for\nis not found',
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
                buttonText: "Home"),
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
