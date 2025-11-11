import 'package:event_platform/core/app_routes/app_routes.dart';
import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_button/custom_button.dart';
import 'package:event_platform/view/components/custom_from_card/custom_from_card.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/custom_loader/custom_loader.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'welcomeBack'.tr,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 8),
                  CustomText(
                    text: 'pleaseEnterYourPersonalData'.tr,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  const SizedBox(height: 40),
                  CustomFormCard(
                    title: 'email'.tr,
                    controller: controller.emailController.value,
                    hintText: 'enterYourEmail'.tr,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email Field Cant Be Empty'.tr;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  CustomFormCard(
                    title: 'password'.tr,
                    controller: controller.passwordController.value,
                    hintText: 'passwordHint'.tr,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password Field Cant Be Empty'.tr;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
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
                  const SizedBox(height: 50),
                  Obx(() {
                    return controller.loginLoading.value
                        ? const CustomLoader()
                        : CustomButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          controller.loginUser();
                        }
                      },
                      title: 'login'.tr,
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
