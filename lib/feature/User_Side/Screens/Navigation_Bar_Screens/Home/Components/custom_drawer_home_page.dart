import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/core/Controller/Services/Controller/current_user_delete_account.dart';
import 'package:e_commerce/feature/User_Side/Screens/Navigation_Bar_Screens/bloc/bottom_navigation_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ! Drawer Image  Section
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Resources.colors.kWhite,
                  ),
                  child: Image(image: AssetImage(Resources.imagePath.sneaker2)),
                ),
                customProductShoesInfoText(
                  context: context,
                  messageText: 'Hey 👐',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                // !  Current User Name
                customProductShoesInfoText(
                  context: context,
                  messageText: 'Nike Shoes',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const CustomSizedBox(
                  heightRatio: 0.03,
                ),
                //!  Profile
                listTile(
                  icon: Icons.home_outlined,
                  title: 'Profile',
                  onTap: () {
                    context.read<BottomNavigationBloc>().add(
                          BottomNavigationEvent(currentIndex: 4),
                        );
                  },
                ),
                // ! My Cart
                listTile(
                  icon: Icons.shopping_cart_checkout_outlined,
                  title: 'My Cart',
                  onTap: () {
                    NavigatorService.pushNamed(RoutesName.addToCartScreen);
                  },
                ),
                // ! Favorite
                listTile(
                  icon: Icons.favorite_border,
                  title: 'Favorite',
                  onTap: () {
                    //   NavigatorService.push(
                    //   MaterialPageRoute(
                    //     builder: (context) => const FavoriteScreen(),
                    //   ),
                    // );

                    context.read<BottomNavigationBloc>().add(
                          BottomNavigationEvent(currentIndex: 1),
                        );
                  },
                ),
                // ! Delete Account
                listTile(
                  icon: Icons.delete_sweep_sharp,
                  title: 'Delete Account',
                  onTap: () async {
                    await DeleteCurrentUser.deleteCurrentUser();
                    if (context.mounted) {
                      CustomDialog.showCustomSnackBar(
                        context: context,
                        title: 'Delete Account',
                        message: 'Delete this account and delete all info ',
                        contentType: ContentType.success,
                      );
                    }
                  },
                ),
                // ! Order
                listTile(
                  icon: Icons.electric_bike,
                  title: 'Order',
                  onTap: () async {
                    await NavigatorService.pushNamed(RoutesName.orderNowScreen);
                  },
                ),
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
                  title: 'LogOut',
                  onTap: () {
                    FirebaseServices.auth.signOut().then((value) {
                      GoogleSignIn().signOut();
                      CustomDialog.showCustomSnackBar(
                        context: context,
                        title: 'LogOut',
                        message: 'Successfully Current User Logout',
                        contentType: ContentType.success,
                      );
                      if (context.mounted) {
                        Navigator.pushReplacementNamed(
                          context,
                          RoutesName.signInScreen,
                        );
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

Widget listTile({
  required IconData? icon,
  required String title,
  GestureTapCallback? onTap,
  String? text,
}) {
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
      title: AutoSizeText(
        title,
        presetFontSizes: const [18.0, 14.0, 10.0, 5.0],
        style: Resources.textStyle.drawerTextStyle(),
      ),
    ),
  );
}
