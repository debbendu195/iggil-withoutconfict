import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/utils/app_icons/app_icons.dart';
import 'package:event_platform/view/components/custom_image/custom_image.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(
        leftIcon: true,
        titleName: 'downloads'.tr, // translation key
        color: AppColors.primary,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: downloadItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                downloadItems[index].tr,
                style: const TextStyle(fontSize: 16),
              ),
              trailing: IconButton(
                icon: CustomImage(imageSrc: AppIcons.download),
                onPressed: () {
                  // download action
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
