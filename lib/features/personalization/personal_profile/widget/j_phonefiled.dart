import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:joha_test/features/personalization/personal_profile/controller/personal_profile_controller.dart';

class JPhoneField extends StatelessWidget {
  const JPhoneField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      // focusNode: contrl.phoneFocusNode,
      //validator: context.validatePhoneNumber,
      textInputAction: TextInputAction.done,
      invalidNumberMessage: 'Enter a valid phone number',
      pickerDialogStyle: PickerDialogStyle(
        backgroundColor: Colors.grey,
        countryCodeStyle: const TextStyle(
            color: Color(0XFF49454F),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400),
        countryNameStyle: const TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400),
      ),
      cursorColor: const Color(0XFF49454F),
      dropdownTextStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14.sp,
          color: const Color(0XFF49454F)),
      flagsButtonMargin: const EdgeInsets.only(left: 5),
       controller: PersonalProfileController.instance.phone,
      disableLengthCheck: true,
      initialCountryCode: 'NG',
      decoration: InputDecoration(
        // labelText: 'Phone Number',
    
        errorText: '',
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.0,
            color: Color(0xFF667398),
          ),
          borderRadius: BorderRadius.circular(4.r),
        ),
        focusColor: const Color(0xFF667398),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide:
                const BorderSide(width: 1.0, color: Color(0xFF667398))),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        labelStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12.sp,
            color: const Color(0xFF667398)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide:
                const BorderSide(width: 1.0, color: Color(0xFF667398))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide:
                const BorderSide(width: 1.0, color: Color(0xFF667398))),
        enabled: true,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide:
                const BorderSide(width: 1.0, color: Color(0xFF667398))),
      ),
      languageCode: "en",
      dropdownIcon: const Icon(Icons.expand_more_outlined),
      dropdownIconPosition: IconPosition.trailing,
      onChanged: (number) {
        //model.countryChanged(number);
      },
    
      // onChanged: (phone) {
      //   print(phone.completeNumber);
      // },
      onCountryChanged: (country) {
        debugPrint('Country changed to: ${country.name}');
      },
    );
  }
}
