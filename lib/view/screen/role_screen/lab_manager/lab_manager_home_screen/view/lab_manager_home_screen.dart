import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../core/app_routes/app_routes.dart';
import '../../../../../components/custom_nav_bar/lab_manager_navbar.dart';
import '../../../../../components/custom_text/custom_text.dart';
import '../../../../../components/custom_text_field/custom_text_field.dart';
import '../widget/custom_case_card/lab_manager_custom_case_card.dart';
class LabManagerHomeScreen extends StatelessWidget {
  const LabManagerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*body: SafeArea(
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
                            text: 'Recent Cases Posted by Dentists',
                            color: AppColors.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          GestureDetector(onTap: (){
                            Get.toNamed(AppRoutes.dentistMyCaseScreen);
                          },
                              child: CustomText(text: 'view', fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.primary)
                          )
                        ],
                      ),
        
                      /// Card Section with vertical padding
                      ListView.builder(
                        padding: EdgeInsets.only(top: 20.h),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return CustomLabManagerCaseCard(
                            all: false,
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
      bottomNavigationBar: LabManagerNavbar(currentIndex: 1),*/
    );
  }
}

/*Widget _buildCard({
  required IconData icon,
  required String title,
  required String msg,
  required String time,
  required Color color,
}) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: AppColors.white_50,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 6),
            CustomText(
              text: title,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ],
        ),
        const SizedBox(height: 6),
        CustomText(text: msg, fontSize: 13, color: AppColors.black),
        const SizedBox(height: 4),
        CustomText(text: time, fontSize: 11, color: AppColors.grey),
      ],
    ),
  );
}*/

