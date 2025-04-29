// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer' as developer;
import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/feature/User_Side/Screens/Auth/Sign_Up_Screen/bloc/sign_up_bloc.dart';
import 'package:e_commerce/feature/User_Side/Screens/Auth/Sign_Up_Screen/bloc/sign_up_event.dart';
import 'package:e_commerce/feature/User_Side/Screens/Auth/Sign_Up_Screen/bloc/sign_up_state.dart';
import 'package:e_commerce/feature/User_Side/Screens/Auth/Sign_Up_Screen/widgets/widget.dart';
import 'package:flutter/cupertino.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late Size size;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        size = Size(constraints.maxWidth, constraints.maxHeight);
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: BlocBuilder<SignUpBloc, SignUpState>(
              bloc: context.read<SignUpBloc>(),
              builder: (context, state) {
                developer.log('${state.runtimeType}');
                return SafeArea(
                  top: false,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                      ),
                      child: Form(
                        key: (state as SignUpClickState).key,
                        child: Column(
                          children: [
                            const CustomSizedBox(heightRatio: 0.02),
                            const HeaderText(),
                            const CustomSizedBox(heightRatio: 0.02),
                            const UserNameInput(),
                            const CustomSizedBox(heightRatio: 0.03),
                            const EmailInput(),
                            const CustomSizedBox(heightRatio: 0.03),
                            PasswordInput(
                              isPasswordVisible: isPasswordVisible,
                              togglePasswordVisibility:
                                  _togglePasswordVisibility,
                            ),
                            const CustomSizedBox(heightRatio: 0.03),
                            const PhoneInput(),
                            const CustomSizedBox(heightRatio: 0.03),
                            _buildSignUpButton(context),
                            const CustomSizedBox(heightRatio: 0.03),
                            _buildGoogleAuthButton(state, context),
                            const CustomSizedBox(heightRatio: 0.03),
                            const SignInPrompt(),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  CustomAppBar _buildAppBar() {
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

  // Press this Button process Open Google Dialog Box .
  CustomButton _buildGoogleAuthButton(SignUpState state, BuildContext context) {
    return CustomButton(
      background: Resources.colors.kWhite,
      textColor: Resources.colors.kBlack,
      size: size,
      onPressed: () {
        (state is SignUpGoogleState);
        BlocProvider.of<SignUpBloc>(context).add(SignUpGoogleEvent());
      },
      buttonText: 'Sign Up With Google',
    );
  }

  CustomButton _buildSignUpButton(BuildContext context) {
    return CustomButton(
      size: size,
      onPressed: () {
        BlocProvider.of<SignUpBloc>(context).add(SignUpClickEvent());
      },
      buttonText: 'Sign Up',
    );
  }
}
