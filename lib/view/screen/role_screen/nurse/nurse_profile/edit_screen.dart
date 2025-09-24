import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_button/custom_button.dart';
import 'package:event_platform/view/components/custom_from_card/custom_from_card.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../utils/app_const/app_const.dart';
import '../../../../components/custom_netwrok_image/custom_network_image.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true, titleName: 'Edit Profile', color: AppColors.primary,),
      body: SingleChildScrollView(
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
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: CustomNetworkImage(
                          imageUrl: AppConstants.profileImage,
                          height: 70.h,
                          width: 70.w,
                          boxShape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 120.w,
                    bottom: 10.w,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: AppColors.grey1,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.edit, size: 15, color: AppColors.primary,),
                    ),
                  ),
                ],
              ),
              CustomText(text: 'Tap to change photo', fontWeight: FontWeight.w400, fontSize: 12,),
              CustomFormCard(title: 'Name', hintText: 'Debbendu Paul', controller: TextEditingController()),
              CustomFormCard(title: 'Email', hintText: 'debbendupaul195@gmail.com', controller: TextEditingController()),
              CustomFormCard(title: 'Date of Birth', hintText: '28-11-1997', controller: TextEditingController()),
              CustomFormCard(title: 'Country', hintText: 'United State', controller: TextEditingController()),
              CustomFormCard(title: 'Phone Number', hintText: '+123456789', controller: TextEditingController()),
              CustomButton(onTap: (){}, title: 'Save', borderRadius: 15,)
            ],
          ),
        ),
      ),
    );
  }
}
