import 'package:flutter/material.dart';

import '../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../../utils/app_icons/app_icons.dart';
import '../../../../../../components/custom_image/custom_image.dart';
import '../../../../../../components/custom_royel_appbar/custom_royel_appbar.dart';

class LabManagerDownload extends StatelessWidget {
  const LabManagerDownload({super.key});

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
      body: ListView.builder(
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
    );
  }
}
