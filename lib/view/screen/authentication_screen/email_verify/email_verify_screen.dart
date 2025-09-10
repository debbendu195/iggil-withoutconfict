import 'package:event_platform/core/app_routes/app_routes.dart';
import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_button/custom_button.dart';
import 'package:event_platform/view/components/custom_from_card/custom_from_card.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerifyScreen extends StatelessWidget {
  const EmailVerifyScreen({super.key});

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
            CustomText(text: 'Email Confirmation', fontWeight: FontWeight.w600, fontSize: 32, color: AppColors.primary,),
            SizedBox(height: 16,),
            CustomText(text: 'Enter Your email for verification', fontWeight: FontWeight.w400, fontSize: 16,),
            SizedBox(height: 16,),
            CustomFormCard(title: 'E-mail', controller: TextEditingController(), hintText: 'Type your email',),
            SizedBox(height: 40,),
            CustomButton(onTap: (){
              Get.toNamed(AppRoutes.otpScreeen);
            }, title: 'Send verification Code', fontWeight: FontWeight.w600, fontSize: 16,)
          ],
        ),
      ),
    );
  }
}
