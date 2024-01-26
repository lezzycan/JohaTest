// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joha_test/common/jspacing.dart';
import 'package:joha_test/common/picture_row.dart';
import 'package:joha_test/features/personalization/personal_profile/controller/personal_profile_controller.dart';
import 'package:joha_test/features/personalization/personal_profile/widget/personal_form.dart';
import 'package:joha_test/utils/constants/colors.dart';
import 'package:joha_test/utils/constants/sizes.dart';
import 'package:joha_test/utils/constants/text_strings.dart';

class PersonalProfilePage extends StatelessWidget {
  PersonalProfilePage({super.key});
  Widget placeholder = Image.asset(
    "assets/images/loading.gif",
    fit: BoxFit.cover,
  );
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PersonalProfileController());
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.west)),
          title: Text(JTexts.personalPageTitle,
              style: TextStyle(
                color: JColors.textPrimaryColor,
                fontSize: JSizes.medium.sp,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w500,
              ))),
      body: GetBuilder<PersonalProfileController>(
        builder:(controller)=> Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: JSizes.medium, vertical: JSizes.big),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  JTexts.updatePhotoAndDetails,
                  style: TextStyle(
                    color: Color(0xFF2B2A29),
                    fontSize: JSizes.medium,
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const JSpacing.mediumHeight(),
                PictureRow(file: PersonalProfileController
                            .instance.selectedImagePath.value,),
                JSpacing.height(15.h),
                // PersonalFormWidget()
                PersonalFormWidget(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

