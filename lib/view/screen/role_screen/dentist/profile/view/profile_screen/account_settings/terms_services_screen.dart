import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../utils/app_const/app_const.dart';
import '../../../../../../../components/custom_loader/custom_loader.dart';
import '../../../../../../../components/general_error.dart';
import '../controller/profile_controller.dart';

class TermsServicesScreen extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

   TermsServicesScreen({super.key}){
     profileController.getTermsConditions();
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(
        leftIcon: true,
        titleName: 'termsOfServices'.tr,
        color: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(
              () {
            switch (profileController.rxTermsStatus.value) {
              case Status.loading:
                return Center(
                  child: CustomLoader(),
                );
              case Status.internetError:
                return Center(
                  child: CustomLoader(),
                );
              case Status.error:
                return GeneralErrorScreen(
                    onTap: () => profileController.getTermsConditions());
              case Status.completed:
                return Column(
                  children: [
                    HtmlWidget(
                      profileController.termsModel.value.termsCondition != null
                          ? profileController.termsModel.value.termsCondition!
                          : 'About Us Is Empty Data',
                      textStyle: TextStyle(
                        color: AppColors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
