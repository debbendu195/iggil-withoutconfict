import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';

import '../../../../../components/custom_text/custom_text.dart';
import '../../../lab_manager/lab_manager_home_screen/widget/lab_managment_archives/custom_lab_managment_archived.dart';

class NurseArchives extends StatelessWidget {
  const NurseArchives({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(
        leftIcon: true,
        titleName: 'Archived',
        color: AppColors.primary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Case Title',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: 'Date',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomText(
                          text: 'Action',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: List.generate(20, (value) {
                  return CustomLabManagmentArchived();
                }),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
