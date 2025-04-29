import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/feature/User_Side/Screens/Auth/Sign_in_Screen/bloc/sign_in_bloc.dart';
import 'package:e_commerce/feature/User_Side/Screens/Auth/Sign_in_Screen/widgets/widgets.dart';

// This screen handles the user sign-in process, including form validation and state management using Bloc.
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        appBar: buildAppBar(),
        body: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            if (state is SignInClickState) {
              return buildBody(state);
            }
            return Container(); // Return an empty container if state is not SignInClickState
          },
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      bottomOpacity: 0,
      backgroundColor: Resources.colors.kAllAppColor,
    );
  }

  Widget buildBody(SignInClickState state) {
    return SafeArea(
      top: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.biggest;
          return SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: ColoredBox(
              color: Colors.transparent,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04,
                ),
                child: Form(
                  key: state.formKey,
                  child: Column(
                    children: [
                      Header(size: size),
                      EmailSection(size: size, state: state),
                      PasswordSection(
                        size: size,
                        state: state,
                        isPasswordVisible: isPasswordVisible,
                        togglePasswordVisibility: togglePasswordVisibility,
                      ),
                      const ForgotPasswordLink(),
                      SignInButton(size: size),
                      GoogleAuthButton(size: size, state: state),
                      SignUpLink(size: size),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }
}
