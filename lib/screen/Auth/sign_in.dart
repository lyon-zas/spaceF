import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space/screen/Auth/decoration.dart';
import 'package:space/screen/Auth/palette.dart';
import 'package:space/screen/Auth/sign_in_up_bar.dart';
import 'package:space/screen/Quiz/quiz.dart';

import 'provider/email_signin.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    Key? key,
    required this.onRegisterClicked,
  }) : super(key: key);

  final VoidCallback onRegisterClicked;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmailSignInProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Welcome\nBack',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 30),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: buildEmailField(),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: buildPasswordField()),
                        SignInBar(
                          label: 'Sign in',
                          isLoading: provider.isLoading,
                          onPressed: () {
                            submit();
                            provider.getData().then((value) {
                              setState(() {});
                            });
                          },
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              widget.onRegisterClicked.call();
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                color: Palette.darkBlue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEmailField() {
    final provider = Provider.of<EmailSignInProvider>(context);

    return TextFormField(
      key: const ValueKey('email'),
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      enableSuggestions: false,
      validator: (value) {
        const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
        final regExp = RegExp(pattern);

        if (!regExp.hasMatch(value!)) {
          return 'Enter a valid mail';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: signInInputDecoration(hintText: 'email'),
      onSaved: (email) => provider.userEmail = email!,
    );
  }

  Widget buildPasswordField() {
    final provider = Provider.of<EmailSignInProvider>(context);

    return TextFormField(
      key: const ValueKey('password'),
      validator: (value) {
        if (value!.isEmpty || value.length < 6) {
          return 'Password must be at least 6 characters long.';
        } else {
          return null;
        }
      },
      decoration: signInInputDecoration(hintText: 'Password'),
      obscureText: true,
      onSaved: (password) => provider.userPassword = password!,
    );
  }

  Future submit() async {
    final provider = Provider.of<EmailSignInProvider>(context, listen: false);

    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();

      final isSuccess = await provider.login();

      if (isSuccess) {
        Navigator.push(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => const MainPage()));
      } else {
        const message = 'An error occurred, please check your credentials!';

       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(message),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
      }
    }
  }
}
