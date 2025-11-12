
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../utils/app_strings/app_strings.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../components/custom_button/custom_button.dart';
import '../../../../../components/custom_text/custom_text.dart';
import '../../../dentist/dentist_home/widget/custom_case_card_description/custom_case_card_description.dart';

class CustomNurseCard extends StatelessWidget {
  const CustomNurseCard({
    super.key,
    this.title,
    this.doctorName,
    this.description,
    this.progress = 0.0,
    this.timeAgo,
    required this.onTapCase,
    this.status = "New",
    this.statusColor,
    this.newStatus,
    this.inProgress = false,
    this.complete = false,
  });

  final String? title;
  final String? doctorName;
  final String? description;
  final double progress;
  final String? timeAgo;
  final VoidCallback onTapCase;

  final String status;
  final Color? statusColor;

  final bool? newStatus;
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title + Badges
            Row(
              children: [
                Expanded(
                  child: CustomText(
                    text: (title ?? AppStrings.rootCanalTreatment).tr,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(width: 6),

                /// All Badge
                newStatus == false
                    ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.red_01,
                  ),
                  child: CustomText(
                    text: AppStrings.new1.tr,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.red,
                  ),
                )
                    : const SizedBox(),

                const SizedBox(width: 6),

                /// In Progress Badge
                inProgress == false
                    ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffDBEAFE),
                  ),
                  child: CustomText(
                    text: AppStrings.inProgress.tr,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                )
                    : Container(),

                const SizedBox(width: 6),

                /// Complete Badge
                complete == false
                    ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffE0FFD5),
                  ),
                  child: CustomText(
                    text: AppStrings.complete.tr,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                  ),
                )
                    : Container(),
              ],
            ),
            const SizedBox(height: 8),

            /// Doctor Name
            CustomText(
              text: (doctorName ?? "Debbendu Paul").tr,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 8),

            /// custom case card description call part
            CustomCaseCardDescription(
              item1: AppStrings.clinic.tr,
              item2: AppStrings.mdc.tr,
            ),
            const SizedBox(height: 16),
            CustomCaseCardDescription(
              item1: AppStrings.patientRef.tr,
              item2: AppStrings.mu0001.tr,
            ),
            const SizedBox(height: 16),
            CustomCaseCardDescription(
              item1: AppStrings.status.tr,
              item2: status.tr,
            ),
            const SizedBox(height: 16),
            CustomCaseCardDescription(
              item1: AppStrings.returnDate.tr,
              item2: AppStrings.tenSeptember2025.tr,
            ),
            const SizedBox(height: 16),

            /// Description
            CustomText(
              textAlign: TextAlign.start,
              text: (description ?? AppStrings.complexEndodonticCase).tr,
              fontSize: 13,
              color: Colors.black54,
            ),
            const SizedBox(height: 12),

            /// Button
            CustomButton(
              title: 'viewCase'.tr,
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
