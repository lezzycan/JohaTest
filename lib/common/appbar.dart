import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joha_test/utils/constants/sizes.dart';


class JAppBar extends StatelessWidget implements PreferredSizeWidget {
  const JAppBar({super.key,  this.showBackArrow = false, this.title, this.leadingIcon, this.actions, this.leadingOnPress});
  
  final bool showBackArrow;
  final Widget? title;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: JSizes.medium.w),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow 
        ? IconButton(onPressed: () => Get.back(), icon:  Icon(
          Platform.isAndroid ? Icons.west : Icons.arrow_back_ios
          )) 
        : leadingIcon !=null ? IconButton(onPressed: leadingOnPress, icon: Icon(leadingIcon))  : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  
  Size get preferredSize => throw UnimplementedError();
}
