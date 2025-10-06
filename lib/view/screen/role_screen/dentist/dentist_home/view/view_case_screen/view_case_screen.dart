import 'package:event_platform/core/app_routes/app_routes.dart';
import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/utils/app_const/app_const.dart';
import 'package:event_platform/view/components/custom_button/custom_button.dart';
import 'package:event_platform/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:event_platform/view/components/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ViewCaseScreen extends StatelessWidget {
  const ViewCaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(
        leftIcon: true,
        titleName: 'caseDetails'.tr,
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
                text: '${'caseLabel'.tr} Patient XYZ',
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
                      text: '${'clinic'.tr}:',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                    SizedBox(height: 3.h),
                    CustomText(
                      text: "MDC",
                      fontSize: 14.sp,
                      color: AppColors.grey,
                    ),
                    SizedBox(height: 10.h),
                    CustomText(
                      text: '${'doctor'.tr}:',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                    SizedBox(height: 3.h),
                    CustomText(
                      text: "Debbendu Paul Oni",
                      fontSize: 14.sp,
                      color: AppColors.grey,
                    ),
                    SizedBox(height: 10.h),
                    CustomText(
                      text: '${'patientReference'.tr}:',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                    SizedBox(height: 3.h),
                    CustomText(
                      text: "MU001",
                      fontSize: 14.sp,
                      color: AppColors.grey,
                    ),
                    SizedBox(height: 10.h),
                    CustomText(
                      text: '${'returnDate'.tr}',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                    SizedBox(height: 3.h),
                    CustomText(
                      text: "27/09/2025",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                    ),
                    SizedBox(height: 10.h),
                    CustomText(
                      text: '${'caseNotes'.tr}:',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                    SizedBox(height: 3.h),
                    CustomText(
                      text: 'caseNotesDescription'.tr,
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
                      text: 'caseStatus'.tr,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: AppColors.green_01,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: CustomText(
                        text: 'submitted'.tr,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),

              // Lab Form
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
                      text: 'labForm'.tr,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                    InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.caseDocumentScreen);
                        },
                        child: Icon(Icons.description)),
                  ],
                ),
              ),
              SizedBox(height: 10.h),

              // Attachment
              CustomText(
                text: 'attachment'.tr,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    return CustomNetworkImage(
                      imageUrl: AppConstants.ntrition,
                      height: 100,
                      width: 110,
                      borderRadius: BorderRadius.circular(10),
                    );
                  },
                ),
              ),
              SizedBox(height: 10.h),

              CustomText(
                text: 'writeYourNotes'.tr,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                hintText: 'enterNotesHint'.tr,
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
                    Icon(Icons.attachment_rounded,
                        size: 50, color: AppColors.grey1),
                    CustomText(
                      top: 10.h,
                      text: 'uploadAttachments'.tr,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.grey1,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),

              CustomText(
                text: 'qualityCheck'.tr,
                fontWeight: FontWeight.w500,
                fontSize: 16,
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
                      text: 'noQualityCheck'.tr,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.grey1,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              CustomButton(
                onTap: () {},
                title: 'submitCase'.tr,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                borderRadius: 10,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
