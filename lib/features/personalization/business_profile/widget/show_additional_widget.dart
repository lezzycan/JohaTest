import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joha_test/common/dropdown_field.dart';
import 'package:joha_test/common/jspacing.dart';
import 'package:joha_test/common/textfiled.dart';
import 'package:joha_test/features/personalization/business_profile/controller/business_profile_controller.dart';
import 'package:joha_test/features/personalization/personal_profile/widget/personal_form.dart';
import 'package:joha_test/utils/validation/validation.dart';

class showAdditionalWidget extends StatelessWidget {
  const showAdditionalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BusinessController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Other Condition(s)',
          style: TextStyle(
            color: const Color(0xFF114FF5),
            fontSize: 12.sp,
            fontFamily: 'Work Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
        JSpacing.height(10.h),
        const FormLabel(label: 'Type'),
           JSpacing.height(10.h),
        JTextFieldWidget(
          hintText: 'Enter',
          controller: controller.type,
          validator: context.validateFieldNotEmpty,
        ),
        JSpacing.height(10.h),
        const FormLabel(label: 'Severity'),
         ReusableDropDownWidget(
          value: controller.selectedS,
          hint: 'Select',
          onChanged: controller.updateSeverity,
          validator: controller.dropdownValidator,
          items: controller.severity.map((value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        JSpacing.height(10.h),
         const FormLabel(label: 'Additonal Note'),
          JSpacing.height(15.h),
        JTextFieldWidget(
          hintText: 'Enter',
          controller: controller.add,
          maxLines: 5,
          maxLength: 300,
        ),
      ],
    );
  }
}
