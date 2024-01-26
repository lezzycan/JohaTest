import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joha_test/common/appbar.dart';
import 'package:joha_test/common/jspacing.dart';
import 'package:joha_test/features/personalization/account/widget/account_notification_widget.dart';
import 'package:joha_test/utils/constants/colors.dart';
import 'package:joha_test/utils/constants/sizes.dart';
import 'package:joha_test/utils/constants/text_strings.dart';

class AccountAppBar extends StatelessWidget {
  const AccountAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return JAppBar(
      leadingIcon: Icons.menu_outlined,
      title: Text(
        JTexts.accountPageTitle,
        style: textTheme.headlineSmall?.copyWith(
            fontSize: JSizes.medium.sp,
            fontFamily: 'Work Sans',
            fontWeight: FontWeight.w500,
            color: JColors.textPrimaryColor),
      ),
      actions:  [
        const AccountNotificationWidget(),
        const JSpacing.smallWidth(),

        Container(
            width: 30.w,
            height: 30.w,
            alignment: Alignment.center,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: OvalBorder(
                side: BorderSide(width: 0.50, color: Color(0xFFC2C7D6)),
              ),
            ),
            child: const Icon(Icons.shopping_cart),
          ),

      ],
    );
  }
}

