import 'package:flutter/material.dart';
import 'package:wise_student_app/Screens/News/settings_screen.dart';
import 'package:wise_student_app/Screens/Profile/Registration/available_classes.dart';
import 'package:wise_student_app/Screens/Profile/Registration/direct_regs.dart';
import 'package:wise_student_app/Screens/Profile/Registration/exam_dates.dart';
import 'package:wise_student_app/Screens/Profile/Registration/payment_screen.dart';
import 'package:wise_student_app/Screens/Profile/Registration/registration_date.dart';
import 'package:wise_student_app/Screens/Profile/Registration/subject_list.dart';
import 'package:wise_student_app/Screens/Profile/Student/disciplinary_penalties.dart';
import 'package:wise_student_app/Screens/Profile/Student/electronic_requests.dart';
import 'package:wise_student_app/Screens/Profile/Student/marks.dart';
import 'package:wise_student_app/Screens/Profile/Student/profile_info.dart';
import 'package:wise_student_app/Screens/Profile/Student/studying_plan.dart';
import 'package:wise_student_app/Screens/Profile/Student/your_schedule.dart';
import 'package:wise_student_app/Screens/Profile/profile_settings.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/StudentWidgets/profile_button.dart';
import 'package:wise_student_app/widget/StudentWidgets/reg.dart';
import 'package:wise_student_app/widget/StudentWidgets/settings.dart';
import 'package:wise_student_app/widget/StudentWidgets/text_tabs.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                isDarkMode ? 'assets/LibraryDT.png' : 'assets/Librarybg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SettingButton(
                    onPressed: () {
                      Get.to(() => const Settings());
                    },
                  ),
                  Text(
                    S.of(context).StudentProfile,
                    style: GoogleFonts.hammersmithOne(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  ProfileButton(
                    onPressed: () {
                      Get.to(() => const ProfileSettings());
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextTab(
                    tabTitles: [
                      S.of(context).Registration,
                      '',
                      S.of(context).Student,
                    ],
                    onTabSelected: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                ],
              ),
            ),
            _selectedIndex == 0
                ? const RegistarationContent()
                : const StudentContent(),
          ],
        ),
      ),
    );
  }
}

class RegistarationContent extends StatelessWidget {
  const RegistarationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RegistrationWidget(
            icon2: Icons.arrow_forward_ios,
            icon: Icons.edit_outlined,
            text: S.of(context).DirectRegistration,
            navigateToClass: const DirectRegistration(),
          ),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
          RegistrationWidget(
            icon2: Icons.arrow_forward_ios,
            icon: Icons.list,
            text: S.of(context).AvailableClasses,
            navigateToClass: const AvailableClasses(),
          ),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
          RegistrationWidget(
            icon2: Icons.arrow_forward_ios,
            icon: Icons.schedule_outlined,
            text: S.of(context).RegistrationDate,
            navigateToClass: const RegistrationDate(),
          ),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
          RegistrationWidget(
            icon2: Icons.arrow_forward_ios,
            icon: Icons.payments_outlined,
            text: S.of(context).PaymentSelection,
            navigateToClass: const PaymentHourSelection(),
          ),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
          RegistrationWidget(
            icon2: Icons.arrow_forward_ios,
            icon: Icons.list_alt_outlined,
            text: S.of(context).SubjectsList,
            navigateToClass: const SubjectList(),
          ),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
          RegistrationWidget(
            icon2: Icons.arrow_forward_ios,
            icon: Icons.table_chart_outlined,
            text: S.of(context).ExamsDate,
            navigateToClass: const ExamsDate(),
          ),
        ],
      ),
    );
  }
}

class StudentContent extends StatelessWidget {
  const StudentContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RegistrationWidget(
            icon2: Icons.arrow_forward_ios,
            icon: Icons.info_outline,
            text: S.of(context).ProfileInformation,
            navigateToClass: const ProfileInfo(),
          ),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
          RegistrationWidget(
            icon2: Icons.arrow_forward_ios,
            icon: Icons.table_rows_outlined,
            text: S.of(context).YourSchedule,
            navigateToClass: const Schedule(),
          ),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
          RegistrationWidget(
            icon2: Icons.arrow_forward_ios,
            icon: Icons.space_dashboard_outlined,
            text: S.of(context).StudyingPlan,
            navigateToClass: const Studyingplan(),
          ),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
          RegistrationWidget(
            icon2: Icons.arrow_forward_ios,
            icon: Icons.disabled_by_default_outlined,
            text: S.of(context).Disciplinarypenalties,
            navigateToClass: const Disciplinary(),
          ),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
          RegistrationWidget(
            icon2: Icons.arrow_forward_ios,
            icon: Icons.list_alt_outlined,
            text: S.of(context).Marks,
            navigateToClass: const Marks(),
          ),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
          RegistrationWidget(
            icon2: Icons.arrow_forward_ios,
            icon: Icons.question_answer_outlined,
            text: S.of(context).Electronicrequests,
            navigateToClass: const ElectronicRequest(),
          ),
        ],
      ),
    );
  }
}
