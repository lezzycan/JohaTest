import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joha_test/features/personalization/business_profile/model/business_model.dart';
import 'package:joha_test/features/repository/personal_profile_repository/personal_profile_respository.dart';

class BusinessProfileRepo extends GetxController {
  final _db = FirebaseFirestore.instance;

  createPersonalProfile(BusinessProfileModel business) async {
    await Get.put(PersonalProfileRepository()).startLoading(Get.context!);
    _db.collection("Users").add(business.toJson()).whenComplete(() {
      Get.snackbar(
          "Success", "Your personal profile has been added successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white);
      Get.put(PersonalProfileRepository()).loadingSuccessful(null);
    }).catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong, Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }
}
