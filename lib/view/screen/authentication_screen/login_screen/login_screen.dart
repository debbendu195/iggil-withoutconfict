import 'package:event_platform/core/app_routes/app_routes.dart';
import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_button/custom_button.dart';
import 'package:event_platform/view/components/custom_from_card/custom_from_card.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'Welcome !', fontSize: 32, fontWeight: FontWeight.w600, color: AppColors.primary,),
              SizedBox(height: 8),
              CustomText(text: 'Please Enter Your Personal Data', fontWeight: FontWeight.w400, fontSize: 16,),
              SizedBox(height: 40),
              CustomFormCard(title: 'E-mail', controller: TextEditingController(), hintText: 'debbendupaul195@gmail.com',),
              SizedBox(height: 24),
              CustomFormCard(title: 'Password', controller: TextEditingController(), hintText: '************', isPassword: true,),
              SizedBox(height: 24),
              InkWell(onTap: (){Get.toNamed(AppRoutes.forgotScreen);}, child: CustomText(text: 'Forgot Password?', fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.primary,)),
              SizedBox(height: 50),
              CustomButton(onTap: (){
                Get.toNamed(AppRoutes.emailVerify);
              },
              title: 'Log in',)
            ],
          ),
        ),
      ),
    );
  }
}
