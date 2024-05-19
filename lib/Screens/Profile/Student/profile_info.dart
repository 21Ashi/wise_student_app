import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wise_student_app/Screens/LogIn/phone_number.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/provider/provider_theme.dart';
import 'package:wise_student_app/widget/StudentWidgets/name_id_major.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        shadowColor: Theme.of(context).colorScheme.secondary,
        elevation: 2,
        title: Text(
          S.of(context).ProfileInformation,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
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
                    : Icon(
                        Icons.camera_alt,
                        size: 50,
                        color: Theme.of(context).colorScheme.background,
                      ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(S.of(context).ChangePic),
          const SizedBox(
            height: 30,
          ),
          const NameIDMajor(),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                Text(
                  S.of(context).Password,
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 120,
            width: MediaQuery.sizeOf(context).width - 16,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 2),
                      color: Theme.of(context).colorScheme.secondary)
                ],
                borderRadius: BorderRadius.circular(15),
                border:
                    Border.all(color: Theme.of(context).colorScheme.primary)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).Elearning,
                      ),
                      const Divider(
                        indent: 118,
                      ),
                      Text(
                        prov.me!.eLearningPass.toString(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        S.of(context).MicrosoftTeams,
                      ),
                      const Divider(
                        indent: 75,
                      ),
                      Text(
                        prov.me!.teamsPass.toString(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(const Forgetpassword());
                      },
                      child: Container(
                        width: 250,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary),
                          borderRadius: BorderRadiusDirectional.circular(15),
                        ),
                        child:
                            Center(child: Text(S.of(context).ChangePassword)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                Text(
                  S.of(context).Contactinformation,
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 70,
            width: MediaQuery.sizeOf(context).width - 16,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 2),
                      color: Theme.of(context).colorScheme.secondary)
                ],
                borderRadius: BorderRadius.circular(15),
                border:
                    Border.all(color: Theme.of(context).colorScheme.primary)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).PhoneNumber,
                      ),
                      const Divider(
                        indent: 35,
                      ),
                      Text(
                        prov.me!.phoneNumber.toString(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        S.of(context).ContectEmail,
                      ),
                      const Divider(
                        indent: 100,
                      ),
                      Text(
                        prov.me!.stdEmail.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
