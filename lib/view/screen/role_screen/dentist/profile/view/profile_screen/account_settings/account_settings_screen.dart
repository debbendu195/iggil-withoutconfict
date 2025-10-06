import 'package:event_platform/core/app_routes/app_routes.dart';
import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(
        leftIcon: true,
        titleName: 'accountSettings'.tr,
        color: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.changePassScreen);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    CustomText(
                      text: 'changePassword'.tr,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.termsServicesScreen);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    CustomText(
                      text: 'termsOfServices'.tr,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.privacyScreen);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    CustomText(
                      text: 'privacyPolicy'.tr,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.aboutScreen);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    CustomText(
                      text: 'aboutUs'.tr,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    CustomText(
                      text: 'deleteAccount'.tr,
                      color: AppColors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
