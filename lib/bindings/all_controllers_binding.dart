import 'package:get/instance_manager.dart';
import 'package:joha_test/features/personalization/business_profile/controller/business_profile_controller.dart';
import 'package:joha_test/features/personalization/personal_profile/controller/personal_profile_controller.dart';

class AllControllersBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalProfileController());
    Get.lazyPut(() => BusinessController());
    // TODO: implement dependencies
  }
}
