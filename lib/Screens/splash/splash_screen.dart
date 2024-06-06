import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wise_student_app/Screens/LogIn/phone_number.dart';
import 'package:wise_student_app/Screens/onbloardscreen/onboard_main.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/TextFields/new_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key, Key? skey});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  double topImageOffset = 0;
  double bottomImageOffset = 0;

  final TextEditingController universityid = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool? isChecked = false;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        topImageOffset = -1;
        bottomImageOffset = -1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            isDarkMode ? "assets/topDT.png" : "assets/top.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  S.of(context).Title,
                                  style: GoogleFonts.hammersmithOne(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 40,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            MainTextField(
                              controller: universityid,
                              hint: S.of(context).Uniemail,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email address';
                                }
                                final emailRegex = RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                );
                                if (!emailRegex.hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            MainTextField(
                              controller: password,
                              hint: 'Password',
                              textInputType: TextInputType.text,
                              obscureText: _obscureText,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 5) {
                                  return 'Password must be at least 5 characters long';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  activeColor: const Color(0xff4B62A9),
                                  onChanged: (newBool) {
                                    setState(() {
                                      isChecked = newBool;
                                    });
                                  },
                                ),
                                Text(
                                  S.of(context).RememberMe,
                                  style: GoogleFonts.karma(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => const Forgetpassword());
                                  },
                                  child: Text(
                                    S.of(context).ForgetPassword,
                                    style: GoogleFonts.karma(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      try {
                                        await FirebaseAuth.instance
                                            .signInWithEmailAndPassword(
                                              email: universityid.text,
                                              password: password.text,
                                            )
                                            .then((value) =>
                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return Onboard();
                                                    },
                                                  ),
                                                  (route) => false,
                                                ));
                                      } on FirebaseAuthException catch (e) {
                                        debugPrint(e.code);
                                        String errorMessage =
                                            'An error occurred. Please try again.';
                                        switch (e.code) {
                                          case 'invalid-credential':
                                            errorMessage =
                                                'Invalid email or password.';
                                            break;
                                          case 'user-not-found':
                                            errorMessage =
                                                'No user found with this email.';
                                            break;
                                          case 'wrong-password':
                                            errorMessage =
                                                'Incorrect password. Please try again.';
                                            break;
                                        }
                                        // ignore: use_build_context_synchronously
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(errorMessage),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    }
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
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        S.of(context).login,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              curve: Curves.easeIn,
              top: topImageOffset * MediaQuery.of(context).size.height,
              left: 0,
              right: 0,
              child: Image.asset('assets/splashscreentop.png'),
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              curve: Curves.easeIn,
              bottom: bottomImageOffset * MediaQuery.of(context).size.height,
              left: 0,
              right: 0,
              child: Image.asset('assets/splashscreenbot.png'),
            ),
          ],
        ),
      ),
    );
  }
}
