import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_button/custom_button.dart';
import 'package:event_platform/view/components/custom_from_card/custom_from_card.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../components/custom_nav_bar/navbar.dart';
import '../../../../../components/custom_text/custom_text.dart';

class AddCaseScreen extends StatelessWidget {
  const AddCaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(leftIcon: true, titleName: 'Create New Case', color: AppColors.primary,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              CustomFormCard(title: 'Case Title', hintText: 'Enter case title', controller: TextEditingController()),
              CustomFormCard(title: 'Patient Name', hintText: 'Type Patient’s full name', controller: TextEditingController()),
              CustomFormCard(title: 'Issue Type', hintText: 'Select issue type', controller: TextEditingController()),
              CustomFormCard(title: 'Order Type', hintText: 'Select order type', controller: TextEditingController()),
              CustomFormCard(title: 'Case Notes', hintText: 'Provide a description of the case and patient’s needs', maxLine: 3, controller: TextEditingController()),
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: AppColors.grey1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload_file,
                        size: 50, color: AppColors.grey1),
                    CustomText(
                      top: 10.h,
                      text: 'Upload a photo or video',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.grey1,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              CustomButton(onTap: (){}, title: 'Submit Case', fontSize: 16, fontWeight: FontWeight.w400, borderRadius: 10,),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(currentIndex: 2),
    );
  }
}
