import 'package:flutter/material.dart';
import 'package:wise_student_app/theme/dark_theme.dart';
import 'package:wise_student_app/theme/light_theme.dart';
import 'package:wise_student_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightTheme;
  ThemeData get themeData => _themeData;
  set themeDate(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightTheme) {
      themeDate = darktheme;
    } else {
      themeDate = lightTheme;
    }
  }

  Std? me;
  getUserDetailes() async {
    String? myId =
        FirebaseAuth.instance.currentUser?.uid; // Use null-aware operator '?'

    if (myId != null) {
      await FirebaseFirestore.instance
          .collection('students')
          .doc(myId)
          .get()
          .then((value) {
        if (value.exists) {
          me = Std.fromJson(value.data()!);
        }
      });
    }
  }
}
