import '../../../../../../Export/e_commerce_export.dart';
import '../../../../../../Models/add_to_favorite_item.dart';

Future<dynamic> customDeleteFavoriteDialog(
    {required BuildContext context,
    required AsyncSnapshot<List<FavorIteItemModelClass>> snapshot,
    required int index,
    required Size size,
    required Function()? onPressedOky}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: SizedBox(
          height: size.height * 0.5,
          width: size.width * 0.5,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8.0),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              Container(
                height: size.height * 0.2,
                width: size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 0.7,
                          color: Resources.colors.kGrey,
                          spreadRadius: 2,
                          blurStyle: BlurStyle.outer)
                    ]),
                child: CustomImageView(
                  imagePath: snapshot.data![index].favoriteImageUrl.toString(),
                  fit: BoxFit.contain,
                ),
              ),
              // ! Name Sections
              AutoSizeText(
                "Name : ${snapshot.data![index].favoriteName.toString()}",
                presetFontSizes: const [20, 15, 10, 7],
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              // ! Price Section
              AutoSizeText(
                "Price : ${snapshot.data![index].favoritePrice.toString()}",
                presetFontSizes: const [20, 13, 9, 5],
                style: GoogleFonts.alice(
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(overflow: TextOverflow.ellipsis),
                    fontWeight: FontWeight.w500),
              ),
              const CustomSizedBox(
                heightRatio: 0.03,
              ),
              // ! Dangerous Delete Section .
              Align(
                alignment: Alignment.topCenter,
                child: AutoSizeText(
                  "😏😏 Are You Sure Delete this Favorite Item.",
                  presetFontSizes: const [15, 10, 8, 5],
                  maxLines: 3,
                  style: GoogleFonts.alice(
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(
                              overflow: TextOverflow.ellipsis,
                              color: Resources.colors.kRedColor),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const CustomSizedBox(
                heightRatio: 0.03,
              ),
              // !  Button Sections
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                      size: size,
                      background: Resources.colors.kGrey,
                      onPressed: () => NavigatorService.goBack(),
                      buttonText: "Cancel".toUpperCase()),
                  CustomButton(
                      size: size,
                      onPressed: onPressedOky!,
                      buttonText: "Oky".toUpperCase()),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
