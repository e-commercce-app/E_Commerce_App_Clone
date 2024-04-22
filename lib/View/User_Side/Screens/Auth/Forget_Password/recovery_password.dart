import 'package:e_commerce/Components/Widgets/custom_form_field.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';

import 'bloc/recovery_password_bloc.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  // Screen Size .
  late Size size;
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
          body: BlocBuilder<RecoveryPasswordBloc, RecoveryPasswordState>(
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
                        key: (state as ForgetPasswordClickState).formKey,
                        child: Column(
                          children: [
                            // Some Space
                            const CustomSizedBox(
                              heightRatio: 0.08,
                            ),
                            FittedBox(
                              child: AutoSizeText(
                                recoveryPassword.toUpperCase(),
                                style: Resources.textStyle
                                    .createAccountTextStyle(size: size),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            const CustomSizedBox(heightRatio: 0.003),
                            AutoSizeText(
                              pleaseEnterEmailAddress,
                              style: Resources.textStyle
                                  .togetherCreateTextStyle(size: size),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                            const CustomSizedBox(heightRatio: 0.07),
                            // ! Email sections
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                signInEnterEmail,
                                style: Resources.textStyle
                                    .userNameTextStyle(size: size),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            const CustomSizedBox(heightRatio: 0.008),
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
                            const CustomSizedBox(heightRatio: 0.05),
                            // !SignUp Button Sections
                            CustomButton(
                                size: size,
                                onPressed: () {
                                  BlocProvider.of<RecoveryPasswordBloc>(context)
                                      .add(ForgetPasswordClickEvent());
                                },
                                buttonText: continuo),
                            const CustomSizedBox(heightRatio: 0.04),
                            const SizedBox(height: 5)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
