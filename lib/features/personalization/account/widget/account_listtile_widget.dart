import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joha_test/utils/constants/colors.dart';
import 'package:joha_test/utils/constants/sizes.dart';

class AccountListTileWidget extends StatelessWidget {
  const AccountListTileWidget({
    super.key,
    required this.onTap,
    required this.contColor,
    required this.color,
    required this.text, required this.icon,
  });
  final VoidCallback onTap;
  final Color contColor;
  final Color color;
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: JSizes.medium),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: Container(
            width: 30.w,
            height: 30.w,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: contColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            child: Icon(
             icon,
              color: color,
            ),
          ),
          title: Text(
            text,
            style: TextStyle(
              color: JColors.textPrimaryColor,
              fontSize: JSizes.medium.sp,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: JColors.textPrimaryColor,
            size: JSizes.medium,
          ),
        ),
      ),
    );
  }
}
