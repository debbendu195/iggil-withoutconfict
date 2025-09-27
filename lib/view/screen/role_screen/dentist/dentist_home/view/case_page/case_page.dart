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
      appBar: CustomRoyelAppbar(leftIcon: true, titleName: 'Case Details', color: AppColors.primary,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Case Document: Dental\nCrown Restoration",
              fontSize: 16,
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.start,
            ),

            const Text("Case ID: #DC-2024-001",
                style: TextStyle(fontSize: 12, color: Colors.black54)),
            const SizedBox(height: 16),

            /// ===================================== Main container with shadow  ============================//
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTextRow("NEW CASE/CONTINUATION/REMARK", "NEW CASE"),
                  buildTextRow("PATIENT ID", controller.patientId.value),
                  buildTextRow("GENDER", controller.gender.value),
                  buildTextRow("AGE", controller.age.value),
                  buildTextRow("SCAN NUMBER", controller.scanNumber.value),
                  buildTextRow("STANDER/PREMIUM", controller.standard.value),
                  buildTextRow("CROWN+BRIDGE/DENTURE/MISE",
                      controller.crownBridge.value),
                  buildTextRow(
                      "PFM/FULL CAST/METAL FREE", controller.ppm.value),
                  buildTextRow("SINGLE UNIT CROWN/MARYLAND/CONV BRIDGE",
                      controller.singleUnit.value),
                  buildTextRow("PORCELAIN BUTT MARGIN 360/BUCCAL ONLY",
                      controller.porcelain.value),
                  buildTextRow("TOOTH NUMBER", controller.toothNumber.value),
                  buildTextRow("SHADE", controller.shade.value),
                  buildTextRow(
                      "SPECIAL INSTRUCTION", controller.instruction.value),
                  buildTextRow("ATTACHMENTS", controller.attachment.value),
                  buildTextRow("LAB SECTION", "", isLast: true),
                ],
              ),
            ),
            const SizedBox(height: 24),

            /// ============================================  Buttons  section ========================================//
            ElevatedButton(
              onPressed: () {
                Get.snackbar("Download", "Document Downloaded!");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text(
                "Download Document",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {
                Get.snackbar("Print", "Document Sent to Printer!");
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                side: const BorderSide(color: Colors.green),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("Print Document",
                  style: TextStyle(color: Colors.green)),
            ),
          ],
        ),
      ),
    );
  }
}


// =============================  Custom Widgets use for row Text =======================[

Widget buildTextRow(String title, String value, { bool isLast = false}) {
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
            textAlign: TextAlign.left,
            title,
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
// =============================  Custom Widgets end =======================//
