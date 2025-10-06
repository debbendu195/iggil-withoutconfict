import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/app_routes/app_routes.dart';
import '../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../../utils/app_const/app_const.dart';
import '../../../../../../../utils/app_images/app_images.dart';
import '../../../../../../../view/multi_lag/app_translations.dart';
import '../../../../../../components/custom_button/custom_button.dart';
import '../../../../../../components/custom_nav_bar/navbar.dart';
import '../../../../../../components/custom_netwrok_image/custom_network_image.dart';
import '../../../../../../components/custom_text/custom_text.dart';

class DentistListScreen extends StatelessWidget {
  const DentistListScreen({super.key});

  final List<Map<String, String>> items = const [
    {
      'image':AppImages.icon1,
      'title': 'profile',
      'subtitle': 'manageYourAccount',
      'route' : AppRoutes.profileScreen,
    },
    {
      'image': AppImages.icon2,
      'title': 'myCaseList',
      'subtitle': 'activeCases',
      'route' : AppRoutes.dentistHomeScreen,
    },
    {
      'image': AppImages.icon3,
      'title': 'startCase',
      'subtitle': 'createOrResumeWork',
      'route' : AppRoutes.addCaseScreen,
    },
    {
      'image': AppImages.icon4,
      'title': 'archives',
      'subtitle': 'completedCases',
      'route' : AppRoutes.dentistArchives,
    },
    {
      'image': AppImages.icon5,
      'title': 'invoices',
      'subtitle': 'billingsAndPayments',
      'route' : AppRoutes.invoiceListView,
    },
    {
      'image': AppImages.icon6,
      'title': 'downloads',
      'subtitle': 'formsAndDocuments',
      'route' : AppRoutes.downloadsScreen,
    },
    {
      'image': AppImages.icon1,
      'title': 'contactUs',
      'subtitle': 'getInTouch',
      'route' : AppRoutes.contactUsScreen,
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
                            text: 'welcomeBack'.tr,
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
                                  text: 'notification'.tr,
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
                                      title: 'newCaseAssigned'.tr,
                                      msg: 'veneerSetAssignedByDrRobertKim'.tr,
                                      time: 'minutesAgo'.tr,
                                      color: AppColors.primary,
                                    ),
                                    const SizedBox(height: 10),
                                    _buildCard(
                                      icon: Icons.update,
                                      title: 'caseUpdate'.tr,
                                      msg: 'crownPreparationMarkedInProgress'.tr,
                                      time: 'hourAgo'.tr,
                                      color: AppColors.primary,
                                    ),
                                    const SizedBox(height: 10),
                                    _buildCard(
                                      icon: Icons.error_outline,
                                      title: 'urgentMessage'.tr,
                                      msg: 'drSarahJohnson'.tr,
                                      time: 'minutesAgo'.tr,
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
                          text: item['title']!.tr,
                          fontSize: 20.sp,
                          textAlign:  TextAlign.start,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                        subtitle: CustomText(
                          text: item['subtitle']!.tr,
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
              text: title.tr,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ],
        ),
        const SizedBox(height: 6),
        CustomText(text: msg.tr, fontSize: 13, color: AppColors.black),
        const SizedBox(height: 4),
        CustomText(text: time.tr, fontSize: 11, color: AppColors.grey),
      ],
    ),
  );
}
