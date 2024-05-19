import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends GetxController {
  double timer = 0;
  double timer2 = 0;
  TextEditingController universityid = TextEditingController();
  TextEditingController password = TextEditingController();
  bool? isChecked = false;

  @override
  void onInit() {
    super.onInit();
    checkNetwork();
    checkPermissionAndWhatsAfterIt();
  }

  void checkNetwork() async {
    ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.wifi &&
        connectivityResult != ConnectivityResult.mobile) {
      showConnectionDialog("Not Connected to Wifi");
    }
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      if (connectivityResult != ConnectivityResult.wifi &&
          connectivityResult != ConnectivityResult.mobile) {
        showConnectionDialog("Not Connected to Wifi");
      } else {
        log('Connected with wifi');
      }
    });
  }

  void showConnectionDialog(String message) {
    showDialog(
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          actions: <Widget>[
            TextButton(
              child: const Text('OK', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void checkPermissionAndWhatsAfterIt() async {
    PermissionStatus permissionStatus = await Permission.notification.status;
    if (permissionStatus != PermissionStatus.granted) {
      PermissionStatus requestedStatus =
          await Permission.notification.request();
      if (requestedStatus != PermissionStatus.granted) {
        openAppSettings();
      }
    }
  }
}
