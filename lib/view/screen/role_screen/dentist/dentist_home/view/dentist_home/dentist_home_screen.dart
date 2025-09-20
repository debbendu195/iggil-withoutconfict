import 'package:event_platform/view/components/custom_nav_bar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../../utils/app_const/app_const.dart';
import '../../../../../../components/custom_button/custom_button.dart';
import '../../../../../../components/custom_netwrok_image/custom_network_image.dart';
import '../../../../../../components/custom_text/custom_text.dart';
import '../../../../../../components/custom_text_field/custom_text_field.dart';
import '../../widget/custom_case_card/custom_case_card.dart';

class DentistHomeScreen extends StatelessWidget {
  const DentistHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// Fixed Header
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
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              title: CustomText(
                                text: "Notifications",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                                textAlign: TextAlign.start,
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _buildCard(
                                    icon: Icons.add_circle_outline,
                                    title: "New case assigned",
                                    msg:
                                        "Veneer Set #12349 assigned by Dr. Robert Kim",
                                    time: "15 minutes ago",
                                    color: AppColors.primary,
                                  ),
                                  const SizedBox(height: 10),
                                  _buildCard(
                                    icon: Icons.update,
                                    title: "Case Update",
                                    msg:
                                        "Crown Preparation #12346 marked 'In Progress'",
                                    time: "1 hour ago",
                                    color: AppColors.primary,
                                  ),
                                  const SizedBox(height: 10),
                                  _buildCard(
                                    icon: Icons.error_outline,
                                    title: "Urgent message",
                                    msg:
                                        "Dr. Sarah Johnson requests immediate consultation for Root Canal #12345",
                                    time: "2 hours ago",
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
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
                    CustomText(
                      text: 'Recent Cases Posted by Dentists',
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),

                    /// Card Section with vertical padding
                    ListView.builder(
                      padding: EdgeInsets.only(top: 20.h),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return CustomCaseCard(
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
      bottomNavigationBar: NavBar(currentIndex: 0),
    );
  }
}

Widget _buildCard({
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
}
