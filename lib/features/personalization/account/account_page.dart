import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joha_test/common/jspacing.dart';
import 'package:joha_test/features/personalization/account/widget/account_appBar.dart';
import 'package:joha_test/features/personalization/account/widget/account_listtile_widget.dart';
import 'package:joha_test/features/personalization/business_profile/business_profile.dart';
import 'package:joha_test/features/personalization/personal_profile/personal_profile.dart';
import 'package:joha_test/utils/constants/colors.dart';
import 'package:joha_test/utils/constants/sizes.dart';
import 'package:joha_test/utils/constants/text_strings.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AccountAppBar(),
            const JSpacing.xLargeHeight(),
            AccountListTileWidget(
              contColor: JColors.personIconContainerColor,
              color: JColors.personIconColor,
              text: JTexts.personalPageTitle,
              onTap: () => Get.to(() => PersonalProfilePage()),
              icon: Icons.person,
            ),
            const JSpacing.mediumHeight(),
            AccountListTileWidget(
              contColor: JColors.containerPrimaryColor,
              color: JColors.businessProfileColor,
              text: JTexts.businessPageTitle,
              onTap: () => Get.to(() =>  BusinessProfilePage()),
              icon: Icons.health_and_safety,
            ),
            const JSpacing.xxLargeHeight(),
            AccountListTileWidget(
              contColor: JColors.containerPrimaryColor,
              color: JColors.businessProfileColor,
              text: JTexts.signOut,
              onTap: () {},
              icon: Icons.login,
            ),
          ],
        ),
      ),
    );
  }
}
