import 'package:event_platform/core/app_routes/app_routes.dart';
import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_button/custom_button.dart';
import 'package:event_platform/view/components/custom_from_card/custom_from_card.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'welcomeBack'.tr,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
                SizedBox(height: 8),
                CustomText(
                  text: 'pleaseEnterYourPersonalData'.tr,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                SizedBox(height: 40),
                CustomFormCard(
                  title: 'email'.tr,
                  controller: TextEditingController(),
                  hintText: 'enterYourEmail'.tr,
                ),
                SizedBox(height: 24),
                CustomFormCard(
                  title: 'password'.tr,
                  controller: TextEditingController(),
                  hintText: 'passwordHint'.tr,
                  isPassword: true,
                ),
                SizedBox(height: 24),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.emailVerify);
                  },
                  child: CustomText(
                    text: 'forgetPassword'.tr,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 50),
                CustomButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.demo);
                  },
                  title: 'login'.tr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
