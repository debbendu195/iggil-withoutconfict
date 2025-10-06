import 'package:event_platform/core/app_routes/app_routes.dart';
import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/case_controller.dart';

class CaseDocumentScreen extends StatelessWidget {
  final controller = Get.put(CaseDocumentController());
  CaseDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(
        leftIcon: true,
        titleName: 'caseDocument'.tr,
        color: AppColors.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'caseDocumentTitle'.tr,
              fontSize: 16,
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 8),
            CustomText(
              text: 'caseId'.tr + ": #DC-2024-001",
              fontSize: 12,
              color: Colors.black54,
            ),
            const SizedBox(height: 16),

            /// ===================================== Main container with shadow ============================//
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTextRow('caseType'.tr, 'newCase'.tr),
                  buildTextRow('patientId'.tr, controller.patientId.value),
                  buildTextRow('gender'.tr, controller.gender.value),
                  buildTextRow('age'.tr, controller.age.value),
                  buildTextRow('scanNumber'.tr, controller.scanNumber.value),
                  buildTextRow('standardPremium'.tr, controller.standard.value),
                  buildTextRow('crownBridge'.tr, controller.crownBridge.value),
                  buildTextRow('ppm'.tr, controller.ppm.value),
                  buildTextRow('singleUnitCrown'.tr, controller.singleUnit.value),
                  buildTextRow('porcelainButtMargin'.tr, controller.porcelain.value),
                  buildTextRow('toothNumber'.tr, controller.toothNumber.value),
                  buildTextRow('shade'.tr, controller.shade.value),
                  buildTextRow('specialInstruction'.tr, controller.instruction.value),
                  buildTextRow('attachments'.tr, controller.attachment.value),
                  buildTextRow('labSection'.tr, "", isLast: true),
                ],
              ),
            ),
            const SizedBox(height: 24),

            /// ============================================  Buttons section ========================================//
            ElevatedButton(
              onPressed: () {
                Get.snackbar('download'.tr, 'documentDownloaded'.tr);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'downloadDocument'.tr,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {
                Get.snackbar('print'.tr, 'documentSentPrinter'.tr);
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                side: const BorderSide(color: Colors.green),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'printDocument'.tr,
                style: const TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// =============================  Custom Widget for row Text =======================[
Widget buildTextRow(String title, String value, {bool isLast = false}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    decoration: BoxDecoration(
      border: isLast == false
          ? const Border(
        bottom: BorderSide(color: Colors.black26, width: 0.5),
      )
          : null,
    ),
    child: Row(
      children: [
        Expanded(
          flex: 7,
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    ),
  );
}
