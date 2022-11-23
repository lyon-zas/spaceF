// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:space/screen/Auth/palette.dart';
import 'package:space/screen/Auth/provider/email_signin.dart';
import 'package:space/screen/Auth/provider/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space/screen/Auth/provider/user_preferences.dart';
import 'package:space/splashscreen.dart';
// import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await GetStorage.init();
  await UserSimplePreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
    child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
            ChangeNotifierProvider(
                create: (context) => EmailSignInProvider()..getData()),
          ],
          child: MaterialApp(
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: GoogleFonts.mulishTextTheme(),
              accentColor: Palette.darkOrange,
              appBarTheme: const AppBarTheme(
                brightness: Brightness.dark,
                color: Palette.darkBlue,
              ),
            ),
            home: SplashScreen(),
            debugShowCheckedModeBanner: false,
          ),
        ),
  );
}
