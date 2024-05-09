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
                yourWishList.toUpperCase(),
                presetFontSizes: const [18, 15, 10, 5],
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              AutoSizeText(
                exploreMoreShortLost,
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
                  buttonText: shopNow,
                  onPressed: () {
                    NavigatorService.pushNamedAndRemoveUntil(
                        RoutesName.bottomBarScreen);
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
      text: itemNotFound,
      margin: const EdgeInsets.only(left: 40),
    ),
  );
}
