import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/utils/app_const/app_const.dart';
import 'package:event_platform/view/components/custom_nav_bar/navbar.dart';
import 'package:event_platform/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:event_platform/view/components/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../components/custom_button/custom_button.dart';
import '../../../../../components/custom_image/custom_image.dart';

class ViewCaseScreen extends StatelessWidget {
  const ViewCaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomRoyelAppbar(
          leftIcon: true,
          titleName: 'Case Details',
          color: AppColors.primary,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Patient Info
                CustomText(
                  text: 'Case: Dental Impressions for Patient XYZ',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.primary,
                ),
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.r,
                        offset: Offset(0, 3.h),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Patient:",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(height: 3.h),
                      CustomText(
                        text: "Debbendu Paul",
                        fontSize: 14.sp,
                        color: AppColors.grey,
                      ),
                      SizedBox(height: 10.h),
                      CustomText(
                        text: "Issue:",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                      SizedBox(height: 3.h),
                      CustomText(
                        text: "Broken Tooth",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                      SizedBox(height: 10.h),
                      CustomText(
                        text: "Order Type:",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                      SizedBox(height: 3.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          color: AppColors.red_01,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: CustomText(
                          text: "Emergency",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.red,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      CustomText(
                        text: "Case Notes:",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                      SizedBox(height: 3.h),
                      CustomText(
                        text:
                            "Patient requires urgent dental impressions for crown replacement. Previous crown has completely fractured.",
                        fontSize: 14.sp,
                        color: AppColors.grey,
                        maxLines: 4,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),

                // Case Status
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: AppColors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Case Status",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          color: AppColors.red_01,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: CustomText(
                          text: "In Progress",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),

                // Shared Media
                CustomText(
                  text: "Shared Media",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomNetworkImage(
                      imageUrl: AppConstants.ntrition,
                      height: 100,
                      width: 110,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    SizedBox(width: 10.w),
                    CustomNetworkImage(
                      imageUrl: AppConstants.ntrition,
                      height: 100,
                      width: 110,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    SizedBox(width: 10.w),
                    CustomNetworkImage(
                      imageUrl: AppConstants.ntrition,
                      height: 100,
                      width: 110,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),

                CustomText(
                  text: "Write your notes",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  hintText: 'Enter any notes or updates about the case',
                  maxLines: 3,
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: AppColors.grey1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.attachment_rounded, size: 50, color: AppColors.grey1),
                      CustomText(
                        top: 10.h,
                        text: 'Upload a Document',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.grey1,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: AppColors.grey1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload_file, size: 50, color: AppColors.grey1),
                      CustomText(
                        top: 10.h,
                        text: 'Upload a photo or video',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.grey1,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                CustomButton(onTap: (){}, title: 'Submit Case', fontSize: 16, fontWeight: FontWeight.w400, borderRadius: 10,),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      // bottomNavigationBar: NavBar(currentIndex: 0),
    );
  }
}
