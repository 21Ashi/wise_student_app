import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wise_student_app/Screens/Chat/chat_page.dart';
import 'package:wise_student_app/Screens/LogIn/phone_number.dart';
import 'package:wise_student_app/Screens/onbloardscreen/onboard_main.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/News/scan_id.dart';
import 'package:wise_student_app/widget/TextFields/email_textfield.dart';
import 'package:wise_student_app/widget/TextFields/password_textfield.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:restart_app/restart_app.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen2> {
  double timer = 0;
  double timer2 = 0;
  TextEditingController universityid = TextEditingController();
  TextEditingController password = TextEditingController();
  bool? isChecked = false;

  @override
  void initState() {
    super.initState();
    setDuration();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        unFocusKeyboard(context);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 390,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            isDarkMode ? "assets/topDT.png" : "assets/top.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      S.of(context).Title,
                      style: GoogleFonts.hammersmithOne(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, left: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomEmailField(
                            controller: universityid,
                            hintText: '',
                            labelText: S.of(context).Uniemail),
                        const SizedBox(height: 20),
                        CustomPasswordField(
                            controller: password,
                            hintText: '',
                            labelText: S.of(context).Password)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
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
                        Text(S.of(context).RememberMe,
                            style: GoogleFonts.karma(
                                fontSize: 10, fontWeight: FontWeight.w500)),
                        const SizedBox(
                          width: 160,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const Forgetpassword());
                          },
                          child: Text(S.of(context).ForgetPassword,
                              style: GoogleFonts.karma(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(
                        width: 100,
                      ),
                      InkWell(
                        onTap: () async {
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: universityid.text,
                                    password: password.text)
                                .then((value) =>
                                    Navigator.pushAndRemoveUntil(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Onboard();
                                    }), (route) => false));
                          } on FirebaseAuthException catch (e) {
                            debugPrint(e.code);
                            switch (e.code) {
                              case 'wrong-password':
                                return;
                              case 'lkmd':
                                debugPrint('wrong password');
                                break; // Added break statement to exit switch case
                              default:
                                debugPrint('this is another exception');
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
                      const SizedBox(
                        width: 20,
                      ),
                      const ScanID(),
                    ],
                  ),

                  // const SizedBox(height: 30,),
                  // Center(
                  //   child: InkWell(
                  //     onTap: () async {
                  //         await FirebaseAuth.instance
                  //         .createUserWithEmailAndPassword(
                  //           email: universityid.text,
                  //           password: password.text)
                  //         .then((value) => FireAuth.createUser())
                  //         .onError((error, stackTrace) =>
                  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString()))));

                  //     },
                  //         child: Container(
                  //           width: 200,
                  //           height: 50,
                  //           decoration: BoxDecoration(
                  //             color: const Color.fromARGB(255, 169, 75, 75),
                  //             borderRadius: BorderRadius.circular(30),
                  //             boxShadow: const [
                  //               BoxShadow(
                  //                 color: Colors.black45,
                  //                 offset: Offset(0, 3),
                  //               ),
                  //             ],
                  //           ),
                  //           child: const Center(
                  //             child: Text(
                  //               "signin",
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  // ),
                ],
              ),
              AnimatedSlide(
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeIn,
                  offset: Offset(0, timer),
                  child: Image.asset('assets/splashscreentop.png')),
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: AnimatedSlide(
                  offset: Offset(0, timer2),
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeIn,
                  child: Image.asset('assets/splashscreenbot.png'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void setDuration() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        timer = -1;
        timer2 = 1;
      });
    });
    Future.delayed(const Duration(seconds: 6), () {
      checkNetwork();
    });
  }

  void checkNetwork() async {
    ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.wifi &&
        connectivityResult != ConnectivityResult.mobile) {
      showConnectionDialog(context);
    }
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      if (connectivityResult != ConnectivityResult.wifi &&
          connectivityResult != ConnectivityResult.mobile) {
        showConnectionDialog(context);
      }
      debugPrint('conected with wifi');
    });
  }

  void showConnectionDialog(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Container(
            height: 330,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).colorScheme.background,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 3,
                      color: Colors.black38)
                ]),
            child: Material(
              borderRadius: BorderRadius.circular(25),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Image.asset(
                      isDarkMode ? 'assets/cloudDT.png' : 'assets/cloud.png'),
                  const SizedBox(height: 20),
                  const Text(
                    'No internet connection',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Please check your internet',
                  ),
                  const Text('connection'),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Restart.restartApp();
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: const Color(0xff4B62A9),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 4,
                                color: Colors.black38)
                          ]),
                      child: Center(
                          child: Text(
                        'Try Again',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
