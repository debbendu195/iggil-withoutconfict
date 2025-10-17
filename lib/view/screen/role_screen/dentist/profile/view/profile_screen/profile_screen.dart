import 'package:event_platform/core/app_routes/app_routes.dart';
import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/utils/app_const/app_const.dart';
import 'package:event_platform/utils/app_icons/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../components/custom_image/custom_image.dart';
import '../../../../../../components/custom_nav_bar/navbar.dart';
import '../../../../../../components/custom_netwrok_image/custom_network_image.dart';
import '../../../../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../../../components/custom_show_popup/custom_show_popup.dart';
import '../../../../../../components/custom_text/custom_text.dart';
import '../../../../../authentication_screen/controller/login_controller.dart';
import 'controller/language_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final LanguageController langController = Get.put(LanguageController());
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(
        leftIcon: false,
        titleName: 'myProfile'.tr,
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
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Debbendu Paul',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(text: 'Dentist'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24),
                CustomText(
                  text: 'profileInformation'.tr,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                SizedBox(height: 24),
                _buildOption(
                  icon: AppIcons.editProfile,
                  titleKey: 'editProfile',
                  onTap: () => Get.toNamed(AppRoutes.editScreen),
                ),
                SizedBox(height: 15),
                _buildOption(
                  icon: AppIcons.accountSettings,
                  titleKey: 'accountSettings',
                  onTap: () => Get.toNamed(AppRoutes.accountSettingsScreen),
                ),
                SizedBox(height: 15),
                _buildOption(
                  icon: AppIcons.language,
                  titleKey: 'language',
                  onTap: () => Get.toNamed(AppRoutes.langauageScreen),
                ),
                SizedBox(height: 15),
                _buildOption(
                  icon: AppIcons.notification,
                  titleKey: 'notification',
                  onTap: () => Get.toNamed(AppRoutes.notificationScreen),
                ),
                SizedBox(height: 15),
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
                            title: 'areYouSure'.tr,
                            discription: 'logoutYourAccount'.tr,
                            showColumnButton: true,
                            showCloseButton: true,
                            rightOnTap: () => Get.back(),
                            leftOnTap: () => loginController.logout(),
                          ),
                        ),
                      ),
                    );
                  },
                  child: _buildOption(
                    icon: AppIcons.logout,
                    titleKey: 'logout',
                    color: AppColors.red,
                    showArrow: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavBar(currentIndex: 3),
    );
  }

  Widget _buildOption({
    required String icon,
    required String titleKey,
    VoidCallback? onTap,
    Color? color,
    bool showArrow = true,
  }) {
    return GestureDetector(
      onTap: onTap,
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
                imageSrc: icon,
                height: 24,
                width: 24,
              ),
              SizedBox(width: 15),
              CustomText(
                text: titleKey.tr,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: color ?? AppColors.primary,
              ),
              Spacer(),
              if (showArrow)
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
    );
  }
}
