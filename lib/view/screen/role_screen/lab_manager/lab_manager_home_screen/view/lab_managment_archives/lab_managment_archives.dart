import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';

import '../../widget/lab_managment_archives/custom_lab_managment_archived.dart';

class LabManagmentArchives extends StatelessWidget {
  const LabManagmentArchives({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true, titleName: 'Archived', color: AppColors.primary,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: List.generate(2, (value) {
              return CustomLabManagmentArchived();
            }),
          ),
        ),
      ),
    );
  }
}
