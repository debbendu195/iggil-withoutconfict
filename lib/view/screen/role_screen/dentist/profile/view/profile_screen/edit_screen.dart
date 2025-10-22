import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_button/custom_button.dart';
import 'package:event_platform/view/components/custom_from_card/custom_from_card.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:event_platform/view/components/custom_loader/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../service/api_url.dart';
import '../../../../../../../utils/app_const/app_const.dart';
import '../../../../../../../utils/app_strings/app_strings.dart';
import '../../../../../../components/custom_netwrok_image/custom_network_image.dart';
import 'controller/profile_controller.dart';

class EditScreen extends StatelessWidget {
  EditScreen({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    // Fetch user profile when screen opens
    profileController.getUserProfile();


    return Scaffold(
      appBar: CustomRoyelAppbar(
        leftIcon: true,
        titleName: 'editProfile'.tr,
        color: AppColors.primary,
      ),
      body: Obx(() {
        // ✅ Show loader while fetching profile
        if (profileController.rxRequestStatus.value == Status.loading) {
          return const Center(child: CustomLoader());
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 140.h,
                        width: 140.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ClipOval(
                            child: profileController.selectedImage.value != null
                                ? Image.file(
                              profileController.selectedImage.value!,
                              fit: BoxFit.cover,
                              height: 140.h,
                              width: 140.w,
                            )
                                : (profileController.userProfileModel.value.photo.isNotEmpty
                                ? Image.network(
                              "${ApiUrl.baseUrl}/${profileController.userProfileModel.value.photo}",
                              fit: BoxFit.cover,
                              height: 140.h,
                              width: 140.w,
                            )
                                : CustomNetworkImage(
                              imageUrl: AppStrings.exampleEmail, // fallback or placeholder
                              height: 140.h,
                              width: 140.w,
                              boxShape: BoxShape.circle,
                            )),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 120.w,
                      bottom: 10.w,
                      child: GestureDetector(
                        onTap: () {
                          profileController.pickImageFromGallery();
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: AppColors.grey1,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.edit, size: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                CustomText(
                  text: 'tapToChangePhoto'.tr,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),

                /// ✅ Form Fields
                Obx(() => CustomFormCard(
                  title: 'name'.tr,
                  hintText: 'Debbendu Paul',
                  controller: profileController.nameController.value,
                )),
                Obx(() => CustomFormCard(
                  title: 'email'.tr,
                  hintText: AppStrings.exampleEmail,
                  controller: profileController.emailController.value,
                  readOnly: true,
                )),
                Obx(() => CustomFormCard(
                  title: 'dateOfBirth'.tr,
                  hintText: '28-11-1997',
                  controller: profileController.dateOfBirthController.value,
                )),
                Obx(() => CustomFormCard(
                  title: 'country'.tr,
                  hintText: 'United State',
                  controller: profileController.countryController.value,
                )),
                Obx(() => CustomFormCard(
                  title: 'phoneNumber'.tr,
                  hintText: '+123456789',
                  controller: profileController.phoneNumberController.value,
                )),

                const SizedBox(height: 20),

                /// ✅ Save Button or Loader
                Obx(() => profileController.updateProfileLoading.value
                    ? const CustomLoader()
                    : CustomButton(
                  onTap: () {
                    profileController.updateProfile();
                  },
                  title: 'save'.tr,
                  borderRadius: 15,
                )),
              ],
            ),
          ),
        );
      }),
    );
  }
}
