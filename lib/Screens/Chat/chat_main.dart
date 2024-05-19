import 'package:flutter/material.dart';
import 'package:wise_student_app/widget/ChatWidgets/Chat/chat_profile.dart';

class Chat extends StatelessWidget {
  const Chat({super.key, Key? ky});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
                isDarkMode ? 'assets/ChatDT.png' : 'assets/chattop.png'),
            const Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Chatprofile(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void unFocusKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
