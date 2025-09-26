import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';

import '../../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../components/custom_text/custom_text.dart';

class LangauageScreen extends StatefulWidget {
  const LangauageScreen({super.key});

  @override
  State<LangauageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LangauageScreen> {
  String selectedLang = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(
        leftIcon: true,
        titleName: 'Language Settings',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Language',
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            const SizedBox(height: 10),

            /// Dropdown inside styled container
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white_50,
              ),
              child: DropdownButtonFormField<String>(
                value: selectedLang,
                icon: const Icon(Icons.keyboard_arrow_down),
                decoration: const InputDecoration(
                  border: InputBorder.none, // Remove underline
                ),
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                dropdownColor: AppColors.white,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLang = newValue!;
                  });
                },
                items: <String>['English', 'Chinese']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: CustomText(
                      text: value,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
