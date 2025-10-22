import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../../../utils/app_const/app_const.dart';
import '../../../../../../../components/custom_loader/custom_loader.dart';
import '../../../../../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../../../../components/general_error.dart';
import '../controller/profile_controller.dart';

class PrivacyScreen extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());
  PrivacyScreen({super.key}) {
    profileController.getPrivacyPolicy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomRoyelAppbar(
          leftIcon: true,
          titleName: 'privacyPolicy'.tr,
          color: AppColors.primary,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Obx(() {
                  switch (profileController.rxTermsStatus.value) {
                    case Status.loading:
                      return Center(
                        child: CustomLoader(),
                      );
                    case Status.internetError:
                      return Center(
                        child: CustomLoader(),
                      );
                    case Status.error:
                      return GeneralErrorScreen(
                          onTap: () => profileController.getTermsConditions());
                    case Status.completed:
                      return Column(
                        children: [
                          HtmlWidget(
                            profileController
                                    .privacyModel.value.privacyPolicy ??
                                'Privacy Policy is empty',
                            textStyle: TextStyle(
                              color: AppColors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      );
                  }
                }),
              ),
            )
        )
    );
  }
}
