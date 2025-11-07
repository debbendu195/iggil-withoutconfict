import 'package:event_platform/view/components/custom_nav_bar/navbar.dart';
import 'package:event_platform/view/screen/role_screen/dentist/dentist_home/controller/case_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/app_routes/app_routes.dart';
import '../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../components/custom_text/custom_text.dart';
import '../../../../../../components/custom_text_field/custom_text_field.dart';
import '../../widget/custom_case_card/custom_case_card.dart';
import '';

class DentistHomeScreen extends StatelessWidget {
  DentistHomeScreen({super.key});
  final controller = Get.put(CaseHomeController());
  @override
  Widget build(BuildContext context) {
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
                        hintText: 'searchByCaseTitle'.tr,
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
                            text: 'recentCasesPostedByDentists'.tr,
                            color: AppColors.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          GestureDetector(
                            onTap: () {
                                Get.toNamed(AppRoutes.dentistMyCaseScreen);
                            },
                            child: CustomText(
                              text: 'viewAll'.tr,
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
                        itemCount: controller.caseList.length,
                        itemBuilder: (context, index) {
                          var data = controller.caseList[index];
                          return CustomCaseCard(
                          all :  false ,
                           inProgress: true,
                           complete: true,
                           doctorName: data.patientID,
                           // title: data.clinicId?.name??"",
                           description: data.standard?.crownBridge.toString()??'',
                           timeAgo: data.createdAt.toString(),
                           status: data.status.toString(),
                           // inProgress: data.caseType ? true : false,
                           // complete: data.caseType ? true : false,
                            //all: false,
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
      bottomNavigationBar: NavBar(currentIndex: 1),
    );
  }
}


