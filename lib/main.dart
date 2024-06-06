import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:wise_student_app/Screens/Library/cart_provider.dart';
import 'package:wise_student_app/Screens/Library/shoppingcart.dart';
import 'package:wise_student_app/Screens/LogIn/phone_number.dart';
import 'package:wise_student_app/Screens/splash/splash_screen.dart';
import "package:wise_student_app/generated/l10n.dart";
import 'package:wise_student_app/Screens/onbloardscreen/onboard_main.dart';
import 'package:wise_student_app/provider/provider_theme.dart';
import 'package:wise_student_app/widget/News/scan_id.dart';
import 'package:wise_student_app/widget/TextFields/new_text_field.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void displayNotification(RemoteMessage message) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your_channel_id',
    'Your channel name',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
  );
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0,
    message.notification?.title,
    message.notification?.body,
    platformChannelSpecifics,
    payload: message.data['data'],
  );
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeNotifications();
  await Firebase.initializeApp();

  Get.put(ShoppingCartController());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
          child: const MyApp(),
        ),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

mixin AppLocale {
  static const String title = 'title';
  static const String thisIs = 'thisIs';

  static const Map<String, dynamic> en = {};
  static const Map<String, dynamic> ar = {};
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  Locale? _locale;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    _localization.init(mapLocales: [
      const MapLocale('en', AppLocale.en, countryCode: 'US'),
      const MapLocale('ar', AppLocale.ar, countryCode: 'JO')
    ], initLanguageCode: 'en');
    _localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
    _firebaseMessaging.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle incoming messages here
    });
  }

  void _onTranslatedLanguage(Locale? value) {
    setState(() {
      _locale = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        builder: (context, child) {
          return Directionality(
            textDirection: _locale?.languageCode == 'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: child!,
          );
        },
        theme: Provider.of<ThemeProvider>(context).themeData,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen2(), // Use MainPage directly
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('ar')],
        locale: _locale);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Locale>('_locale', _locale));
    properties.add(DiagnosticsProperty<Locale>('_locale', _locale));
  }
}

Future<void> initializeNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  final DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    onDidReceiveLocalNotification:
        (int id, String? title, String? body, String? payload) async {
      // Handle received local notification, if needed
    },
  );

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );
}

Future<void> showNotification() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your_channel_id',
    'Your channel name',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
  );

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0, // Notification ID
    'New Notification',
    'This is a test notification',
    platformChannelSpecifics,
    payload: 'screen_id', // Payload to identify the screen to navigate to
  );
}

void onSelectNotification(String? payload) {
  if (payload != null) {
    // Handle the notification payload, e.g., navigate to a specific screen
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, Key? ke, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainPage> {
  TextEditingController universityid = TextEditingController();
  TextEditingController password = TextEditingController();
  bool? isChecked = false;
  double timer = 0;
  double timer2 = 0;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        unFocusKeyboard(context);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
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
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainTextField(
                        controller: universityid,
                        hint: S.of(context).Uniemail,
                        textInputType: TextInputType.text),
                    const SizedBox(height: 20),
                    MainTextField(
                        controller: password,
                        hint: S.of(context).Password,
                        textInputType: TextInputType.text),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
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
                    Text(
                      S.of(context).RememberMe,
                      style: GoogleFonts.karma(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 160),
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
