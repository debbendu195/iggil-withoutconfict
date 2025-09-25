import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_button/custom_button.dart';
import 'package:event_platform/view/components/custom_from_card/custom_from_card.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/custom_dropdown.dart';

class AddCaseScreen extends StatefulWidget {
  const AddCaseScreen({super.key});

  @override
  State<AddCaseScreen> createState() => _AddCaseScreenState();
}

class _AddCaseScreenState extends State<AddCaseScreen> {
  String? caseType;
  String? patientId;
  String? gender;
  String? age;
  String? scanNumber;
  String? tier;

  /// Standard & Crown/Bridge
  String? standardType;
  String? crownType;

  /// PFM (NP) sub-option
  String? pfmOption;

  /// Show new dropdown for Single Unit Crown
  bool showSingleUnitDropdown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(
        leftIcon: true,
        titleName: 'Create New Case',
        color: AppColors.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Case Type
            CustomDropdown(
              label: "Case Type",
              hint: "Select case type",
              items: ["New Case", "Continue Case", "Remake"],
              onChanged: (val) => setState(() => caseType = val),
            ),
            SizedBox(height: 20.h),

            if (caseType == "New Case") ...[
              /// Patient ID
              CustomFormCard(title: 'Patient ID', controller: TextEditingController()),

              /// Patient Gender
              CustomDropdown(
                label: "Patient Gender",
                hint: "Select M/F",
                items: ["M", "F"],
                onChanged: (val) => setState(() => gender = val),
              ),
              SizedBox(height: 15.h),

              /// Age
              CustomFormCard(title: 'Age', controller: TextEditingController()),

              /// Scan Number
              CustomFormCard(title: 'Scan Number', controller: TextEditingController()),

              /// Product Tier
              CustomDropdown(
                label: "Product Tier",
                hint: "Select product tier",
                items: ["Standard", "Premium"],
                onChanged: (val) => setState(() => tier = val),
              ),
              SizedBox(height: 20.h),

              /// If tier == Standard
              if (tier == "Standard") ...[
                CustomDropdown(
                  label: "Standard Type",
                  hint: "Select Type",
                  items: ["CROWN/BRIDGE", "DENTURES", "MISC"],
                  onChanged: (val) => setState(() => standardType = val),
                ),
                SizedBox(height: 20.h),

                /// If Standard Type == CROWN/BRIDGE
                if (standardType == "CROWN/BRIDGE") ...[
                  CustomDropdown(
                    label: "Crown / BRIDGE Type",
                    hint: "Select Crown Type",
                    items: ["PFM (NP)", "FULL CAST", "METAL"],
                    onChanged: (val) => setState(() => crownType = val),
                  ),
                  SizedBox(height: 20.h),

                  /// If Crown Type == PFM (NP)
                  if (crownType == "PFM (NP)") ...[
                    CustomDropdown(
                      label: "PFM (NP) Type",
                      hint: "Select option",
                      items: ["Single unit crown", "Maryiand bridge", "Conventional Bridge"],
                      onChanged: (val) => setState(() {
                        pfmOption = val;
                        showSingleUnitDropdown = val == "Single unit crown";
                      }),
                    ),
                    SizedBox(height: 20.h),

                    /// New dropdown for Single Unit Crown
                    if (showSingleUnitDropdown) ...[
                      CustomDropdown(
                        label: "Porcelain Butt Margin",
                        hint: "Select detail",
                        items: ["360", "Buccal Only"], // customize as needed
                        onChanged: (val) {},
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ],

                  /// If Crown Type == FULL CAST
                  if (crownType == "FULL CAST") ...[
                    CustomDropdown(
                      label: "NP (silver coloured)",
                      hint: "Select option",
                      items: ["Option A", "Option B", "Option C"],
                      onChanged: (val) {},
                    ),
                    SizedBox(height: 20.h),
                  ],

                  /// If Crown Type == METAL
                  if (crownType == "METAL") ...[
                    CustomDropdown(
                      label: "METAL Options",
                      hint: "Select option",
                      items: ["Option X", "Option Y", "Option Z"],
                      onChanged: (val) {},
                    ),
                    SizedBox(height: 20.h),
                  ],
                ],
              ],

              /// If tier == Premium
              if (tier == "Premium") ...[
                CustomDropdown(
                  label: "Premium Type",
                  hint: "Select type",
                  items: ["T2-X", "T2-Y", "T2-Z"],
                  onChanged: (val) {},
                ),
                SizedBox(height: 20.h),
              ],

              /// Submit Button
              CustomButton(onTap: () {}, title: 'Submit Case'),
            ]
          ],
        ),
      ),
    );
  }
}
