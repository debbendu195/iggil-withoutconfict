import 'package:event_platform/core/app_routes/app_routes.dart';
import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../components/custom_button/custom_button.dart';
import '../../../../../../components/custom_text/custom_text.dart';
import '../custom_case_card_description/custom_case_card_description.dart';

class CustomLabManagerCaseCard extends StatelessWidget {
  const CustomLabManagerCaseCard({
    super.key,
    this.title,
    this.doctorName,
    this.description,
    this.progress = 0.0,
    this.timeAgo,
     required this.onTapCase,
    this.status = "New",
    this.statusColor,
    this.inProgress = false,
    this.complete = false,
    this.newStatus,
  });

  final String? title;
  final String? doctorName;
  final String? description;
  final double progress;
  final String? timeAgo;
  final VoidCallback onTapCase;

  final String status;
  final Color? statusColor;
  final bool inProgress;
  final bool complete;
  final bool? newStatus;


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
                    text: title ?? "Case Title",
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
                newStatus == false
                    ? Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
            SizedBox(height: 8),

            /// Doctor Name
            CustomText(
              text: doctorName ?? "Doctor Name",
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 8),


            // custom case card description call part
            CustomCaseCardDescription(item1: 'Clinic',item2: 'MDC',),
            SizedBox(height: 16),
            CustomCaseCardDescription(item1: 'Patient Ref',item2: 'Mu0001',),
            SizedBox(height: 16),
            CustomCaseCardDescription(item1: 'Status',item2: 'Submitted',),
            SizedBox(height: 16),
            CustomCaseCardDescription(item1: 'Return Date',item2:'10/09/2025',),
            SizedBox(height: 16),
            /// Description
            CustomText(
              textAlign: TextAlign.start,
              text: description ??
                  "Complex endodontic case requiring specialized\napproach for molar restoration...",
              fontSize: 13,
              color: Colors.black54,

            ),
            SizedBox(height: 12),

            /// Button
            CustomButton(
              title: "View Case",
              onTap: onTapCase,
              textColor: Colors.white,
              borderRadius: 8,
              height: 45,
              width: double.infinity,
              fillColor: statusColor ?? AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
