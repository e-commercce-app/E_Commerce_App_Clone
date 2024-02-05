import 'package:e_commerce/View/Check/password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<PasswordPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordVisibilityBloc(),
      child: const SignInForm(),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordBloc = BlocProvider.of<PasswordVisibilityBloc>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            obscureText:
                BlocProvider.of<PasswordVisibilityBloc>(context).state ==
                    PasswordVisibilityState.hidden,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  BlocProvider.of<PasswordVisibilityBloc>(context).state ==
                          PasswordVisibilityState.hidden
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  passwordBloc.add(PasswordVisibilityEvent.toggle);
                },
              ),
            ),
          ),
          // Add other sign-in form fields and buttons
        ],
      ),
    );
  }
}
