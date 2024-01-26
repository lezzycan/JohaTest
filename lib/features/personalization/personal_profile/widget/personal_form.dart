import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joha_test/common/custom_button.dart';
import 'package:joha_test/common/dropdown_field.dart';
import 'package:joha_test/common/jspacing.dart';
import 'package:joha_test/common/textfiled.dart';
import 'package:joha_test/features/personalization/personal_profile/model/user_model.dart';
import 'package:joha_test/features/personalization/personal_profile/controller/personal_profile_controller.dart';
import 'package:joha_test/features/personalization/personal_profile/widget/country_state_city_picker.dart';
import 'package:joha_test/features/personalization/personal_profile/widget/j_phonefiled.dart';
import 'package:joha_test/utils/constants/colors.dart';
import 'package:joha_test/utils/constants/text_strings.dart';
import 'package:joha_test/utils/validation/validation.dart';

class PersonalFormWidget extends StatelessWidget {
  PersonalFormWidget({
    super.key,
    required this.controller,
  });

  final PersonalProfileController controller;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormLabel(label: JTexts.firstName),
                      JSpacing.height(10.h),
                      JTextFieldWidget(
                        hintText: 'Enter',
                        controller: controller.firstName,
                        validator: context.validateFieldNotEmpty,
                      )
                    ],
                  ),
                ),
                const JSpacing.mediumWidth(),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FormLabel(label: JTexts.lastName),
                    JSpacing.height(10.h),
                    JTextFieldWidget(
                      hintText: 'Enter',
                      controller: controller.lastName,
                      validator: context.validateFieldNotEmpty,
                    )
                  ],
                )),
              ],
            ),
            JSpacing.height(15.h),
            const FormLabel(
              label: 'Phone Number',
            ),
            JSpacing.height(10.h),
            const JPhoneField(),
            //JSpacing.height(10.h),
            const FormLabel(
              label: 'Email',
            ),
            JSpacing.height(10.h),
            JTextFieldWidget(
              hintText: 'Enter',
              controller: controller.email,
              validator: context.validateEmailAddress,
            ),
            JSpacing.height(15.h),
            // const Countries()
            const CountryStateCityPicker(),
            JSpacing.height(15.h),
            const FormLabel(
              label: 'Address',
            ),
            JSpacing.height(10.h),
            JTextFieldWidget(
              hintText: 'Enter',
              controller: controller.address,
              validator: context.validateFieldNotEmpty,
            ),
            JSpacing.height(15.h),
            const FormLabel(
              label: 'Date Of Birth',
            ),
            JSpacing.height(10.h),
            JTextFieldWidget(
                controller: controller.dob,
                suffixIcon: const Icon(
                  Icons.calendar_today,
                  color: JColors.primaryColor,
                ),
                hintText: 'DD/MM/YY',
                //labelText: formattedDate,
                validator: context.validateFieldNotEmpty,
                onTap: () => controller.updateDate(context, controller.dob)),
            JSpacing.height(15.h),
            const FormLabel(
              label: 'Gender',
            ),
            JSpacing.height(10.h),
            ReusableDropDownWidget(
              value: controller.selectedGender,
              hint: 'Select',
              onChanged: controller.updateGender,
              validator: controller.dropdownValidator,
              items: controller.gender.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const JSpacing.bigHeight(),
            CustomButton(
                widget: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    UserModel users = UserModel(
                        firstName: controller.firstName.text,
                        lastName: controller.lastName.text,
                        country: controller.country.text,
                        state: controller.state.text,
                        address: controller.address.text,
                        dob: controller.dob.text,
                        gender: controller.selectedGender!,
                        //  image: File(controller.selectedImagePath.value),
                        email: controller.email.text,
                        phoneNo: controller.phone.text,
                        city: controller.city.text);

                    controller.createPersonalProfile(users);
                    // await controller.saveData();
                    controller.update();
                  }
                }),
            const JSpacing.bigHeight(),
          ],
        ));
  }
}

class FormLabel extends StatelessWidget {
  const FormLabel({
    super.key,
    required this.label,
    this.colorText,
    this.addText,
  });
  final String label;
  final Color? colorText;
  final String? addText;
  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: label,
        style: TextStyle(
          color: const Color(0xFF2B2A29),
          fontSize: 14.sp,
          fontFamily: 'Work Sans',
          fontWeight: FontWeight.w500,
        ),
      ),
      TextSpan(
        text: addText ?? '',
        style: TextStyle(
          color: const Color(0xFF667398),
          fontSize: 12.sp,
          fontFamily: 'Work Sans',
          fontWeight: FontWeight.w400,
        ),
      )
    ]));
  }
}
