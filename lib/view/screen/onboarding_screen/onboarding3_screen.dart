import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../components/custom_button/custom_button.dart';
import '../../components/custom_image/custom_image.dart';
import '../../components/custom_text/custom_text.dart';

class Onboarding3Screen extends StatelessWidget {
  const Onboarding3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: CustomImage(
              imageSrc: AppImages.onboarding3,
              height: 342,
              width: 320,
            )),
            CustomText(
              text: 'Quick Media Sharing',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
            SizedBox(
              height: 16,
            ),
            CustomText(
              text: 'Record short videos or voice notes and send instantly.',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
              maxLines: 2,
            ),
            SizedBox(
              height: 11,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    color: AppColors.grey1,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    color: AppColors.grey1,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.loginScreen);
              },
              title: 'Next',
              fontWeight: FontWeight.w600, fontSize: 16,
            ),
            TextButton(
                onPressed: () {},
                child: CustomText(
                  text: 'Sign in',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.primary,
                )),
            TextButton(
                onPressed: () {},
                child: CustomText(
                  text: 'Skip',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.grey,
                )),
          ],
        ),
      ),
    ));
  }
}
