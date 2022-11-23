// ignore_for_file: deprecated_member_use

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space/screen/Auth/background_painter.dart';
import 'package:space/screen/Auth/decoration.dart';
import 'package:space/screen/Auth/provider/email_signin.dart';
import 'package:space/screen/Auth/register.dart';
import 'package:space/screen/Auth/sign_in.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  ValueNotifier<bool> showSignInPage = ValueNotifier<bool>(true);
  

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    super.initState();
    // dispose();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
       
        body: Stack(
          children: [
            SizedBox.expand(
              child: CustomPaint(
                  painter: BackgroundPainter(animation: _controller.view)),
            ),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: ValueListenableBuilder<bool>(
                    valueListenable: showSignInPage,
                    builder: (context, value, child) {
                      return PageTransitionSwitcher(
                          reverse: !value,
                          duration: const Duration(milliseconds: 800),
                          transitionBuilder:
                              (child, animation, secondaryAnimation) {
                            return SharedAxisTransition(
                              animation: animation,
                              secondaryAnimation: secondaryAnimation,
                              transitionType: SharedAxisTransitionType.vertical,
                              fillColor: Colors.transparent,
                              child: child,
                            );
                          },
                          child: value
                              ? SignIn(
                                  key: const ValueKey('SignIn'),
                                  onRegisterClicked: () {
                                    showSignInPage.value = false;
                                    _controller.forward();
                                  },
                                )
                              : Register(
                                  key: const ValueKey('Register'),
                                  onSignInPressed: () {
                                    showSignInPage.value = true;
                                    _controller.reverse();
                                  },
                                ));
                    }),
              ),
            )
            // Center(
            //   child: RaisedButton(
            //     onPressed: () {
            //       _controller.forward(from: 0);
            //     },
            //     child: const Text('animate'),
            //   ),
            // )
          ],
        ),
      );


}
