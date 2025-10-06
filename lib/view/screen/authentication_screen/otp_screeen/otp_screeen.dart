import 'package:event_platform/utils/app_strings/app_strings.dart';
import 'package:event_platform/view/components/custom_pin_code/custom_pin_code.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_text/custom_text.dart';

class OtpScreeen extends StatelessWidget {
  const OtpScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: AppStrings.verifyOTP, fontWeight: FontWeight.w600, fontSize: 32, color: AppColors.primary,),
              SizedBox(height: 16,),
              CustomText(text: AppStrings.checkYourEmail,fontWeight: FontWeight.w400, fontSize: 16, maxLines: 2, textAlign: TextAlign.start,),
              SizedBox(height: 24,),
              CustomPinCode(controller: TextEditingController()),
              Row(
                children: [
                  CustomText(text: AppStrings.didntreceiveCode, fontWeight: FontWeight.w400, fontSize: 16,),
                  Spacer(),
                  CustomText(text: AppStrings.resendCode, fontWeight: FontWeight.w400, fontSize: 16, color: AppColors.primary,),
                ],
              ),
              SizedBox(height: 40,),
              CustomButton(onTap: (){
                Get.toNamed(AppRoutes.forgotScreen);
              }, title: AppStrings.verify, fontWeight: FontWeight.w600, fontSize: 16,)
            ],
          ),
        ),
      ),
    );
  }
}
