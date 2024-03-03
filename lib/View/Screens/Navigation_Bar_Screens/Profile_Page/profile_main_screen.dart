import 'package:e_commerce/Components/Widgets/custom_profile_container.dart';

import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/Models/user_details.dart';
import 'package:e_commerce/View/Screens/Navigation_Bar_Screens/Profile_Page/custom_profile_app_bar.dart';

import 'Components/camera_and_image_picker_design.dart';
import 'Update_User_Info/update_user_main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Screen Size .
  late Size size;
  UserDetails userDetails = UserDetails();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentUserData();
  }

  Future<void> currentUserData() async {
    await FirebaseServices.currentUserCollection
        .doc(FirebaseServices.currentUser?.uid)
        .get()
        .then((value) {
      userDetails = UserDetails.fromJson(value.data()!);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    String name = userDetails.name ?? "E_Commerence";
    String email = userDetails.emailAddress ?? "xyz@gmail.com";
    String imagePath = userDetails.userImage ?? "xyz";
    return Scaffold(
      // ! Custom App Bar Sections .
      appBar: profileCustomAppBar(
        onTap: () {
          NavigatorService.push(MaterialPageRoute(
            builder: (context) => UpdateUserInfo(
              userDetails: UserDetails(
                emailAddress: email.toString(),
                name: name.toString(),
                id: FirebaseServices.currentUser!.uid,
              ),
              size: size,
            ),
          ));
        },
        size: size,
      ),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
            ),
            child: Column(
              children: [
                // ! Image Sections .
                CustomPickImageView(
                  size: size,
                  imagePath: imagePath,
                ),
                // Some Space
                const CustomSizedBox(
                  heightRatio: 0.02,
                ),
                AutoSizeText(
                  "Jawad Jani",
                  style: Resources.textStyle
                      .createAccountTextStyle(size: size)
                      .copyWith(
                        fontSize: 17,
                        overflow: TextOverflow.ellipsis,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),

                const CustomSizedBox(heightRatio: 0.07),
                // ! User Name sections
                Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    "Your Name",
                    style: Resources.textStyle.userNameTextStyle(size: size),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const CustomSizedBox(heightRatio: 0.008),
                //  ! Email Input Field
                CustomProfileContainer(
                  title: name.toString(),
                  screenHeight: size.height,
                  screenWidth: size.width,
                ),

                // some space
                const CustomSizedBox(heightRatio: 0.03),
                // ! Email sections
                Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    "Email Address",
                    style: Resources.textStyle.userNameTextStyle(size: size),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const CustomSizedBox(heightRatio: 0.008),
                // Email Address Input Field
                CustomProfileContainer(
                  title: email.toString(),
                  screenHeight: size.height,
                  screenWidth: size.width,
                )
              ],
            )),
      ),
    );
  }
}
