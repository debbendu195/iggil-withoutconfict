import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsServicesScreen extends StatelessWidget {
  const TermsServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true, titleName: 'Terms of Conditions', color: AppColors.primary,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: CustomText(
          text:
          "We respect your privacy. When you use our app, we collect basic info like your name, email, and event preferences to help you manage, join, or host events easily.",
          fontSize: 16.w,
          fontWeight: FontWeight.w400,
          maxLines: 10,
          //overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
        ),
      )
    );
  }
}
