import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:joha_test/bindings/all_controllers_binding.dart';
import 'package:joha_test/features/personalization/account/account_page.dart';

class JoraApp extends StatelessWidget {
  const JoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AllControllersBindings(),
      title: 'Joha Test',
      home: const AccountScreen(),
      builder:   EasyLoading.init()
    );
  }
}
