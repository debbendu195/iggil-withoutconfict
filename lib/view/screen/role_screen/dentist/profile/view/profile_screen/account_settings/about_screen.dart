import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../../../utils/app_const/app_const.dart';
import '../../../../../../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../../../../components/custom_loader/custom_loader.dart';
import '../../../../../../../components/general_error.dart';
import '../controller/profile_controller.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    // Call the API when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profileController.getAboutUs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(
        leftIcon: true,
        titleName: 'aboutUs'.tr,
        color: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Obx(() {
          switch (profileController.rxAboutStatus.value) {
            case Status.loading:
              return const Center(
                child: CustomLoader(),
              );
            case Status.internetError:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.wifi_off, size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    Text(
                      'noInternetConnection'.tr,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => profileController.getAboutUs(),
                      child: Text('retry'.tr),
                    ),
                  ],
                ),
              );
            case Status.error:
              return GeneralErrorScreen(
                onTap: () => profileController.getAboutUs(),
              );
            case Status.completed:
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HtmlWidget(
                      profileController.aboutModel.value.aboutUs ??
                          'noAboutUsAvailable'.tr,
                      textStyle: TextStyle(
                        color: AppColors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              );
          }
        }),
      ),
    );
  }
}