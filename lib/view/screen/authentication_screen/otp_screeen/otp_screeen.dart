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
              CustomText(text: 'Verify OTP', fontWeight: FontWeight.w600, fontSize: 32, color: AppColors.primary,),
              SizedBox(height: 16,),
              CustomText(text: 'Please check your email. We have sent a code to contact @gmail.com',fontWeight: FontWeight.w400, fontSize: 16, maxLines: 2, textAlign: TextAlign.start,),
              SizedBox(height: 24,),
              CustomPinCode(controller: TextEditingController()),
              Row(
                children: [
                  CustomText(text: 'Didn’t receive code?', fontWeight: FontWeight.w400, fontSize: 16,),
                  Spacer(),
                  CustomText(text: 'Resend code', fontWeight: FontWeight.w400, fontSize: 16, color: AppColors.primary,),
                ],
              ),
              SizedBox(height: 40,),
              CustomButton(onTap: (){
                Get.toNamed(AppRoutes.forgotScreen);
              }, title: 'Verify', fontWeight: FontWeight.w600, fontSize: 16,)
            ],
          ),
        ),
      ),
    );
  }
}
