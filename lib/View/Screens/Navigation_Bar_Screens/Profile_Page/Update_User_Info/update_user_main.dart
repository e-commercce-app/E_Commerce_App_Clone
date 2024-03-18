import 'package:e_commerce/Components/Widgets/custom_form_field.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/Models/user_details.dart';
import 'package:e_commerce/View/Screens/Navigation_Bar_Screens/Profile_Page/profile_main_screen.dart';
import 'Components/custom_update_app_bar.dart';

class UpdateUserInfo extends StatefulWidget {
  const UpdateUserInfo(
      {super.key, required this.userDetails, required this.size});
  final UserDetails userDetails;
  final Size size;
  @override
  State<UpdateUserInfo> createState() => _UpdateUserInfoState();
}

class _UpdateUserInfoState extends State<UpdateUserInfo> {
  // TextEditingController
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> updateUserInfo() async {
    var userColl = FirebaseServices.currentUserCollection;
    var userDoc = userColl.doc(FirebaseServices.currentUser!.uid);

    var updateData = UserDetails(
        id: FirebaseServices.currentUser!.uid,
        emailAddress: emailController.text.toString(),
        name: nameController.text.toString(),
        userImage:
            "https://firebasestorage.googleapis.com/v0/b/flutter-e-commerce-14c75.appspot.com/o/NikeShoes%2Fnike11.png?alt=media&token=bd143004-213f-439c-bfa3-3be73f769193");

    userDoc.update(updateData.toJson());
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    nameController.text = widget.userDetails.name.toString();
    emailController.text = widget.userDetails.emailAddress.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // ! Custom App Bar Sections .
      appBar: CustomUpdateAppBar(widget: widget),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: widget.size.width * 0.04,
            ),
            child: Column(
              children: [
                // Some Space
                const CustomSizedBox(
                  heightRatio: 0.07,
                ),

                const CustomSizedBox(heightRatio: 0.07),
                // ! User Name sections
                Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    "Your Name",
                    style: Resources.textStyle
                        .userNameTextStyle(size: widget.size),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const CustomSizedBox(heightRatio: 0.008),
                //  ! User Name Input Field .
                CustomTextFormField(
                  controller: nameController,
                  // initialValue: widget.userDetails.name.toString(),
                ),

                // some space
                const CustomSizedBox(heightRatio: 0.05),
                // ! Email sections
                Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    "Email Address",
                    style: Resources.textStyle
                        .userNameTextStyle(size: widget.size),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const CustomSizedBox(heightRatio: 0.008),
                CustomTextFormField(
                  controller: emailController,
                  // initialValue: widget.userDetails.emailAddress.toString(),
                ),
                // ! Buttons Sections .

                CustomButton(
                  size: widget.size,
                  buttonText: "Update".toUpperCase(),
                  onPressed: () async {
                    await updateUserInfo().then((value) {
                      nameController.clear();
                      emailController.clear();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ));
                      CustomDialog.toastMessage(message: "Update User");
                    });
                  },
                )
              ],
            )),
      ),
    );
  }
}
