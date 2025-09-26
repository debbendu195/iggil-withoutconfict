import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../components/custom_button/custom_button.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(text: 'This is the demo screen for frontend', fontSize: 20, textAlign: TextAlign.center,),
            SizedBox(height: 50),
            CustomButton(onTap: (){
              Get.toNamed(AppRoutes.dentistListScreen);
            },
              title: 'Dentist login',),
            SizedBox(height: 10),
            CustomButton(onTap: (){
              Get.toNamed(AppRoutes.labManagerListScreen);
            },
              title: 'Lab manager',
            ),
            SizedBox(height: 10),
            CustomButton(onTap: (){
              Get.toNamed(AppRoutes.practiceManagerListScreen);
            },
              title: 'Practice manager',
            ),
            SizedBox(height: 10),
            CustomButton(onTap: (){
              Get.toNamed(AppRoutes.technicianListScreen);
            },
              title: 'Lab Technician',
            ),
            SizedBox(height: 10),
            CustomButton(onTap: (){
              Get.toNamed(AppRoutes.nurseListScreen);
            },
              title: 'Nurse',
            ),
          ],
        ),
      ),
    );
  }
}
