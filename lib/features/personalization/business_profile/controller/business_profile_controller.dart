import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:joha_test/features/personalization/business_profile/model/business_model.dart';
import 'package:joha_test/features/repository/business_profile_repository/business_profile.dart';

class BusinessController extends GetxController {
  static BusinessController get instance => Get.find();
  late TextEditingController group;
  late TextEditingController otherGroup;
  late TextEditingController newGroup;
  late TextEditingController condition;
  late TextEditingController additionalNote;
  late TextEditingController add;
  late TextEditingController type;

  var isAdditionalClicked = false.obs;

  updateAddition() {
    isAdditionalClicked.value = !isAdditionalClicked.value;
    update();
  }

  FormFieldValidator<String?> dropdownValidator = (value) {
    if (value == null || value.isEmpty) {
      return 'Please select an item';
    }

    return null; // Return null if the value is valid
  };

  List<String> severity = ['Easy', 'Medium', 'Hard'];
  updateSeverity(dynamic value) {
    selectedS = value;
    update();
  }

  String? selectedS;

  var selectedBusinessImagePath = ''.obs;

  getImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      selectedBusinessImagePath.value = pickedImage.path;
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
    update();
  }

  void createBusinessProfile(BusinessProfileModel model) async {
    await Get.put(BusinessProfileRepo()).createPersonalProfile(model);
    // Get.to(() => BusinessProfilePage());
  }

  @override
  void onInit() {
    group = TextEditingController();
    otherGroup = TextEditingController();
    newGroup = TextEditingController();
    condition = TextEditingController();
    additionalNote = TextEditingController();
    add = TextEditingController();
    type = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    group.dispose();
    otherGroup.dispose();
    newGroup.dispose();
    super.dispose();
  }
}
