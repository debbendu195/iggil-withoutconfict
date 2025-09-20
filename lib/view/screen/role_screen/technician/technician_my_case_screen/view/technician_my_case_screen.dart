
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../utils/app_const/app_const.dart';
import '../../../../../components/custom_button/custom_button.dart';
import '../../../../../components/custom_nav_bar/technician_navbar.dart';
import '../../../../../components/custom_netwrok_image/custom_network_image.dart';
import '../../../../../components/custom_text/custom_text.dart';
import '../../../../../components/custom_text_field/custom_text_field.dart';
import '../../../dentist/my_case/controller/case_controller.dart';
import '../../../dentist/my_case/widget/custom_case_tabbar.dart';
import '../../../dentist/my_case/widget/custom_case_tabbar_archived.dart';
import '../../technician_home/widget/custom_technician_case_card.dart';

class TechnicianMyCaseScreen extends StatefulWidget {
  const TechnicianMyCaseScreen({super.key});

  @override
  State<TechnicianMyCaseScreen> createState() => _MyCaseScreenState();
}

class _MyCaseScreenState extends State<TechnicianMyCaseScreen> {
  final CaseController caseController = Get.find<CaseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// ================= Top Profile Section =================
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomNetworkImage(
                      imageUrl: AppConstants.profileImage,
                      boxShape: BoxShape.circle,
                      height: 60.h,
                      width: 60.w,
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Welcome,",
                          fontSize: 16.w,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                        CustomText(
                          text: "Debbendu Paul",
                          fontSize: 14.w,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomButton(
                      title: "EN",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      onTap: () {},
                      fillColor: AppColors.green,
                      textColor: AppColors.primary,
                      borderRadius: 30,
                      height: 40,
                      width: 60,
                    ),
                    SizedBox(width: 16.w),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.notifications,
                        color: AppColors.black,
                        size: 24,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 24),
          Divider(thickness: 2),
          SizedBox(height: 24),

          /// ================= Search + Tabs =================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Search Bar
                CustomTextField(
                  hintText: 'Search by CaseTitle',
                  hintStyle: TextStyle(color: AppColors.grey),
                  fieldBorderRadius: 15,
                  fieldBorderColor: AppColors.grey1,
                  fillColor: AppColors.white,
                  prefixIcon: Icon(Icons.search, color: AppColors.black),
                ),
                SizedBox(height: 24),

                CustomText(
                  text: 'All Cases Posted by Dentists',
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),

                SizedBox(height: 24),

                /// ============= Custom Tab Bar =============
                CustomCaseTabbar(
                  textColor: AppColors.white,
                  tabs: caseController.tabNamelist,
                  selectedIndex: caseController.currentIndex.value,
                  onTabSelected: (value) {
                    caseController.currentIndex.value = value;
                    setState(() {});
                  },
                  selectedColor: AppColors.primary,
                ),
              ],
            ),
          ),

          SizedBox(height: 20.h),

          /// ================= Case List =================
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: [
                if (caseController.currentIndex.value == 0)
                  Column(
                    children: List.generate(2, (value) {
                      return CustomTechnicianCaseCard(
                        all: false,
                        inProgress: true,
                        complete: true,
                      );
                    }),
                  ),
                if (caseController.currentIndex.value == 1)
                  Column(
                    children: List.generate(2, (value) {
                      return CustomTechnicianCaseCard(
                        all: true,
                        inProgress: false,
                        complete: true,
                        progress: 0.5,
                      );
                    }),
                  ),
                if (caseController.currentIndex.value == 2)
                  Column(
                    children: List.generate(2, (value) {
                      return CustomTechnicianCaseCard(
                        all: true,
                        inProgress: true,
                        complete: false,
                        progress: 1,
                      );
                    }),
                  ),
                if (caseController.currentIndex.value == 3)
                  Column(
                      children: List.generate(2, (value){
                        return CustomCaseTabbarArchived();
                      })
                  ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: TechnicianNavbar(currentIndex: 1),
    );
  }
}
