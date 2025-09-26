import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/utils/app_icons/app_icons.dart';
import 'package:event_platform/view/components/custom_image/custom_image.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  final List<String> downloadItems = const [
    "Terms and Conditions",
    "Lab Forms",
    "Price List",
    "Lab Certificates",
    "Lab Guides for Procedures",
    "Price Guide",
    "Sports Guard Colours",
    "Freepost Labels",
    "Cross Infection Policy",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true, titleName: 'Downloads', color: AppColors.primary,),
      body: SafeArea(
        child: ListView.builder(
          itemCount: downloadItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                downloadItems[index],
                style: const TextStyle(fontSize: 16),
              ),
              trailing: IconButton(
                icon: CustomImage(imageSrc: AppIcons.download),
                onPressed: () {
                  // your onPressed code
                },
              ),
        
            );
          },
        ),
      ),
    );
  }
}
