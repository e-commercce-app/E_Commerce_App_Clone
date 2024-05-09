import 'package:e_commerce/Components/Widgets/custom_profile_container.dart';

import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/Models/user_details.dart';
import 'package:e_commerce/View/User_Side/Screens/Navigation_Bar_Screens/Profile_Page/custom_profile_app_bar.dart';

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
    String name = userDetails.name ??
        FirebaseServices.currentUser!.displayName.toString();
    String email = userDetails.emailAddress ??
        FirebaseServices.currentUser!.email.toString();
    String phone = userDetails.phoneNumber ?? "+92032467...";
    String password = userDetails.password ?? "1234567";
    return Scaffold(
      // ! Custom App Bar Sections .
      appBar: profileCustomAppBar(
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
                AutoSizeText(
                  name.toString(),
                  style: Resources.textStyle
                      .createAccountTextStyle(size: size)
                      .copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
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
                    yourName,
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
                    signInEmailAddress,
                    style: Resources.textStyle.userNameTextStyle(
                      size: size,
                    ),
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
                ),
                // some space
                const CustomSizedBox(heightRatio: 0.03),
                // ! Phone Number sections
                Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    phoneNumber,
                    style: Resources.textStyle.userNameTextStyle(size: size),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const CustomSizedBox(heightRatio: 0.008),
                // Email Address Input Field
                CustomProfileContainer(
                  title: phone.toString(),
                  screenHeight: size.height,
                  screenWidth: size.width,
                ),

                // some space
                const CustomSizedBox(heightRatio: 0.05),
                CustomButton(
                    size: size,
                    onPressed: () {
                      NavigatorService.push(MaterialPageRoute(
                        builder: (context) => UpdateUserInfo(
                          userDetails: UserDetails(
                            emailAddress: email.toString(),
                            name: name.toString(),
                            phoneNumber: phone.toString(),
                            password: password,
                            id: FirebaseServices.currentUser!.uid,
                          ),
                          size: size,
                        ),
                      ));
                    },
                    buttonText: editProfile)
              ],
            )),
      ),
    );
  }
}
