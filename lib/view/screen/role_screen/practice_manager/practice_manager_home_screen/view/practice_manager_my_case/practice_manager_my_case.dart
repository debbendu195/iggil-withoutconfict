import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/app_routes/app_routes.dart';
import '../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../components/custom_text/custom_text.dart';
import '../../../../../../components/custom_text_field/custom_text_field.dart';
import '../../../../dentist/my_case/controller/case_controller.dart';
import '../../../../dentist/my_case/widget/custom_case_tabbar.dart';
import '../../widget/custom_case_card/custom_practice_manager_custom_case_card.dart';

class PracticeManagerMyCase extends StatefulWidget {
  const PracticeManagerMyCase({super.key});

  @override
  State<PracticeManagerMyCase> createState() => _MyCaseScreenState();
}

class _MyCaseScreenState extends State<PracticeManagerMyCase> {
  final CaseController caseController = Get.find<CaseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true, titleName: "All My Case",),
      body: SafeArea(
        child: Column(
          children: [
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
                        return CustomPracticeManagerCustomCaseCard(
                          onTapCase: () {
                            Get.toNamed(AppRoutes.viewCaseScreen);
                          },
                          newStatus: false,
                          inProgress: true,
                          complete: true,
                        );
                      }),
                    ),
                  if (caseController.currentIndex.value == 1)
                    Column(
                      children: List.generate(2, (value) {
                        return CustomPracticeManagerCustomCaseCard(
                          onTapCase: () {
                            Get.toNamed(AppRoutes.viewCaseScreen);
                          },
                          newStatus: true,
                          inProgress: false,
                          complete: true,
                        );
                      }),
                    ),
                  if (caseController.currentIndex.value == 2)
                    Column(
                      children: List.generate(2, (value) {
                        return CustomPracticeManagerCustomCaseCard(
                          onTapCase: () {
                            Get.toNamed(AppRoutes.viewCaseScreen);
                          },
                          newStatus: true,
                          inProgress: true,
                          complete: false,
                        );
                      }),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
