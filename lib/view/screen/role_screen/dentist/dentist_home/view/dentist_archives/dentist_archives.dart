import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';

import '../../widget/dntist_archives/custom_dentist_archived.dart';

class DentistArchives extends StatelessWidget {
  const DentistArchives({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true, titleName: 'Archived', color: AppColors.primary,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: List.generate(2, (value) {
              return CustomDentistArchived();
            }),
          ),
        ),
      ),
    );
  }
}
