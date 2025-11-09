import 'package:event_platform/view/components/custom_nav_bar/navbar.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/app_routes/app_routes.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../utils/app_const/app_const.dart';
import '../../../../../components/custom_button/custom_button.dart';
import '../../../../../components/custom_netwrok_image/custom_network_image.dart';
import '../../../../../components/custom_text/custom_text.dart';
import '../../../../../components/custom_text_field/custom_text_field.dart';
import '../../../lab_manager/lab_manager_home_screen/widget/custom_case_card/lab_manager_custom_case_card.dart';
import '../../dentist_home/controller/case_home_controller.dart';
import '../../dentist_home/widget/custom_case_card/custom_case_card.dart';
import '../controller/case_controller.dart';
import '../widget/custom_case_tabbar.dart';

class DentistMyCaseScreen extends StatelessWidget {
  DentistMyCaseScreen({super.key});

  final CaseController caseController = Get.find<CaseController>();
  final CaseHomeController controller = Get.put(CaseHomeController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getAllCases();
    });

    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true, titleName: 'My Case List'),
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
                  SizedBox(height: 24.h),

                  CustomText(
                    text: 'All Cases Posted by Dentists',
                    color: AppColors.primary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),

                  SizedBox(height: 24.h),

                  /// ============= Custom Tab Bar =============
                  Obx(() => CustomCaseTabbar(
                    textColor: AppColors.white,
                    tabs: caseController.tabNamelist,
                    selectedIndex: caseController.currentIndex.value,
                    onTabSelected: (value) {
                      caseController.currentIndex.value = value;
                    },
                    selectedColor: AppColors.primary,
                  )),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            /// ================= Case List =================
            Expanded(
              child: Obx(() {
                // All Cases Tab
                if (caseController.currentIndex.value == 0) {


                  // amr  home case controller

                  if (controller.getCaseStatus.value == Status.loading && controller.caseList.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.caseList.isEmpty) {
                    return const Center(child: Text("No cases found"));
                  }

                  return NotificationListener<ScrollNotification>(
                    onNotification: (scrollInfo) {
                      if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {controller.loadMoreCases();}
                      return false;
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      itemCount: controller.caseList.length + 1,
                      itemBuilder: (context, index) {
                        if (index < controller.caseList.length) {
                          // controller er list variable ekhane call korbo
                          final caseData = controller.caseList[index];

                          /*return CustomLabManagerCaseCard(
                            onTapCase :(){
                              Get.toNamed(AppRoutes.labManagerViewCaseScreen,arguments: caseData.id);
                            },
                            newStatus: false,
                            inProgress: true,
                            complete: true,
                            doctorName: "Api Thakhe Name Asbe",
                            title:  "Api thakhe asbe KI Title hobe",
                            description: caseData.description,
                          );*/
                          return CustomCaseCard(
                            onTapCase :(){
                              Get.toNamed(AppRoutes.viewCaseScreen,arguments: caseData.id);
                            },
                            newStatus: false,
                            inProgress: true,
                            complete: true,
                            doctorName: "Api Thakhe Name Asbe",
                            title:  "Api thakhe asbe KI Title hobe",
                            description: caseData.description,
                          );

                        } else {
                          return controller.isLoadingMore.value
                              ? const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Center(
                                child: CircularProgressIndicator()),
                          )
                              : const SizedBox();
                        }
                      },
                    ),
                  );
                }

                // In Progress Tab
                if (caseController.currentIndex.value == 1) {
                  final inProgressCases = controller.caseList
                      .where((c) => c.status?.toLowerCase() == "in_progress")
                      .toList();

                  if (inProgressCases.isEmpty) {
                    return const Center(child: Text("No in-progress cases"));
                  }

                  return ListView.builder(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    itemCount: inProgressCases.length,
                    itemBuilder: (context, index) {
                      final caseData = inProgressCases[index];
                      return CustomLabManagerCaseCard(
                        onTapCase :() {},

                        inProgress: true,
                        complete: false,
                      );
                    },
                  );
                }

                // Completed Tab
                if (caseController.currentIndex.value == 2) {
                  final completedCases = controller.caseList
                      .where((c) => c.status?.toLowerCase() == "complete")
                      .toList();

                  if (completedCases.isEmpty) {
                    return const Center(child: Text("No completed cases"));
                  }

                  return ListView.builder(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    itemCount: completedCases.length,
                    itemBuilder: (context, index) {
                      final caseData = completedCases[index];
                      return CustomLabManagerCaseCard(
                        onTapCase :() {},
                        inProgress: false,
                        complete: true,
                        progress: 1,
                      );
                    },
                  );
                }

                return const SizedBox();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
