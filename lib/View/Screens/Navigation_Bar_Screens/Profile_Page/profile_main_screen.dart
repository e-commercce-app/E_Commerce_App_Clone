import 'package:e_commerce/Components/Widgets/AppBar/app_bar_subtitle_one.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/View/Screens/Navigation_Bar_Screens/Profile_Page/bloc/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Components/Widgets/AppBar/app_bar_leading_icon_button.dart';
import '../../../../Components/Widgets/AppBar/custom_appbar.dart';
import '../../../../Components/Widgets/custom_form_field.dart';
import 'Components/camera_and_image_picker_design.dart';
import 'Update_User_Info/update_user_main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);

    return Scaffold(
      // ! Custom App Bar Sections .
      appBar: profileCustomAppBar(),
      body: BlocProvider(
        create: (context) => ProfileBloc(),
        child: SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
            ),
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                state as UserClickProfileInfoState;
                return Column(
                  children: [
                    CustomPickImageView(size: size),

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
                        style:
                            Resources.textStyle.userNameTextStyle(size: size),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    const CustomSizedBox(heightRatio: 0.008),
                    //  User Name Input Field
                    CustomTextFormField(
                      controller: (state).nameController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                      hintText: "Jawad",
                      readOnly: true,
                    ),

                    // some space
                    const CustomSizedBox(heightRatio: 0.03),
                    // ! Email sections
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(
                        "Email Address",
                        style:
                            Resources.textStyle.userNameTextStyle(size: size),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    const CustomSizedBox(heightRatio: 0.008),
                    // Email Address Input Field
                    CustomTextFormField(
                      controller: (state).emailController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                      hintText: "Enter Email",
                      readOnly: true,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // ! Profile Custom AppBar Section
  PreferredSizeWidget profileCustomAppBar() {
    return CustomAppBar(
      size: size,
      centerTitle: true,
      title: AppbarSubtitleOne(text: "Profile".toUpperCase()),
      actions: [
        AppBarLeadingIconButtonOne(
            child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => NavigatorService.push(MaterialPageRoute(
            builder: (context) => const UpdateUserInfo(),
          )),
          child: Icon(Icons.edit_note_rounded,
              size: 30, color: Resources.colors.kButtonColor),
        )),
        // Some Space .
        const CustomSizedBox(
          widthRatio: 0.02,
        ),
      ],
    );
  }
}
