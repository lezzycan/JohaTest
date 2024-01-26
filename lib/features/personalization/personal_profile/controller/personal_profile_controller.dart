import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:joha_test/features/personalization/personal_profile/model/user_model.dart';
import 'package:joha_test/features/personalization/personal_profile/model/city_model.dart';
import 'package:joha_test/features/personalization/personal_profile/model/country_model.dart';
import 'package:joha_test/features/personalization/personal_profile/model/state_model.dart';

import 'package:joha_test/features/repository/personal_profile_repository/personal_profile_respository.dart';



class PersonalProfileController extends GetxController {
  static PersonalProfileController get instance => Get.find();

  String formattedDate = DateFormat('MM/dd/yyyy').format(DateTime.now());
  late TextEditingController country;
  late TextEditingController state;
  late TextEditingController city;
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController dob;
  late TextEditingController address;
  late TextEditingController email;
  late TextEditingController phone;

  List<CountryModel> countryList = [];
  final List<StateModel> stateList = [];
  final List<CityModel> cityList = [];

  List<CountryModel> countrySubList = [];
  List<StateModel> stateSubList = [];
  List<CityModel> citySubList = [];

  List<String> gender = ['Male', 'Female', 'Others'];

  String? selectedGender;

  updateGender(dynamic value) {
    selectedGender = value;
    update();
  }

  Future<void> getCountry() async {
    countryList.clear();
    var jsonString = await rootBundle.loadString('assets/json/country.json');
    List<dynamic> body = json.decode(jsonString);

    countryList =
        body.map((dynamic item) => CountryModel.fromJson(item)).toList();
    countrySubList = countryList;
    update();
  }

  Future<void> getState(String countryId) async {
    stateList.clear();
    cityList.clear();
    List<StateModel> subStateList = [];
    var jsonString = await rootBundle.loadString('assets/json/state.json');
    List<dynamic> body = json.decode(jsonString);

    subStateList =
        body.map((dynamic item) => StateModel.fromJson(item)).toList();
    for (var element in subStateList) {
      if (element.countryId == countryId) {
        stateList.add(element);
        update();
      }
    }
    stateSubList = stateList;
    update();
  }

  Future<void> getCity(String stateId) async {
    cityList.clear();
    List<CityModel> subCityList = [];
    var jsonString = await rootBundle.loadString('assets/json/city.json');
    List<dynamic> body = json.decode(jsonString);

    subCityList = body.map((dynamic item) => CityModel.fromJson(item)).toList();
    for (var element in subCityList) {
      if (element.stateId == stateId) {
        cityList.add(element);
        update();
      }
    }
    citySubList = cityList;
    update();
  }

  void updateDate(BuildContext context, TextEditingController ctl) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: (DateTime(2000)),
        lastDate: DateTime(2100));
    if (pickedDate != null) {
      ctl.text = DateFormat('yyyy/MM/dd').format(pickedDate);
    }
    update();
  }

  FormFieldValidator<String?> dropdownValidator = (value) {
    if (value == null || value.isEmpty) {
      return 'Please select an item';
    }

    return null; // Return null if the value is valid
  };

  void createPersonalProfile(UserModel user) async {
    await Get.put(PersonalProfileRepository()).createPersonalProfile(user);
    
  }

  getUserData() async {
    await Get.put(PersonalProfileRepository()).getPersonalProfileDetails();
  }

  @override
  void onInit() {
    getCountry();
    country = TextEditingController();
    city = TextEditingController();
    state = TextEditingController();
    firstName = TextEditingController();
    lastName = TextEditingController();
    dob = TextEditingController();
    address = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    dob.dispose();
    address.dispose();
    email.dispose();
    phone.dispose();
    super.dispose();
  }

  void attemptSelectImage(BuildContext context, Widget widget) {
    showDialog(
      context: context,
      builder: (context) {
        return widget;
      },
    );
  }

  var selectedImagePath = ''.obs;

  getImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      selectedImagePath.value = pickedImage.path;
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
    update();
  }

 
}
