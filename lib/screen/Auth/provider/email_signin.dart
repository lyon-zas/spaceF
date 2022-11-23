import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space/screen/Auth/provider/user_preferences.dart';

class EmailSignInProvider extends ChangeNotifier {
  late bool _isLoading;
  late bool _isLogin;
  late String _userEmail;
  late String _userPassword;
  late String _userName;
  late String _surname;
  late String _middlename;
  late var auth = FirebaseAuth.instance;

  EmailSignInProvider() {
    _isLoading = false;
    _isLogin = true;
    _userEmail = '';
    _userPassword = '';
    _userName = '';
    _surname = "";
    _middlename = '';
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLogin => _isLogin;

  set isLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  String get userEmail => _userEmail;

  set userEmail(String value) {
    _userEmail = value;
    notifyListeners();
  }

  String get userPassword => _userPassword;

  set userPassword(String value) {
    _userPassword = value;
    notifyListeners();
  }

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
    notifyListeners();
  }

  String get surname => _surname;

  set surname(String value) {
    _surname = value;
    notifyListeners();
  }

  String get middlename => _middlename;

  set middlename(String value) {
    _middlename = value;
    notifyListeners();
  }

  Future<bool> login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      getData();

      isLoading = false;
      return true;
    } catch (err) {
      print(err);
      isLoading = false;
      return false;
    }
  }

  initialize() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    _userName = _prefs.getString("username") ?? "";
    notifyListeners();
  }

  Future<bool> Signup() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      )
          .then((value) {
        FirebaseFirestore.instance
            .collection("users")
            .doc(value.user!.uid)
            .set({
          "email": _userEmail,
          'surname': _surname,
          'name': _middlename,
          'username': _userName
        });
      });

      isLoading = false;
      return true;
    } catch (err) {
      print(err);
      isLoading = false;
      return false;
    }
  }

  Future getData() async {
    print('get dataaaa');
    String uid = auth.currentUser!.uid;
    print(uid);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        print('get doccc');
        print('Document data: ${documentSnapshot.data()}');
        try {
          _userName = documentSnapshot.get(FieldPath(const ['username']));
          _middlename = documentSnapshot.get(FieldPath(const ['name']));
          _surname = documentSnapshot.get(FieldPath(const ['surname']));
          _userEmail = documentSnapshot.get(FieldPath(const ['email']));
          print(documentSnapshot.get(FieldPath(const ['username'])));
          final SharedPreferences _prefs =
              await SharedPreferences.getInstance();
          await _prefs.setString("username", _userName);
          initialize() async {
            final SharedPreferences _prefs =
                await SharedPreferences.getInstance();

            _userName = _prefs.getString("username") ?? "";
            notifyListeners();
          }

          print("ggguiuu $_userName");
        } catch (err) {
          print(err);
          isLoading = false;
          return false;
        }
      }
    });
  }
}
