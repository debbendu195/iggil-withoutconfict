import 'package:event_platform/view/components/custom_loader/custom_loader.dart';
import 'package:event_platform/view/components/custom_nav_bar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/app_routes/app_routes.dart';
import '../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../../utils/app_const/app_const.dart';
import '../../../../../../../utils/app_strings/app_strings.dart';
import '../../../../../../components/custom_text/custom_text.dart';
import '../../../../../../components/custom_text_field/custom_text_field.dart';
import '../../../my_case/controller/case_controller.dart';
import '../../controller/case_home_controller.dart';
import '../../widget/custom_case_card/custom_case_card.dart';

class DentistHomeScreen extends StatelessWidget {
  DentistHomeScreen({super.key});

  final CaseController caseController = Get.find<CaseController>();
  final CaseHomeController controller = Get.put(CaseHomeController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getAllCases(isRefresh: true);
    });
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),

            /// Scrollable Body
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        hintText: 'searchByCaseTitle'.tr, // ✅ localization
                        hintStyle: TextStyle(color: AppColors.grey),
                        fieldBorderRadius: 15,
                        fieldBorderColor: AppColors.grey1,
                        fillColor: AppColors.white,
                        prefixIcon: Icon(Icons.search, color: AppColors.black),
                      ),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'recentCasesPostedByDentists'.tr, // ✅ localization
                            color: AppColors.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.dentistMyCaseScreen);
                            },
                            child: CustomText(
                              text: 'viewAll'.tr, // ✅ localization
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),

                      /// Card Section with vertical padding
                      Obx(() {
                        if (controller.getCaseStatus.value == Status.loading &&
                            controller.caseList.isEmpty) {
                          return const Center(child: CustomLoader());
                        }

                        if (controller.caseList.isEmpty) {
                          return const Center(child: Text("No cases found"));
                        }

                        return ListView.builder(
                          padding: EdgeInsets.only(top: 20.h),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.caseList.length,
                          itemBuilder: (context, index) {
                            final caseData = controller.caseList[index];
                            return CustomCaseCard(
                              onTapCase: () {
                                Get.toNamed(AppRoutes.viewCaseScreen, arguments: caseData.id);
                              },


                              doctorName: caseData.dentist?['name'] ?? "Unknown Dentist",
                              title: caseData.caseType ?? "Untitled Case",
                              description: caseData.description ?? "No description available",
                              //need one more field for title



                              newStatus: false,
                              inProgress: true,
                              complete: true,
                            );
                          },
                        );
                      }),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(currentIndex: 1),
    );
  }
}


