import 'package:event_platform/core/app_routes/app_routes.dart';
import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/utils/app_const/app_const.dart';
import 'package:event_platform/utils/app_icons/app_icons.dart';
import 'package:event_platform/view/components/custom_image/custom_image.dart';
import 'package:event_platform/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../components/custom_nav_bar/navbar.dart';
import '../../../../../../components/custom_show_popup/custom_show_popup.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(
        leftIcon: false,
        titleName: 'My Profile',
        color: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomNetworkImage(
                      imageUrl: AppConstants.profileImage,
                      boxShape: BoxShape.circle,
                      height: 96.h,
                      width: 96.w,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Debbendu Paul',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(text: 'Dentist')
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                CustomText(
                  text: 'Profile Information',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.editScreen);
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white_50,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          CustomImage(
                            imageSrc: AppIcons.editProfile,
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          CustomText(
                            text: 'Edit Profile',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          Spacer(),
                          Container(
                            height: 45,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primary,
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: AppColors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.accountSettingsScreen);
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white_50,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          CustomImage(
                            imageSrc: AppIcons.accountSettings,
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          CustomText(
                            text: 'Account Settings',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          Spacer(),
                          Container(
                            height: 45,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primary,
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: AppColors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.langauageScreen);
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white_50,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          CustomImage(
                            imageSrc: AppIcons.language,
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          CustomText(
                            text: 'Language Settings',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          Spacer(),
                          Container(
                            height: 45,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primary,
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: AppColors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.notificationScreen);
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white_50,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          CustomImage(
                            imageSrc: AppIcons.notification,
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          CustomText(
                            text: 'Notification',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          Spacer(),
                          Container(
                            height: 45,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primary,
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: AppColors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: AppColors.white,
                    insetPadding: EdgeInsets.all(8),
                    contentPadding: EdgeInsets.all(8),
                    content: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: CustomShowDialog(
                        textColor: AppColors.black,
                        title: "Logout Your Account",
                        discription: "Are you sure you want to Logout ?",
                        showColumnButton: true,
                        showCloseButton: true,
                        rightOnTap: () {
                          Get.back(); // cancel
                        },
                        leftOnTap: () => Get.toNamed(AppRoutes.loginScreen), // confirm logout
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white_50,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CustomImage(
                        imageSrc: AppIcons.logout,
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 15),
                      CustomText(
                        text: 'Logout',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.red,
                      ),
                      Spacer(),
                      Container(
                        height: 45,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primary,
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavBar(currentIndex: 3),
    );
  }
}
