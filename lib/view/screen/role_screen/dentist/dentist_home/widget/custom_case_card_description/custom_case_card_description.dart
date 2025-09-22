import 'package:flutter/material.dart';
import '../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../components/custom_text/custom_text.dart';

class CustomCaseCardDescription extends StatelessWidget {
  final String? item1;
  final String? item2;

  const CustomCaseCardDescription(
      {super.key, this.item1, this.item2,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: item1 ?? 'Clinic',
          color: AppColors.primary,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        CustomText(
          text: item2 ?? 'MDC',
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ],
    );
  }
}
