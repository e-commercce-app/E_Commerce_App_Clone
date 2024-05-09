import 'package:e_commerce/Components/Widgets/custom_form_field.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/View/User_Side/Screens/Auth/Sign_in_Screen/bloc/sign_in_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // Screen Size .
  late Size size;

  //
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          appBar: AppBar(
            elevation: 0,
            bottomOpacity: 0,
            backgroundColor: Resources.colors.kAllAppColor,
          ),
          body: BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
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
                        key: (state as SignInClickState).formKey,
                        child: Column(
                          children: [
                            // Some Space
                            const CustomSizedBox(
                              heightRatio: 0.08,
                            ),
                            Text(
                              helloAgain.toUpperCase(),
                              style: Resources.textStyle
                                  .createAccountTextStyle(size: size),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const CustomSizedBox(heightRatio: 0.003),
                            Text(
                              welcomeBackYouMissed,
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
                                signInEmailAddress,
                                style: Resources.textStyle
                                    .userNameTextStyle(size: size),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            const CustomSizedBox(heightRatio: 0.008),
                            // Email Address Input Field
                            CustomTextFormField(
                              controller: (state).emailAddress,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress,
                              hintText: signInEnterEmail,
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
                                password,
                                style: Resources.textStyle
                                    .userNameTextStyle(size: size),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            const CustomSizedBox(heightRatio: 0.008),
                            // Password TextField .
                            CustomTextFormField(
                              controller: (state).password,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              hintText: "Enter Your Password",

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
                                      : const Icon(
                                          Icons.remove_red_eye_outlined)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter a Password.";
                                } else if (value.length <= 6) {
                                  return "Minimum Six Number.";
                                }
                                return null;
                              },
                            ),
                            const CustomSizedBox(heightRatio: 0.02),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                    splashColor:
                                        Resources.colors.kBlue.withOpacity(0.5),
                                    onTap: () => NavigatorService.pushNamed(
                                        RoutesName.forgetPasswordScreen),
                                    child: AutoSizeText(recoveryPassword))),
                            // some space
                            const CustomSizedBox(heightRatio: 0.05),
                            // !SignUp Button Sections
                            _signInButton(context),
                            // some space
                            const CustomSizedBox(heightRatio: 0.05),
                            // ! Google Button Sections .
                            _googleAuthButton(state, context),
                            const CustomSizedBox(heightRatio: 0.04),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(haveAnOtherAccount,
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
                                      child: InkWell(
                                        onTap: () => NavigatorService
                                            .pushReplacementsNamed(
                                                RoutesName.signUpScreen),
                                        child: Text("Sign Up",
                                            style: TextStyle(
                                              // color: colorScheme.primaryContainer,
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
                ),
              );
            },
          )
          //   },
          // )
          ),
    );
  }

  // Press SignIn Button trigger this state and initial value TextEditingController
  CustomButton _signInButton(BuildContext context) {
    return CustomButton(
        size: size,
        onPressed: () {
          BlocProvider.of<SignInBloc>(context).add(SignInClickEvent());
        },
        buttonText: signIn);
  }

  // Press Google Button trigger event and implement this state .
  CustomButton _googleAuthButton(SignInState state, BuildContext context) {
    return CustomButton(
        background: Resources.colors.kWhite,
        textColor: Resources.colors.kBlack,
        size: size,
        onPressed: () {
          (state is SignInGoogleState);
          BlocProvider.of<SignInBloc>(context).add(SignInGoogleEvent());
        },
        buttonText: signInWithGoogle);
  }
}
