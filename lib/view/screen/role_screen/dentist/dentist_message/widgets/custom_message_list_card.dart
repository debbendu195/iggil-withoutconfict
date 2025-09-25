import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../../../utils/app_const/app_const.dart';
import '../../../../../components/custom_netwrok_image/custom_network_image.dart';
import '../../../../../components/custom_text/custom_text.dart';

class CustomMessageList extends StatelessWidget {
  const CustomMessageList({
    super.key,
    this.img,
    this.title,
    this.subtitle,
    this.time,
  });

  final String? img;
  final String? title;
  final String? subtitle;
  final String? time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImage(
            imageUrl: img ?? AppConstants.girlsPhoto,
            height: 50.h,
            width: 50.w,
            boxShape: BoxShape.circle,
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title ?? "",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 4),
                  CustomText(
                    text: subtitle ?? "",
                    fontSize: 14,
                    color: AppColors.black_02,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),

          CustomText(
            text: time ?? '',
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
