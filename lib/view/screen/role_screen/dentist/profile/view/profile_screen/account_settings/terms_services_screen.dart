import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TermsServicesScreen extends StatelessWidget {
  const TermsServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(
        leftIcon: true,
        titleName: 'termsOfServices'.tr,
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
