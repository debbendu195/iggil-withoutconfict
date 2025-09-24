
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/app_routes/app_routes.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../utils/app_images/app_images.dart';
import '../../../../../components/custom_button/custom_button.dart';
import '../../../../../components/custom_image/custom_image.dart';
import '../../../../../components/custom_text/custom_text.dart';


class CustomTechnicianCaseCard extends StatelessWidget {
  const CustomTechnicianCaseCard({
    super.key,
    this.title,
    this.doctorName,
    this.description,
    this.progress = 0.0,
    this.timeAgo,
    this.onTap,
    this.status = "New",
    this.statusColor,
    this.all=false,
    this.inProgress=false,
    this.complete=false,
  });

  final String? title;
  final String? doctorName;
  final String? description;
  final double progress;
  final String? timeAgo;
  final VoidCallback? onTap;

  final String status;
  final Color? statusColor;

  final bool all;
  final bool inProgress;
  final bool complete;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title + Badges
            Row(
              children: [
                Expanded(
                  child: CustomText(
                    text: title ?? "Bridge Work - Patient Zhou",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(width: 6),

                /// All Badge
                all == false
                    ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.red_01,
                  ),
                  child: CustomText(
                    text: "New",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.red,
                  ),
                )
                    : SizedBox(),

                SizedBox(width: 6),

                /// In Progress Badge
                inProgress == false
                    ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffDBEAFE),
                  ),
                  child: CustomText(
                    text: "In Progress",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                )
                    : Container(),

                SizedBox(width: 6),

                /// Complete Badge
                complete == false
                    ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffE0FFD5),
                  ),
                  child: CustomText(
                    text: "Complete",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                  ),
                )
                    : Container(),
              ],
            ),
            SizedBox(height: 15),

            /// Doctor Name
            CustomText(
              text: doctorName ?? "Dr. Debbendu Paul",
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 8),

            /// Description
            CustomText(
              text: description ??
                  "Assigned: Jan 27,2025",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),

            SizedBox(height: 16),
            
            Row(
              children: [
                CustomImage(imageSrc: AppImages.gallery,),
                SizedBox(width: 10,),
                CustomText(text: '5', fontWeight: FontWeight.w400, fontSize: 12,),
                SizedBox(width: 20,),
                CustomImage(imageSrc: AppImages.pdf,),
                SizedBox(width: 10,),
                CustomText(text: '5', fontWeight: FontWeight.w400, fontSize: 12,),
              ],
            ),
            
            SizedBox(height: 16),

            /// Button
            CustomButton(
              title: "Accept Case",
              onTap: (){
                Get.toNamed(AppRoutes.viewCaseScreen);
              },
              textColor: Colors.white,
              borderRadius: 8,
              height: 45,
              width: double.infinity,
              fillColor: statusColor??AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
