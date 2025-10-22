import 'package:event_platform/view/components/custom_button/custom_button.dart';
import 'package:event_platform/view/components/custom_from_card/custom_from_card.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../utils/app_strings/app_strings.dart';
import '../../../../../../../components/custom_loader/custom_loader.dart';
import '../controller/profile_controller.dart';

class ChangePassScreen extends StatelessWidget {
  ChangePassScreen({super.key});

  final profileController = Get.put(ProfileController());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true, titleName: "Change Password"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: Form(
          key: formKey,
          child: Obx(() {
            return Column(
              children: [
                CustomFormCard(
                  title: "Old Password",
                  titleColor: Color(0xff344054),
                  hintText: "*****",
                  isPassword: true,
                  controller: profileController.oldPasswordController.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.fieldCantBeEmpty;
                    }
                    return null;
                  },
                ),
                CustomFormCard(
                  title: "New Password",
                  titleColor: Color(0xff344054),
                  hintText: "*****",
                  isPassword: true,
                  controller: profileController.newPasswordController.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.fieldCantBeEmpty;
                    }
                    return null;
                  },
                ),
                CustomFormCard(
                  title: "Confirm Password",
                  titleColor: Color(0xff344054),
                  hintText: "*****",
                  isPassword: true,
                  controller: profileController.confirmPasswordController.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.fieldCantBeEmpty;
                    } else if (value !=
                        profileController.newPasswordController.value.text) {
                      return AppStrings.passwordNotMatch;
                    }
                    return null;
                  },
                ),

                Spacer(),
                profileController.userChangePasswordLoading.value
                    ? CustomLoader()
                    : CustomButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        profileController.userChangePassword();
                      }
                    },
                    title: "Change Password"),
              ],
            );
          }),
        ),
      ),
    );
  }
}