import 'package:event_platform/view/components/custom_nav_bar/lab_manager_navbar.dart';
import 'package:event_platform/view/screen/role_screen/lab_manager/lab_managment_massage/widgets/custom_lab_message_list_card.dart';
import 'package:flutter/material.dart';

import '../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../../utils/app_strings/app_strings.dart';
import '../../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../components/custom_text_field/custom_text_field.dart';

class LabMassageList extends StatelessWidget {
  const LabMassageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: false, titleName: "Messages"),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomTextField(
              hintText: AppStrings.search,
              fillColor: Colors.transparent,
              hintStyle: TextStyle(color: AppColors.black_80,),
              textEditingController: TextEditingController(),
              fieldBorderColor: AppColors.grey,
            ),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: 20,
              separatorBuilder: (context, index) =>
                  SizedBox(height: 20),
              itemBuilder: (context, index) {
                return CustomLabMessageListCard(
                  title: 'Chat with Andrew',
                  subtitle: 'This is a subtitle for user',
                  time: '10:00 AM',
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: LabManagerNavbar(currentIndex: 2,),
    );
  }
}
