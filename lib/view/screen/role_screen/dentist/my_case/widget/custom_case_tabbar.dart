import 'package:flutter/material.dart';

import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../components/custom_text/custom_text.dart';

class CustomCaseTabbar extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final Color selectedColor;
  final Color? textColor;
  final bool? isPadding;

  const
  CustomCaseTabbar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.selectedColor,
    this.textColor,
    this.isPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Horizontal scroll
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(tabs.length, (index) {
          bool isSelected = index == selectedIndex;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () => onTabSelected(index),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isSelected ? selectedColor : AppColors.white,
                  border: Border.all(
                    color: isSelected ? selectedColor : AppColors.primary,
                    width: 1,
                  ),
                ),
                child: CustomText(
                  text: tabs[index],
                  color: isSelected ? AppColors.white : AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
