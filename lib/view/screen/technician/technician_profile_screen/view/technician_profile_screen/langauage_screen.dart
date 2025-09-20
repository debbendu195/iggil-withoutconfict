import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../components/custom_text/custom_text.dart';

class LangauageScreen extends StatelessWidget {
  const LangauageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true, titleName: 'Language Settings',),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: 'Language', fontWeight: FontWeight.w500, fontSize: 16,),
            SizedBox(height: 10,),
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
                      text: 'Select Language',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_down,
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