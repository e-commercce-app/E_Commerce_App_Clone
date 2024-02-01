import 'package:e_commerce/Components/Widgets/custom_form_field.dart';
import 'package:e_commerce/Components/Widgets/validation_function.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/View/Screens/Auth/Sign_Up_Screen/bloc/sign_up_bloc.dart';
import 'package:e_commerce/View/Screens/Auth/Sign_Up_Screen/bloc/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //  TextFormField Global Key .
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Screen Size .
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
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
                    key: formKey,
                    child: Column(
                      children: [
                        // Some Space
                        const CustomSizedBox(
                          heightRatio: 0.15,
                        ),
                        Text(
                          "Hello Again!".toUpperCase(),
                          style: Resources.textStyle
                              .createAccountTextStyle(size: size),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const CustomSizedBox(heightRatio: 0.003),
                        Text(
                          "Welcome Back You've Been Missed!",
                          style: Resources.textStyle
                              .togetherCreateTextStyle(size: size),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const CustomSizedBox(heightRatio: 0.07),
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
                          // controller: (state).emailController,
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
                          // controller: (state).passwordController,
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
                        _signInButton(),
                        // some space
                        const CustomSizedBox(heightRatio: 0.05),
                        // ! Google Button Sections .
                        CustomButton(
                            background: Resources.colors.white,
                            textColor: Resources.colors.black,
                            size: size,
                            onPressed: () {},
                            buttonText: "Sign In With Google"),
                        const CustomSizedBox(heightRatio: 0.04),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account?",
                                  style: TextStyle(
                                    // color: colorScheme.primary,
                                    fontSize: size.height * 0.012,
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
                                        // color: colorScheme.primaryContainer,
                                        fontSize: size.height * 0.012,
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
          )),
    );
  }

  Widget _signInButton() {
    return CustomButton(size: size, onPressed: () {}, buttonText: "Sign In");
  }
}
