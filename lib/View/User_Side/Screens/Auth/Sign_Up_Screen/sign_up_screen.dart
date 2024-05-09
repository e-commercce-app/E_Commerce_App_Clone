// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';

import 'package:e_commerce/Export/e_commerce_export.dart';

import '../../../../../Components/Widgets/AppBar/app_bar_leading_icon_button.dart';
import '../../../../../Components/Widgets/AppBar/custom_appbar.dart';
import '../../../../../Components/Widgets/custom_form_field.dart';
import 'bloc/sign_up_bloc.dart';
import 'bloc/sign_up_event.dart';
import 'bloc/sign_up_state.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Screen Size .
  late Size size;

  // check password
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: signUpAppBar(),
          body: BlocBuilder<SignUpBloc, SignUpState>(
              bloc: context.read<SignUpBloc>(),
              builder: (context, state) {
                developer.log("${state.runtimeType}");

                return SafeArea(
                  top: false,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                      ),
                      child: Form(
                        key: (state as SignUpClickState).key,
                        child: Column(
                          children: [
                            // SignUpGalleryImage(
                            //   onTap: () {
                            //     // state is ImagePickerLoadedState;
                            //     developer.log("${state.runtimeType}");
                            //     BlocProvider.of<SignUpBloc>(context)
                            //         .add(ImagePickerGalleryEvent());
                            //     if (kDebugMode) {
                            //       print("object");
                            //     }
                            //   },
                            //   size: size,
                            //   image: CustomImageView(
                            //       imagePath: Resources.imagePath.sneaker1),
                            // ),
                            //********************************

                            // *************** User Name Input Field ****************

                            Text(
                              "Create Account".toUpperCase(),
                              style: Resources.textStyle
                                  .createAccountTextStyle(size: size),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const CustomSizedBox(heightRatio: 0.003),
                            Text(
                              "Let's Create Account Together",
                              style: Resources.textStyle
                                  .togetherCreateTextStyle(size: size),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const CustomSizedBox(heightRatio: 0.02),
                            // ! User Name sections
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                "Your Name",
                                style: Resources.textStyle
                                    .userNameTextStyle(size: size),
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
                              hintText: "E_commerce",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter A Name";
                                } else if (value.length <= 4) {
                                  return "Username should be less than 4 characters.";
                                }
                                return null;
                              },
                            ),
                            // some space
                            const CustomSizedBox(heightRatio: 0.03),
                            // ! Email sections
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                "Email Address",
                                style: Resources.textStyle
                                    .userNameTextStyle(size: size),
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
                              validator: (value) {
                                if (value == null ||
                                    !isValidEmail(value, isRequired: true)) {
                                  return "Please Enter Valid Email";
                                }
                                return null;
                              },
                            ),
                            // some space
                            const CustomSizedBox(heightRatio: 0.03),
                            // ! Password sections
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                "Password",
                                style: Resources.textStyle
                                    .userNameTextStyle(size: size),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            const CustomSizedBox(heightRatio: 0.008),
                            // Password TextField .
                            _passwordButton(
                              state,
                              context,
                            ),
                            // some space
                            const CustomSizedBox(heightRatio: 0.03),
                            // ! Phone sections
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                "Phone Number",
                                style: Resources.textStyle
                                    .userNameTextStyle(size: size),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            CustomTextFormField(
                              controller: (state).phoneController,
                              textInputType: TextInputType.phone,
                              hintText: "Enter Your Phone No",
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter a Phone Number.";
                                } else if (value.length <= 10) {
                                  return "Minimum 11 Number.";
                                }
                                return null;
                              },
                            ),
                            // some space
                            const CustomSizedBox(heightRatio: 0.03),
                            // !SignUp Button Sections
                            _signUpButton(context),
                            const CustomSizedBox(heightRatio: 0.03),
                            // ! Google Button Sections .
                            _googleAuthButton(state, context),
                            const CustomSizedBox(heightRatio: 0.03),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText("Already have an account?",
                                      style: TextStyle(
                                        // color: colorScheme.primary,
                                        fontSize: size.height * 0.015,
                                        fontFamily: 'Airbnb Cereal App',
                                        fontWeight: FontWeight.w400,
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: InkWell(
                                        onTap: () => NavigatorService
                                            .pushReplacementsNamed(
                                                RoutesName.signInScreen),
                                        child: AutoSizeText("Sign In",
                                            style: TextStyle(
                                              fontSize: size.height * 0.02,
                                              fontFamily: 'Airbnb Cereal App',
                                              fontWeight: FontWeight.w500,
                                            )
                                            // style: theme.textTheme.labelLarge
                                            ),
                                      ))
                                ]),
                            const SizedBox(height: 5)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })),
    );
  }

  // Sign Up Custom AppBar Section
  CustomAppBar signUpAppBar() {
    return CustomAppBar(
      size: size,
      leading: AppBarLeadingIconButtonOne(
        onTap: () => NavigatorService.pushNamed(RoutesName.signInScreen),
        child: Icon(
          CupertinoIcons.arrow_left,
          color: Resources.colors.kBlack,
          size: size.width * 0.07,
        ),
      ),
    );
  }

  Widget _passwordButton(
    SignUpState state,
    BuildContext context,
  ) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return CustomTextFormField(
        controller: (state as SignUpClickState).passwordController,
        textInputType: TextInputType.visiblePassword,
        hintText: "Enter Your Password",
        textInputAction: TextInputAction.done,
        obscureText: isPasswordVisible,
        // ! Visible and UnVisible .
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
            icon: isPasswordVisible
                ? const Icon(Icons.remove_red_eye)
                : const Icon(Icons.remove_red_eye_outlined)),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please Enter a Password.";
          } else if (value.length <= 6) {
            return "Minimum Six Number.";
          }
          return null;
        },
      );
    });
  }

  // Press this Button process Open Google Dialog Box .
  CustomButton _googleAuthButton(SignUpState state, BuildContext context) {
    return CustomButton(
        background: Resources.colors.kWhite,
        textColor: Resources.colors.kBlack,
        size: size,
        onPressed: () {
          (state is SignUpGoogleState);
          BlocProvider.of<SignUpBloc>(context, listen: false)
              .add(SignUpGoogleEvent());
        },
        buttonText: "Sign Up With Google");
  }

  // Press Button process this Sign Create User .
  CustomButton _signUpButton(BuildContext context) {
    return CustomButton(
        size: size,
        onPressed: () {
          BlocProvider.of<SignUpBloc>(context, listen: false)
              .add(SignUpClickEvent());
        },
        buttonText: "Sign Up");
  }
}
