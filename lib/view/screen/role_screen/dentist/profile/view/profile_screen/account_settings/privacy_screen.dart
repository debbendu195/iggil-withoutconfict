import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // ✅ localization এর জন্য যোগ করা হয়েছে

import '../../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../../../utils/app_strings/app_strings.dart';
import '../../../../../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../../../../components/custom_text/custom_text.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(
        leftIcon: true,
        titleName: 'privacyPolicy'.tr,
        color: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: CustomText(
          text: 'termsText'.tr,
          fontSize: 16.w,
          fontWeight: FontWeight.w400,
          maxLines: 10,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
