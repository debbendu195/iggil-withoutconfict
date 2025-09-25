import 'package:event_platform/core/app_routes/app_routes.dart';
import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabManagerAccountSettingsScreen extends StatelessWidget {
  const LabManagerAccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true, titleName: 'Account Settings', color: AppColors.primary,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.labManagerChangePassScreen);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    CustomText(text: 'Change Password', fontSize: 14, fontWeight: FontWeight.w400,),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.labManagerTermsServicesScreen);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    CustomText(text: 'Terms of services', fontSize: 14, fontWeight: FontWeight.w400,),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.labManagerPrivacyScreen);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    CustomText(text: 'Privacy Policy', fontSize: 14, fontWeight: FontWeight.w400,),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.labManagerAboutScreen);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    CustomText(text: 'About us', fontSize: 14, fontWeight: FontWeight.w400,),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    CustomText(text: 'Delete Account', color: AppColors.red, fontSize: 14, fontWeight: FontWeight.w400,),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_right)
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