import 'package:get/get.dart';

import '../../view/screen/onboarding_screen/controller/onboarding_controller.dart';
import '../../view/screen/role_screen/dentist/my_case/controller/case_controller.dart';
import '../../view/screen/role_screen/dentist/profile/view/profile_screen/controller/language_controller.dart';
class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    ///==========================Default Custom Controller ==================
     Get.lazyPut(() => OnboardingController(), fenix: true);
     Get.lazyPut(() => CaseController(), fenix: true);
     Get.lazyPut(() => LanguageController(), fenix: true);


  }
}
