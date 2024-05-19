import 'package:flutter/material.dart';
import 'package:wise_student_app/Screens/Chat/chat_page.dart';
import 'package:wise_student_app/Screens/LogIn/code_screen.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key, Key? ky});

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
                height: 630,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(isDarkMode
                          ? "assets/PnDT.png"
                          : "assets/forgetpassword.png"),
                      fit: BoxFit.fill),
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
                          textAlign: TextAlign.center,
                          S.of(context).UnderVerifaction,
                          style: GoogleFonts.karma(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 70),
                        child: SizedBox(
                          height: 100,
                          child: IntlPhoneField(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.blue)),
                              labelText: S.of(context).PhoneNumber,
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide()),
                            ),
                            initialCountryCode: 'JO',
                            onChanged: (phone) {
                              debugPrint(phone.completeNumber);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => const Entercode());
                          },
                          child: Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xff4B62A9),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                S.of(context).ResetPassword,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
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
