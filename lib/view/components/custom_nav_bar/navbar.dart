import 'package:event_platform/view/screen/role_screen/dentist/dentist_home/view/dentist/dentist_list_screen.dart';
import 'package:event_platform/view/screen/role_screen/dentist/dentist_home/view/dentist_home/dentist_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../../screen/role_screen/dentist/add_case/view/add_case_screen.dart';
import '../../screen/role_screen/dentist/dentist_home/view/dentist_message/dentist_message.dart';
import '../../screen/role_screen/dentist/my_case/view/my_case_screen.dart';
import '../../screen/role_screen/dentist/profile/view/profile_screen/profile_screen.dart';
import '../custom_text/custom_text.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;

  const NavBar({required this.currentIndex, super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late int bottomNavIndex;

  final List<String> navbarNameList = [
    "Home".tr,
    "My Search".tr,
    "Message".tr,
    "Profile".tr,
  ];

  final List<String> selectedIcon = [
    AppIcons.home,
    AppIcons.search,
    AppIcons.message,
    AppIcons.profile,
  ];

  final List<String> unselectedIcon = [
    AppIcons.home,
    AppIcons.search,
    AppIcons.message,
    AppIcons.profile,
  ];

  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: const Color(0xffFEFEFE),
        /*borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        border: Border.all(color: AppColors.grey_03, width: .2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 0,
            offset: const Offset(3, 0),
          ),
        ],*/
      ),
      height: 85.h,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          selectedIcon.length,
              (index) => InkWell(
            onTap: () => onTap(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 6.h),
                Container(
                  height: 40.h,
                  width: 40.w,
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    index == bottomNavIndex
                        ? selectedIcon[index]
                        : unselectedIcon[index],
                    height: 24.h,
                    width: 24.w,
                    color: index == bottomNavIndex
                        ? AppColors.primary
                        : AppColors.grey_03,
                  ),
                ),
                CustomText(
                  text: navbarNameList[index],
                  color: index == bottomNavIndex
                      ? AppColors.primary
                      : AppColors.grey_03,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTap(int index) {
    if (index != bottomNavIndex) {
      setState(() {
        bottomNavIndex = index;
      });

      switch (index) {
        case 0:
          Get.offAll(() => const DentistListScreen());
          break;
        case 1:
          Get.to(() => const DentistHomeScreen());
          break;
        case 2:
          Get.to(() => DentistMessage());
          break;
        case 3:
          Get.to(() => const ProfileScreen());
          break;
      }
    }
  }
}