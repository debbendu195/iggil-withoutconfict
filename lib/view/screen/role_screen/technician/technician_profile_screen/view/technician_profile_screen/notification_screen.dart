import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';

import '../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../components/custom_text/custom_text.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true, titleName: 'Notification', color: AppColors.primary),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white_50,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CustomText(
                      text: 'General notification',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    Spacer(),
                    Switch(
                        activeColor: AppColors.primary, value: true, onChanged: (value) {}
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white_50,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CustomText(
                      text: 'General notification',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    Spacer(),
                    Switch(
                        activeColor: AppColors.primary, value: true, onChanged: (value) {}
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white_50,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CustomText(
                      text: 'General notification',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    Spacer(),
                    Switch(
                        activeColor: AppColors.primary, value: true, onChanged: (value) {}
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white_50,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CustomText(
                      text: 'General notification',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    Spacer(),
                    Switch(
                        activeColor: AppColors.primary, value: true, onChanged: (value) {}
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white_50,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CustomText(
                      text: 'General notification',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    Spacer(),
                    Switch(
                        activeColor: AppColors.primary, value: true, onChanged: (value) {}
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white_50,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CustomText(
                      text: 'General notification',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    Spacer(),
                    Switch(
                        activeColor: AppColors.primary, value: true, onChanged: (value) {}
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}