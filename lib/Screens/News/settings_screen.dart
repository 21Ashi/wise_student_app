import 'package:flutter/material.dart';
import 'package:wise_student_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wise_student_app/Screens/News/drop_list.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/provider/provider_theme.dart';
import 'package:wise_student_app/widget/LogOut/logoutbutton.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

final FlutterLocalization localization = FlutterLocalization.instance;

class _SettingsState extends State<Settings> {
  late bool isSwitched = false; // Initialize with a default value
  late bool isSwitched2 = false; // Initialize with a default value

  @override
  void initState() {
    super.initState();
    _loadSwitchState();
  }

  Future<void> _loadSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isSwitched = prefs.getBool('notificationSwitch') ?? false;
      isSwitched2 = prefs.getBool('darkThemeSwitch') ?? false;
    });
  }

  Future<void> _saveSwitchState(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          S.of(context).Settings,
          style: GoogleFonts.hammersmithOne(
              fontSize: 24, color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: Stack(
        children: [
          Image.asset('assets/topDetails.png'),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 720,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border.all(color: Colors.black38)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 50, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).NavNotifications,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Switch(
                            value: isSwitched,
                            trackOutlineColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    Theme.of(context).colorScheme.background),
                            activeColor: const Color(0xff6089B0),
                            activeTrackColor: const Color(0xff97C1E4),
                            inactiveThumbColor: const Color(0xff6089B0),
                            inactiveTrackColor: const Color(0xff97C1E4),
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                _saveSwitchState('notificationSwitch', value);
                              });
                            })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, left: 16),
                    child: Text(
                      S.of(context).UnderNotifications,
                      style: GoogleFonts.karma(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 10),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 40, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).DarkTheme,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Switch(
                              trackOutlineColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Theme.of(context).colorScheme.background),
                              value: isSwitched2,
                              activeColor: const Color(0xff6089B0),
                              activeTrackColor: const Color(0xff97C1E4),
                              inactiveThumbColor: const Color(0xff6089B0),
                              inactiveTrackColor: const Color(0xff97C1E4),
                              onChanged: (value) {
                                setState(() {
                                  isSwitched2 = value;
                                  _saveSwitchState('darkThemeSwitch', value);
                                  Provider.of<ThemeProvider>(context,
                                          listen: false)
                                      .toggleTheme();
                                });
                              }),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      S.of(context).UnderDarkTheme,
                      style: GoogleFonts.karma(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 40, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).Languages,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(
                          width: 145,
                        ),
                        LanguageDropdown(
                          onChanged: (String language) {
                            if (language == 'English') {
                              setState(() {
                                localization.translate('en');
                              });
                            } else if (language == 'Arabic') {
                              setState(() {
                                localization.translate('ar');
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          S.of(context).UnderLangauages,
                          style: GoogleFonts.karma(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 55,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 40, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).ChangePassword,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 55,
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(S.of(context).Close,
                                              style: GoogleFonts.karma(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const MainPage(
                                                          title: '',
                                                        ),
                                                      ),
                                                      (route) => false);
                                            },
                                            child: Text(
                                              S.of(context).Change,
                                              style: GoogleFonts.karma(
                                                  color:
                                                      const Color(0xffFF5E1E),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ],
                                      title: Center(
                                        child: Text(
                                          S.of(context).ChangeText,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ),
                                      ),
                                    ));
                          },
                          child: Container(
                            width: 80,
                            height: 35,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(0, 3),
                                    blurRadius: 4,
                                    color: Colors.black38)
                              ],
                              gradient: const LinearGradient(colors: [
                                Color(0xffF9AD70),
                                Color(0xffFF5E1E)
                              ]),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                                child: Text(
                              S.of(context).Change,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 40, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).Logout,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const LogoutButton()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
