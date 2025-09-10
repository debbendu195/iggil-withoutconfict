import 'package:event_platform/utils/app_icons/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors/app_colors.dart';


class HostNavbar extends StatefulWidget {
  final int currentIndex;

  const HostNavbar({required this.currentIndex, super.key});

  @override
  State<HostNavbar> createState() => _UserNavBarState();
}

class _UserNavBarState extends State<HostNavbar> {
  late int bottomNavIndex;

  final List<String> icons = [
    AppIcons.navHome,
    AppIcons.navCalendar,
    AppIcons.navGlobal,
    AppIcons.navMessage,
    AppIcons.navUser,

  ];

  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          // border: Border.all(color: AppColors.grey_03, width: .2),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey,
          //     spreadRadius: 1,
          //     blurRadius: 0,
          //     offset: const Offset(3, 0),
          //   ),
          // ],
        ),
        height: 80.h,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            icons.length,
                (index) => InkWell(
              onTap: () => onTap(index),
              borderRadius: BorderRadius.circular(20.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 13.h),
                  Container(
                    height: 47.62.h,
                    width: 47.62.w,
                    decoration: BoxDecoration(
                      color: index == bottomNavIndex
                          ? Colors.white
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      icons[index],
                      height: 25.h,
                      width: 25.w,
                      color: index == bottomNavIndex
                          ? Colors.black
                          : Color(0xFFD2D2D2),
                    ),
                  ),
                ],
              ),
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
        // case 0:
        //   Get.offAll(() => HomeScreen());
        //   break;
        // case 1:
        //   Get.offAll(() => EventScreen());
        //   break;
        // case 2:
        //   Get.offAll(() => SocialScreen());
        //   break;
        // case 3:
        //  Get.offAll(() => MessageScreen());
        //   break;
        // case 4:
        //   Get.to(() => ProfileScreen());
        //   break;
      }
    }
  }
}