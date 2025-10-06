import 'package:event_platform/view/components/custom_nav_bar/navbar.dart';
import 'package:event_platform/view/screen/role_screen/dentist/dentist_message/widgets/custom_message_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../components/custom_text_field/custom_text_field.dart';

class DentistMessage extends StatelessWidget {
  const DentistMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(
        leftIcon: false,
        titleName: 'messages'.tr,
        color: AppColors.primary,
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomTextField(
                hintText: 'search'.tr,
                fillColor: Colors.transparent,
                hintStyle: TextStyle(color: AppColors.black_80),
                textEditingController: TextEditingController(),
                fieldBorderColor: AppColors.grey,
              ),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: 20,
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return CustomMessageList(
                    title: 'chatWithAndrew'.tr,
                    subtitle: 'messageSubtitle'.tr,
                    time: '10:00 AM',
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(currentIndex: 2),
    );
  }
}
