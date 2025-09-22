import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../components/custom_text/custom_text.dart';

class CustomDropdown extends StatefulWidget {
  final String label;
  final String hint;
  final List<String> items;
  final Function(String) onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.hint,
    required this.items,
    required this.onChanged,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: widget.label,
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
        ),
        SizedBox(height: 8.h),
        InkWell(
          onTap: () => setState(() => expanded = !expanded),
          child: Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: selectedValue ?? widget.hint,
                  color: (selectedValue == null)
                      ? AppColors.grey
                      : AppColors.black,
                  fontSize: 12.sp,
                ),
                Icon(
                  expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: AppColors.black,
                ),
              ],
            ),
          ),
        ),
        if (expanded)
          Container(
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: widget.items.map((item) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedValue = item;
                      expanded = false;
                    });
                    widget.onChanged(item);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: item != widget.items.last
                              ? Colors.grey.shade300
                              : Colors.transparent,
                          width: 1,
                        ),
                      ),
                    ),
                    child: CustomText(
                      text: item,
                      color: AppColors.black,
                      fontSize: 13.sp,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
