import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:joha_test/common/custom_animation.dart';
import 'package:joha_test/features/personalization/personal_profile/model/user_model.dart';

class PersonalProfileRepository extends GetxController {
  final _db = FirebaseFirestore.instance;

  configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false
      ..customAnimation = CustomAnimation();
  }

  Future<void> startLoading(BuildContext context,
      [String message = "Please wait...", bool? isdismissed]) async {
    FocusScope.of(context).requestFocus(FocusNode());
    EasyLoading.show(
      dismissOnTap: false,
    );
  }

  loadingSuccessful(String? message,
      [bool showDialog = false,
      BuildContext? context,
      bool gotoDashBoard = true,
      Function? listener]) {
    EasyLoading.dismiss().then((value) {});
  }

  createPersonalProfile(UserModel user) async {
    await startLoading(Get.context!);
    _db.collection("Users").add(user.toJson()).whenComplete(() {
      Get.snackbar(
          "Success", "Your personal profile has been added successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white);
      loadingSuccessful(null);
    }).catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong, Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      throw error.toString();
    });
  }

  Future<List<UserModel>> getPersonalProfileDetails() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }
}
