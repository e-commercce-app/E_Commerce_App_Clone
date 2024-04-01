import '../../Export/e_commerce_export.dart';
import '../Widgets/AppBar/app_bar_subtitle_one.dart';
import '../Widgets/AppBar/custom_appbar.dart';

class WishListNotFound extends StatefulWidget {
  const WishListNotFound({super.key});

  @override
  State<WishListNotFound> createState() => _WishListNotFoundState();
}

class _WishListNotFoundState extends State<WishListNotFound> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Resources.colors.kWhite,
      appBar: wishListAppBar(context, size: size),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LottieBuilder.asset(
                Resources.imagePath.favoriteEmpty,
                height: size.height * 0.4,
                width: size.width * 0.8,
                fit: BoxFit.cover,
                renderCache: RenderCache.drawingCommands,
              ),
              const CustomSizedBox(
                heightRatio: 0.003,
              ),
              AutoSizeText(
                "Your wishList is empty!".toUpperCase(),
                presetFontSizes: const [18, 15, 10, 5],
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              AutoSizeText(
                "Explore more and shortlist some items",
                presetFontSizes: const [15, 10, 5],
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400, color: Resources.colors.kGrey),
              ),
              const CustomSizedBox(
                heightRatio: 0.06,
              ),
              SizedBox(
                width: size.width * 0.5,
                child: CustomButton(
                  size: size,
                  buttonText: "Shop Now",
                  onPressed: () {
                    NavigatorService.pushNamed(RoutesName.bottomBarScreen);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget wishListAppBar(BuildContext context,
    {Function()? onTap, Size? size}) {
  return CustomAppBar(
    size: size!,
    centerTitle: true,
    title: AppbarSubtitleOne(
      text: "Item Not Found",
      margin: const EdgeInsets.only(left: 40),
    ),
  );
}
