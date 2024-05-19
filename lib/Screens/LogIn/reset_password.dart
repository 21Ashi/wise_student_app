import 'package:flutter/material.dart';

import 'package:wise_student_app/Screens/Chat/chat_page.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/TextFields/new_password_textfield.dart';
import 'package:google_fonts/google_fonts.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key, Key? ke});

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final String imagePath = brightness == Brightness.dark
        ? "assets/RDT.png"
        : "assets/resetpassword.png";

    return GestureDetector(
      onTap: () {
        unFocusKeyboard(context);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 660,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(imagePath),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 310),
                  child: Column(
                    children: [
                      Text(
                        S.of(context).ResetPassword,
                        style: GoogleFonts.hammersmithOne(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 24,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          S.of(context).UnderResetPassword,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.karma(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                        child: NewPasswordTextField(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
