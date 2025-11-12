import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../core/app_routes/app_routes.dart';
import '../../../../../components/custom_nav_bar/practice_managet_navbar.dart';
import '../../../../../components/custom_text/custom_text.dart';
import '../../../../../components/custom_text_field/custom_text_field.dart';
import '../widget/custom_case_card/custom_practice_manager_custom_case_card.dart';

class PracticeManagerHomeScreen extends StatelessWidget {
  const PracticeManagerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// Scrollable Body
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        hintText: 'Search by CaseTitle',
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
                              Get.toNamed(AppRoutes.practiceManagerMyCase);
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
                      ListView.builder(
                        padding: EdgeInsets.only(top: 20.h),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return CustomPracticeManagerCustomCaseCard(
                            onTapCase: () {
                              Get.toNamed(AppRoutes.viewCaseScreen);
                            },
                            newStatus: false,
                            inProgress: true,
                            complete: true,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PracticeManagetNavbar(currentIndex: 1),
    );
  }
}


