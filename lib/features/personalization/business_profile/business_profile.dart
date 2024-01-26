import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:joha_test/common/custom_button.dart';
import 'package:joha_test/common/jspacing.dart';
import 'package:joha_test/common/picture_row.dart';
import 'package:joha_test/common/textfiled.dart';
import 'package:joha_test/features/personalization/business_profile/controller/business_profile_controller.dart';
import 'package:joha_test/features/personalization/business_profile/model/business_model.dart';
import 'package:joha_test/features/personalization/business_profile/widget/show_additional_widget.dart';
import 'package:joha_test/features/personalization/personal_profile/controller/personal_profile_controller.dart';
import 'package:joha_test/features/personalization/personal_profile/widget/personal_form.dart';
import 'package:joha_test/utils/constants/colors.dart';
import 'package:joha_test/utils/constants/sizes.dart';
import 'package:joha_test/utils/constants/text_strings.dart';
import 'package:joha_test/utils/validation/validation.dart';

class BusinessProfilePage extends StatelessWidget {
  BusinessProfilePage({super.key});

  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BusinessController());
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.west)),
          title: Text(JTexts.businessPageTitle,
              style: TextStyle(
                color: JColors.textPrimaryColor,
                fontSize: JSizes.medium.sp,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w500,
              ))),
      body: GetBuilder<BusinessController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: JSizes.medium, vertical: JSizes.big),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  JTexts.updateBusinessPhotoAndDetails,
                  style: TextStyle(
                    color: Color(0xFF2B2A29),
                    fontSize: JSizes.medium,
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const JSpacing.mediumHeight(),
                Row(
                  children: [
                    Container(
                      height: 80.w,
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: controller.selectedBusinessImagePath.value == null
                          ? Image.asset(
                              "assets/images/Avatar.png",
                              fit: BoxFit.fill,
                              height: 120.w,
                              width: 120.w,
                            )
                          : Image.file(
                              File(controller.selectedBusinessImagePath.value),
                              height: 120.w,
                              width: 120.w,
                              fit: BoxFit.cover,
                            ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        PersonalProfileController.instance.attemptSelectImage(
                            context,
                            SimpleDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              title: Text(
                                "Select Option",
                                style: TextStyle(fontSize: 12.sp),
                              ),
                              children: <Widget>[
                                SimpleDialogOption(
                                    child: Row(
                                      children: <Widget>[
                                        const VerticalDivider(),
                                        Text(
                                          "Take a Photo",
                                          style: TextStyle(fontSize: 12.sp),
                                        )
                                      ],
                                    ),
                                    onPressed: () {
                                      controller.getImage(ImageSource.camera);
                                      controller.update();
                                    }),
                                SimpleDialogOption(
                                  child: Row(
                                    children: <Widget>[
                                      const VerticalDivider(),
                                      Text(
                                        "Choose from Gallery",
                                        style: TextStyle(fontSize: 12.sp),
                                      )
                                    ],
                                  ),
                                  onPressed: () {
                                    controller.getImage(ImageSource.gallery);
                                    controller.update();
                                    Get.back(closeOverlays: true);
                                  },
                                ),
                              ],
                            ));
                      },
                      child: Text(
                        JTexts.uploadPhoto,
                        style: TextStyle(
                          color: const Color(0xFF9B51E0),
                          fontSize: 14.sp,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const JSpacing.mediumHeight(),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormLabel(label: 'Group'),
                      JSpacing.height(10.h),
                      JTextFieldWidget(
                        hintText: 'Enter',
                        controller: controller.group,
                        validator: context.validateFieldNotEmpty,
                      ),
                      JSpacing.height(15.h),
                      const FormLabel(addText: '(Optional)', label: ''),
                      JSpacing.height(10.h),
                      JTextFieldWidget(
                        hintText: 'Enter',
                        controller: controller.otherGroup,
                      ),
                      JSpacing.height(15.h),
                      const FormLabel(label: 'New', addText: '(Optional)'),
                      JSpacing.height(10.h),
                      JTextFieldWidget(
                        hintText: 'Enter',
                        controller: controller.newGroup,
                      ),
                      JSpacing.height(10.h),
                      const Divider(
                        color: Color(0xFFE0E0E0),
                      ),
                      const JSpacing.xLargeHeight(),
                      Text(
                        'Current Condition(s)',
                        style: TextStyle(
                          color: const Color(0xFF114FF5),
                          fontSize: 14.sp,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      JSpacing.height(15.h),
                      const FormLabel(label: 'Condition Name'),
                      JSpacing.height(10.h),
                      JTextFieldWidget(
                        hintText: 'Enter',
                        controller: controller.condition,
                        validator: context.validateFieldNotEmpty,
                      ),
                      JSpacing.height(15.h),
                      const FormLabel(label: 'Additonal Note'),
                      JSpacing.height(10.h),
                      JTextFieldWidget(
                        hintText: 'Enter',
                        controller: controller.additionalNote,
                        maxLines: 5,
                        maxLength: 300,
                      ),
                      JSpacing.height(15.h),
                      InkWell(
                        onTap: () {
                          controller.updateAddition();
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.add,
                              color: Color(0xFF602BD1),
                            ),
                            Text(
                              'Add Condition',
                              style: TextStyle(
                                color: const Color(0xFF602BD1),
                                fontSize: 14.sp,
                                fontFamily: 'Work Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Color(0xFFE0E0E0),
                      ),
                      JSpacing.height(15.h),
                      controller.isAdditionalClicked.value
                          ? const showAdditionalWidget()
                          : const SizedBox.shrink(),
                      JSpacing.height(25.h),
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
                          onPressed: () {
                            if (_form.currentState!.validate()) {
                              BusinessProfileModel model = BusinessProfileModel(
                                  group: controller.group.text,
                                  otherGroup: controller.otherGroup.text,
                                  newGroup: controller.newGroup.text,
                                  condition: controller.condition.text,
                                  additionalNote:
                                      controller.additionalNote.text,
                                  type: controller.type.text,
                                  severity: controller.selectedS!,
                                  addAdd: controller.add.text);
                              controller.createBusinessProfile(model);
                              controller.update();
                            }
                          }),
                      const JSpacing.bigHeight(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
