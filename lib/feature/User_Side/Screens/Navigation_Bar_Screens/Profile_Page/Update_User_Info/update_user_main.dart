import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/Models/user_details.dart';
import 'package:e_commerce/core/Components/Helper/notification_server.dart';
import 'package:e_commerce/feature/User_Side/Screens/Navigation_Bar_Screens/Profile_Page/Update_User_Info/Components/custom_update_app_bar.dart';

class UpdateUserInfo extends StatefulWidget {
  const UpdateUserInfo({
    required this.userDetails,
    required this.size,
    super.key,
  });
  final UserDetails userDetails;
  final Size size;
  @override
  State<UpdateUserInfo> createState() => _UpdateUserInfoState();
}

class _UpdateUserInfoState extends State<UpdateUserInfo> {
  // TextEditingController
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // ! Notification Server
  final _notificationServer = NotificationServer();

  Future<void> updateUserInfo() async {
    final userColl = FirebaseServices.currentUserCollection;
    final userDoc = userColl.doc(FirebaseServices.currentUser!.uid);

    final updateData = UserDetails(
      id: FirebaseServices.currentUser!.uid,
      emailAddress: emailController.text,
      name: nameController.text,
      phoneNumber: phoneNoController.text,
      password: passwordController.text,
      createdOn: DateTime.now().toString(),
      role: 'isUser',
      token: _notificationServer.getEndUserToken().toString(),
    );

    await userDoc.update(updateData.toJson());
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    nameController.text = widget.userDetails.name.toString();
    emailController.text = widget.userDetails.emailAddress.toString();
    phoneNoController.text = widget.userDetails.phoneNumber.toString();
    passwordController.text = widget.userDetails.password.toString();
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
                  yourName,
                  style:
                      Resources.textStyle.userNameTextStyle(size: widget.size),
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
                  signInEmailAddress,
                  style:
                      Resources.textStyle.userNameTextStyle(size: widget.size),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const CustomSizedBox(heightRatio: 0.008),
              CustomTextFormField(
                controller: emailController,
                readOnly: true,
                textInputType: TextInputType.emailAddress,
                // initialValue: widget.userDetails.emailAddress.toString(),
              ),

              // some space
              const CustomSizedBox(heightRatio: 0.05),
              // ! Phone Number sections
              Align(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  phoneNumber,
                  style:
                      Resources.textStyle.userNameTextStyle(size: widget.size),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const CustomSizedBox(heightRatio: 0.008),
              CustomTextFormField(
                controller: phoneNoController,
                textInputType: TextInputType.phone,
                // initialValue: widget.userDetails.emailAddress.toString(),
              ),
              // some space
              const CustomSizedBox(heightRatio: 0.05),
              // ! Buttons Sections .

              CustomButton(
                size: widget.size,
                buttonText: update.toUpperCase(),
                onPressed: () async {
                  await updateUserInfo().then((value) {
                    nameController.clear();
                    emailController.clear();
                    phoneNoController.clear();
                    NavigatorService.pushNamedAndRemoveUntil(
                      RoutesName.bottomBarScreen,
                    );
                    CustomDialog.showCustomSnackBar(
                      context: context,
                      title: 'Edit',
                      message: 'Successfully current user Update this data.',
                      contentType: ContentType.success,
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNoController.dispose();
    super.dispose();
  }
}
