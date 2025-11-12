import 'package:event_platform/core/app_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../../utils/app_const/app_const.dart';
import '../../../../../../../utils/app_images/app_images.dart';
import '../../../../../../components/custom_button/custom_button.dart';
import '../../../../../../components/custom_nav_bar/nurse_navbar.dart';
import '../../../../../../components/custom_netwrok_image/custom_network_image.dart';
import '../../../../../../components/custom_text/custom_text.dart';
class NurseListScreen extends StatelessWidget {
  NurseListScreen({super.key});


  final List<Map<String, String>> items = const [
    {
      'image':AppImages.icon1,
      'title': 'Profile',
      'subtitle': 'Manage your account',
      'route' : AppRoutes.nurseProfileScreen,
    },
    {
      'image': AppImages.icon2,
      'title': 'All Case List',
      'subtitle': 'Active cases',
      'route' : AppRoutes.nurseHomeScreen,
    },
    {
      'image': AppImages.icon4,
      'title': 'Archives',
      'subtitle': 'Completed cases',
      'route' : AppRoutes.nurseArchives,
    },
    {
      'image': AppImages.icon6,
      'title': 'Downloads',
      'subtitle': 'Forms & documents',
      'route' : AppRoutes.nurseDownloads,
    }, {
      'image': AppImages.icon1,
      'title': 'Contact Us',
      'subtitle': 'Get in touch',
      'route' : AppRoutes.nurseContractPage,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// Fixed Header
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 24),
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
                          size: 27,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Divider(thickness: 2),
            SizedBox(height: 5),

            /// List Items
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return GestureDetector(
                    onTap: () {
                        if (item['route'] != null) {
                          Get.toNamed(item['route']!);
                        }
                    },
                    child: Card(
                      color: AppColors.dentistListColor,
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        leading: ClipRRect(
                          child: Image.asset(
                            item['image']!,
                            width: 57.w,
                            height: 45.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: CustomText(
                          text: item['title']!,
                          fontSize: 20.sp,
                          textAlign:  TextAlign.start,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                        subtitle: CustomText(
                          text: item['subtitle']!,
                          fontSize: 14.sp,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NurseNavbar(currentIndex: 0),
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
