import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wise_student_app/Screens/Chat/chat_page.dart';
import 'package:wise_student_app/Screens/LogIn/reset_password.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Entercode extends StatelessWidget {
  const Entercode({Key? key}) : super(key: key);

  // Function to launch URL
  void launchUrl(Uri url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url.toString())) {
      // ignore: deprecated_member_use
      await launch(url.toString());
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
                width: MediaQuery.sizeOf(context).width,
                height: 650,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(isDarkMode
                        ? "assets/VerificationDT.png"
                        : "assets/entercode.png"),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 300),
                  child: Column(
                    children: [
                      Text(
                        S.of(context).Verification,
                        style: GoogleFonts.hammersmithOne(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 24,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          S.of(context).UnderVerification2,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.karma(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text(
                          S.of(context).EnterCode,
                          style: GoogleFonts.lato(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 80, right: 80, top: 0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 68,
                                width: 50,
                                child: TextField(
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 68,
                                width: 50,
                                child: TextField(
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 68,
                                width: 50,
                                child: TextField(
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 68,
                                width: 50,
                                child: TextField(
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).UnderCode,
                              style: GoogleFonts.khmer(fontSize: 12),
                            ),
                            Text(
                              S.of(context).UnderCode2,
                              style: GoogleFonts.khmer(
                                color: const Color(0xff4B62A9),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => const Resetpassword());
                          },
                          child: Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xff4B62A9),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(0, 3),
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                S.of(context).VerifyButton,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).UnderVerifyButton1,
                              style: GoogleFonts.khmer(fontSize: 12),
                            ),
                            InkWell(
                              onTap: () {
                                Uri url = Uri.parse('https://www.wise.edu.jo');
                                launchUrl(url);
                              },
                              child: Text(
                                S.of(context).UnderVerifyButton2,
                                style: GoogleFonts.khmer(
                                  color: const Color(0xff4B62A9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
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
        ),
      ),
    );
  }
}
