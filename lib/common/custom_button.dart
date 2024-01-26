import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joha_test/utils/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.widget, required this.onPressed});
  final Widget widget;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              backgroundColor: JColors.primaryColor),
          onPressed: onPressed,
          child: widget),
    );
  }
}
