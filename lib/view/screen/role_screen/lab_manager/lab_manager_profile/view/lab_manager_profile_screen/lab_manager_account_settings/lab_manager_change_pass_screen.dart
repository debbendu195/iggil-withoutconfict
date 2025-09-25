import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_button/custom_button.dart';
import 'package:event_platform/view/components/custom_from_card/custom_from_card.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';

class LabManagerChangePassScreen extends StatelessWidget {
  const LabManagerChangePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true, titleName: 'Change Password', color: AppColors.primary,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CustomFormCard(title: 'Current Password', hintText: '******', isPassword: true, controller: TextEditingController()),
            CustomFormCard(title: 'New Password', hintText: '******', isPassword: true, controller: TextEditingController()),
            CustomFormCard(title: 'Confirm Password', hintText: '******', isPassword: true, controller: TextEditingController()),
            CustomButton(onTap: (){}, title: 'Update Password', borderRadius: 10,)
          ],
        ),
      ),
    );
  }
}
