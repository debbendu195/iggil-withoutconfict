import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';

class CaseStatusDropdown extends StatelessWidget {
  const CaseStatusDropdown({super.key});

  Color _getBackgroundColor(String status) {
    switch (status) {
      case "Accepted":
        return Color(0xffe0ffd5);
      case "Processing":
        return Colors.red.shade100;
      case "Dispatch":
        return Colors.yellow.shade100;
      default:
        return Colors.grey.shade200;
    }
  }

  Color _getTextColor(String status) {
    switch (status) {
      case "Accepted":
        return AppColors.primary;
      case "Processing":
        return Colors.red;
      case "Dispatch":
        return Colors.orange;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CaseStatusController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Case Status",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Obx(() {
          final status = controller.selectedStatus.value;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              color: _getBackgroundColor(status),
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButton<String>(
              value: status,
              underline: const SizedBox(),
              icon: const Icon(Icons.arrow_drop_down, color: Colors.black54),
              items: controller.statusList.map((s) {
                return DropdownMenuItem(
                  value: s,
                  child: Text(
                    s,
                    style: TextStyle(
                      color: _getTextColor(s),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  controller.updateStatus(value);
                }
              },
            ),
          );
        }),
      ],
    );
  }
}
