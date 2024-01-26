import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:joha_test/features/personalization/business_profile/controller/business_profile_controller.dart';
import 'package:joha_test/features/personalization/personal_profile/controller/personal_profile_controller.dart';
import 'package:joha_test/utils/constants/text_strings.dart';

class PictureRow extends StatelessWidget {
  const PictureRow({
    super.key, required this.file,
  });

  final String file;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonalProfileController>(
      builder: (controller) => Row(
        children: [
          Container(
            height: 80.w,
            width: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: PersonalProfileController
                        .instance.selectedImagePath.value ==
                    null 
                ? Image.asset(
                    "assets/images/Avatar.png",
                    fit: BoxFit.fill,
                    height: 120.w,
                    width: 120.w,
                  )
               
                : Image.file(
                    File(file),
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
                        borderRadius: BorderRadius.all(Radius.circular(10))),
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
    );
  }
}
