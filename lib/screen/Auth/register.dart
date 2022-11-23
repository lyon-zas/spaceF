import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space/screen/Auth/decoration.dart';
import 'package:space/screen/Auth/palette.dart';
import 'package:space/screen/Auth/provider/email_signin.dart';
import 'package:space/screen/Auth/sign_in_up_bar.dart';
import 'package:space/screen/Quiz/quiz.dart';

class Register extends StatefulWidget {
  const Register({
    Key? key,
    required this.onSignInPressed,
  }) : super(key: key);

  final VoidCallback onSignInPressed;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Create\nAccount',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 30),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: buildsurnameField(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: buildmiddlenameField(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: buildUsernameField(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: buildEmailField(),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: buildPasswordField()),
                        SignUpBar(
                          label: 'Sign up',
                          isLoading: provider.isLoading,
                          onPressed: () {
                            submit();
                          },
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              widget.onSignInPressed.call();
                            },
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
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

  Widget buildUsernameField() {
    final provider = Provider.of<EmailSignInProvider>(context);

    return TextFormField(
      key: const ValueKey('username'),
      autocorrect: true,
      textCapitalization: TextCapitalization.words,
      enableSuggestions: false,
      validator: (value) {
        if (value!.isEmpty || value.length < 2 || value.contains(' ')) {
          return 'Please enter at least 4 characters without space';
        } else {
          return null;
        }
      },
      decoration: registerInputDecoration(hintText: 'username'),
      onSaved: (username) => provider.userName = username!,
    );
  }

  Widget buildsurnameField() {
    final provider = Provider.of<EmailSignInProvider>(context);

    return TextFormField(
      key: const ValueKey('Surname'),
      autocorrect: true,
      textCapitalization: TextCapitalization.words,
      enableSuggestions: false,
      validator: (value) {
        if (value!.isEmpty || value.length < 2 || value.contains(' ')) {
          return 'Please enter at least 2 characters without space';
        } else {
          return null;
        }
      },
      decoration: registerInputDecoration(hintText: 'surname'),
      onSaved: (surname) => provider.surname = surname!,
    );
  }

  Widget buildmiddlenameField() {
    final provider = Provider.of<EmailSignInProvider>(context);

    return TextFormField(
      key: const ValueKey('Middlename'),
      autocorrect: true,
      textCapitalization: TextCapitalization.words,
      enableSuggestions: false,
      validator: (value) {
        if (value!.isEmpty || value.length < 4 || value.contains(' ')) {
          return 'Please enter at least 4 characters without space';
        } else {
          return null;
        }
      },
      decoration: registerInputDecoration(hintText: 'name'),
      onSaved: (middlename) => provider.middlename = middlename!,
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
      decoration: registerInputDecoration(hintText: 'email'),
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
      decoration: registerInputDecoration(hintText: 'password'),
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

      final isSuccess = await provider.Signup();

      if (isSuccess) {
        Navigator.pop(context);
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
