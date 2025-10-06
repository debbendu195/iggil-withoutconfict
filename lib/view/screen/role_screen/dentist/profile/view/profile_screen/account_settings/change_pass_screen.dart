import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_button/custom_button.dart';
import 'package:event_platform/view/components/custom_from_card/custom_from_card.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassScreen extends StatelessWidget {
  const ChangePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(
        leftIcon: true,
        titleName: 'changePassword'.tr,
        color: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CustomFormCard(
              title: 'currentPassword'.tr,
              hintText: 'passwordHint'.tr,
              isPassword: true,
              controller: TextEditingController(),
            ),
            CustomFormCard(
              title: 'newPassword'.tr,
              hintText: 'passwordHint'.tr,
              isPassword: true,
              controller: TextEditingController(),
            ),
            CustomFormCard(
              title: 'confirmPassword'.tr,
              hintText: 'passwordHint'.tr,
              isPassword: true,
              controller: TextEditingController(),
            ),
            CustomButton(
              onTap: () {},
              title: 'updatePassword'.tr,
              borderRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
