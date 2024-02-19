import 'package:e_commerce/Components/Widgets/custom_shoes_page_design.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Resources.colors.kDrawerBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // ! Drawer Image  Section
            Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Resources.colors.kWhite,
              ),
              child: Image(image: AssetImage(Resources.imagePath.sneaker2)),
            ),
            customProductShoesInfoText(
                context: context,
                messageText: "Hey 👐",
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white)),
            // !  Current User Name
            customProductShoesInfoText(
                context: context,
                messageText: "Nike Shoes",
                style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            //
            listTile(icon: Icons.home_outlined, title: "Home Screen")
          ],
        ),
      ),
    );
  }
}

Widget listTile(
    {String? text,
    required IconData? icon,
    GestureTapCallback? onTap,
    required String title}) {
  return InkWell(
    onTap: onTap,
    child: ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w300, color: Colors.white),
      ),
    ),
  );
}
