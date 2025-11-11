import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/utils/app_icons/app_icons.dart';
import 'package:event_platform/view/components/custom_image/custom_image.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:event_platform/view/screen/role_screen/dentist/profile/view/profile_screen/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadsScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  DownloadsScreen({super.key});

  final List<String> downloadItems = const [
    "termsAndConditions",
    "labForms",
    "priceList",
    "labCertificates",
    "labGuidesForProcedures",
    "priceGuide",
    "sportsGuardColours",
    "freepostLabels",
    "crossInfectionPolicy",
  ];

  Future<void> _downloadTermsCondition() async {
    try {
      // First check if data exists
      String? termsText = controller.getStoredTerms();
      if (termsText == null || termsText.isEmpty) {
        Get.snackbar("Error", "No Terms & Conditions found. Please load data first.");
        return;
      }

      if (Platform.isAndroid) {
        // Android version check
        final androidInfo = await DeviceInfoPlugin().androidInfo;

        if (androidInfo.version.sdkInt >= 30) {
          // Android 11+ (API 30+)
          if (!await Permission.manageExternalStorage.isGranted) {
            final status = await Permission.manageExternalStorage.request();

            if (!status.isGranted) {
              Get.defaultDialog(
                title: "Permission Required",
                middleText: "Please enable 'All files access' from app settings",
                textConfirm: "Open Settings",
                textCancel: "Cancel",
                onConfirm: () {
                  openAppSettings();
                  Get.back();
                },
              );
              return;
            }
          }
        } else {
          // Android 10 and below
          if (!await Permission.storage.isGranted) {
            final status = await Permission.storage.request();

            if (!status.isGranted) {
              Get.snackbar("Permission Denied", "Storage permission is required");
              return;
            }
          }
        }
      }

      // Download folder path
      Directory? directory;

      if (Platform.isAndroid) {
        // Try public Downloads folder first
        directory = Directory('/storage/emulated/0/Download');

        if (!await directory.exists()) {
          directory = Directory('/storage/emulated/0/Downloads'); // some devices use this
        }

        if (!await directory.exists()) {
          // Fallback to app-specific directory
          directory = await getExternalStorageDirectory();
        }
      } else if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      }

      if (directory == null) {
        Get.snackbar("Error", "Could not access storage");
        return;
      }

      // Create unique filename
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = 'terms_and_conditions_$timestamp.txt';
      final file = File('${directory.path}/$fileName');

      // Write file
      await file.writeAsString(termsText);

      Get.snackbar(
        "Success ✅",
        "File downloaded successfully!\nLocation: ${file.path}",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      debugPrint("✅ File saved at: ${file.path}");

    } catch (e) {
      Get.snackbar(
        "Error ❌",
        "Failed to download: $e",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      debugPrint("❌ Download Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(
        leftIcon: true,
        titleName: 'downloads'.tr,
        color: AppColors.primary,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: downloadItems.length,
          itemBuilder: (context, index) {
            final item = downloadItems[index];
            return ListTile(
              title: Text(
                downloadItems[index].tr,
                style: const TextStyle(fontSize: 16),
              ),
              trailing: IconButton(
                icon: CustomImage(imageSrc: AppIcons.download),
                onPressed: () async {
                  if (item == 'termsAndConditions') {
                    // Check if data loaded
                    if (controller.getStoredTerms() == null) {
                      Get.snackbar("Loading", "Please wait, loading terms...");
                      await controller.getTermsConditions();
                    }
                    await _downloadTermsCondition();
                  } else {
                    Get.snackbar("Info", "Download for $item coming soon");
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}