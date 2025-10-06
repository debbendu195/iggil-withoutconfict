import 'package:event_platform/utils/app_strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_from_card/custom_from_card.dart';
import '../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../components/custom_text/custom_text.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text: AppStrings.setANewPassword, fontWeight: FontWeight.w600, fontSize: 32, color: AppColors.primary,),
            SizedBox(height: 16,),
            CustomFormCard(title: AppStrings.newPassword, controller: TextEditingController(), hintText: AppStrings.passwordHint, isPassword: true,),
            SizedBox(height: 16,),
            CustomFormCard(title: AppStrings.confirmPassword, controller: TextEditingController(), hintText: AppStrings.passwordHint, isPassword: true,),
            SizedBox(height: 40,),
            CustomButton(onTap: (){
              Get.toNamed(AppRoutes.loginScreen);
            }, title: AppStrings.updatePassword, fontWeight: FontWeight.w600, fontSize: 16,)
          ],
        ),
      ),
    );
  }
}
