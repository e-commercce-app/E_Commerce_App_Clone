import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce/Components/Widgets/custom_form_field.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/View/Screens/Auth/Sign_Up_Screen/bloc/sign_up_bloc.dart';
import 'package:e_commerce/View/Screens/Auth/Sign_Up_Screen/bloc/sign_up_event.dart';
import 'package:e_commerce/View/Screens/Auth/Sign_Up_Screen/bloc/sign_up_state.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Screen Size .
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            state as SignUpClickState;
            return SafeArea(
              top: false,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                    ),
                    child: Form(
                      key: state.key,
                      child: Column(
                        children: [
                          // Some Space
                          const CustomSizedBox(
                            heightRatio: 0.15,
                          ),
                          Text(
                            "Create Account",
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
                          const CustomSizedBox(heightRatio: 0.07),
                          // ! User Name sections
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
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
                            hintText: "Jawad",
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
                            child: Text(
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
                            child: Text(
                              "Password",
                              style: Resources.textStyle
                                  .userNameTextStyle(size: size),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          const CustomSizedBox(heightRatio: 0.008),
                          // Password TextField .
                          CustomTextFormField(
                            controller: (state).passwordController,
                            textInputType: TextInputType.visiblePassword,
                            hintText: "Enter Your Password",
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter a Password.";
                              } else if (value.length <= 6) {
                                return "Minimum Six Number.";
                              }
                              return null;
                            },
                          ),

                          // some space
                          const CustomSizedBox(heightRatio: 0.05),
                          // !SignUp Button Sections
                          // _signInButton(),
                          _signUpButton(context),
                          const CustomSizedBox(heightRatio: 0.05),
                          // ! Google Button Sections .
                          _googleAuthButton(state, context),
                          const CustomSizedBox(heightRatio: 0.03),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account?",
                                    style: TextStyle(
                                      // color: colorScheme.primary,
                                      fontSize: size.height * 0.015,
                                      fontFamily: 'Airbnb Cereal App',
                                      fontWeight: FontWeight.w400,
                                    )
                                    // style:
                                    //     CustomTextStyles.bodySmallGray600
                                    ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 2),
                                    child: Text("Sign In",
                                        style: TextStyle(
                                          fontSize: size.height * 0.02,
                                          fontFamily: 'Airbnb Cereal App',
                                          fontWeight: FontWeight.w500,
                                        )
                                        // style: theme.textTheme.labelLarge
                                        ))
                              ]),
                          const SizedBox(height: 5)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Press this Button process Open Google Dialog Box .
  CustomButton _googleAuthButton(SignUpState state, BuildContext context) {
    return CustomButton(
        background: Resources.colors.white,
        textColor: Resources.colors.black,
        size: size,
        onPressed: () {
          (state is SignUpGoogleState);
          BlocProvider.of<SignUpBloc>(context).add(SignUpGoogleEvent());
        },
        buttonText: "Sign In With Google");
  }

  // Press Button process this Sign Create User .
  CustomButton _signUpButton(BuildContext context) {
    return CustomButton(
        size: size,
        onPressed: () {
          BlocProvider.of<SignUpBloc>(context, listen: false)
              .add(SignUpClickEvent());
        },
        buttonText: "Sign In");
  }
}
