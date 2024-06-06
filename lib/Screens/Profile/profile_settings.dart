import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wise_student_app/Screens/News/settings_screen.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/provider/provider_theme.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wise_student_app/widget/StudentWidgets/settings.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ThemeProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          SettingButton(
            onPressed: () {
              Get.to(() => const Settings());
            },
          )
        ],
      ),
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/profileBG.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 4,
                          color: Colors.black38,
                          offset: Offset(0, 3))
                    ],
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle),
                child: InkWell(
                  onTap: () {
                    openGallery(context);
                  },
                  child: _selectedImage != null
                      ? ClipOval(
                          child: Image.file(
                            File(_selectedImage!.path),
                            fit: BoxFit.cover,
                            width: 110,
                            height: 110,
                          ),
                        )
                      : const Icon(
                          Icons.camera_alt,
                          size: 70,
                          color: Colors.white,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(prov.me!.fname.toString(),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              S.of(context).Major,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.background),
            ),
            Text(
              prov.me!.major.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              S.of(context).StudentID,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.background),
            ),
            Text(
              prov.me!.stdId.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              S.of(context).StudentEmail,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.background),
            ),
            Text(
              prov.me!.stdEmail.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              S.of(context).AcademicAdvisor,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.background),
            ),
            Text(
              prov.me!.academicAdvisor.toString(),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ]),
    );
  }

  Future<void> openGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Image selected, update state to display it
      setState(() {
        _selectedImage = pickedFile;
      });
    } else {
      // User canceled the picker
      // ignore: avoid_print
      debugPrint('No image selected.');
    }
  }
}
