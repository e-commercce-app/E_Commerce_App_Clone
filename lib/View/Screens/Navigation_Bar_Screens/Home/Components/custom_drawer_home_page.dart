import 'package:google_sign_in/google_sign_in.dart';

import 'package:e_commerce/Components/Widgets/custom_shoes_page_design.dart';
import 'package:e_commerce/Controller/Services/current_user_delete_account.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Resources.colors.kDrawerBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                const CustomSizedBox(
                  heightRatio: 0.03,
                ),
                //!  Profile
                listTile(
                  icon: Icons.home_outlined,
                  title: "Profile",
                  onTap: () => CustomDialog.toastMessage(message: "Profile"),
                ),
                // ! My Cart
                listTile(
                  icon: Icons.shopping_cart_checkout_outlined,
                  title: "My Cart",
                  onTap: () => CustomDialog.toastMessage(message: "My Cart"),
                ),
                // ! Favorite
                listTile(
                  icon: Icons.favorite_border,
                  title: "Favorite",
                  onTap: () => CustomDialog.toastMessage(message: "Favorite"),
                ),
                // ! Delete Account
                listTile(
                  icon: Icons.delete_sweep_sharp,
                  title: "Delete Account",
                  onTap: () async {
                    await DeleteCurrentUser.deleteCurrentUser();
                    CustomDialog.toastMessage(message: "Delete Account");
                  },
                ),
                // ! Order
                listTile(
                    icon: Icons.electric_bike,
                    title: "Order",
                    onTap: () async {}),
                const CustomSizedBox(
                  heightRatio: 0.03,
                ),
                Divider(
                  color: Resources.colors.kGrey,
                  indent: 1,
                  endIndent: 0.2,
                  thickness: 1,
                ),
                const CustomSizedBox(
                  heightRatio: 0.04,
                ),
                // ! LogOut
                listTile(
                  icon: Icons.login_outlined,
                  title: "LogOut",
                  onTap: () {
                    FirebaseServices.auth.signOut().then((value) {
                      GoogleSignIn().signOut();
                      CustomDialog.toastMessage(message: "LogOut");
                      if (!mounted) {
                        Navigator.pushReplacementNamed(
                            context, RoutesName.signInScreen);
                      }
                    });
                  },
                ),
              ],
            ),
          ),
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
      leading: ShimmerEffect(
        baseColor: Resources.colors.kWhite,
        highlightColor: Resources.colors.kButtonColor,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: AutoSizeText(title,
          presetFontSizes: const [18.0, 14.0, 10.0, 5.0],
          style: Resources.textStyle.drawerTextStyle()),
    ),
  );
}
