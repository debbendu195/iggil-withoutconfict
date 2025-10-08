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

  /// Full Cast sub-option
  String? fullCastOption;

  /// Denture sub-option
  String? dentureOption;
  String? dentureConstructionOption;

  /// METAL sub-option
  String? metalOption;

  /// Show dropdown control
  bool showSingleUnitDropdown = false;
  bool showMarylandBridgeDropdown = false;
  bool showConventionalBridgeDropdown = false;

  bool showFullCastSingleUnit = false;
  bool showFullCastBridge = false;
  bool showFullCastPostCore = false;

  bool showDentureConstruction = false;
  bool showDentureOther = false;

  bool showEmaxDropdown = false;
  bool showZirconiaDropdown = false;
  bool showCompositeDropdown = false;

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

                /// ===========================
                /// CROWN / BRIDGE SECTION
                /// ===========================
                if (standardType == "CROWN/BRIDGE") ...[
                  CustomDropdown(
                    label: "Crown / BRIDGE Type",
                    hint: "Select Crown Type",
                    items: ["PFM (NP)", "FULL CAST", "METAL"],
                    onChanged: (val) => setState(() => crownType = val),
                  ),
                  SizedBox(height: 20.h),

                  /// ---------- PFM (NP) ----------
                  if (crownType == "PFM (NP)") ...[
                    CustomDropdown(
                      label: "PFM (NP) Type",
                      hint: "Select option",
                      items: ["Single unit crown", "Maryland bridge", "Conventional Bridge"],
                      onChanged: (val) => setState(() {
                        pfmOption = val;
                        showSingleUnitDropdown = val == "Single unit crown";
                        showMarylandBridgeDropdown = val == "Maryland bridge";
                        showConventionalBridgeDropdown = val == "Conventional Bridge";
                      }),
                    ),
                    SizedBox(height: 20.h),

                    if (showSingleUnitDropdown) ...[
                      CustomDropdown(
                        label: "Porcelain Butt Margin",
                        hint: "Select detail",
                        items: ["360", "Buccal Only"],
                        onChanged: (val) {},
                      ),
                      SizedBox(height: 20.h),
                    ],

                    if (showMarylandBridgeDropdown) ...[
                      CustomDropdown(
                        label: "Maryland Bridge Type",
                        hint: "Select option",
                        items: [
                          "Full pontic support",
                          "Modified ridge lap pontic",
                          "No contact pontic",
                          "Point contact pontic",
                          "Ovate pontic",
                        ],
                        onChanged: (val) {},
                      ),
                      SizedBox(height: 20.h),
                    ],

                    if (showConventionalBridgeDropdown) ...[
                      CustomDropdown(
                        label: "Conventional Bridge Type",
                        hint: "Select option",
                        items: [
                          "Full Ridge",
                          "Modified ridge lap",
                          "No contact",
                          "Point contact",
                          "Point in socket",
                        ],
                        onChanged: (val) {},
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ],

                  /// ---------- FULL CAST ----------
                  if (crownType == "FULL CAST") ...[
                    CustomDropdown(
                      label: "FULL CAST Parent Option",
                      hint: "Select option",
                      items: ["Single Unit Bridge", "Bridge"], // Post & Core removed
                      onChanged: (val) => setState(() {
                        fullCastOption = val;
                        showFullCastSingleUnit = val == "Single Unit Bridge";
                        showFullCastBridge = val == "Bridge";
                        showFullCastPostCore = false;
                      }),
                    ),
                    SizedBox(height: 20.h),

                    if (showFullCastSingleUnit) ...[
                      CustomDropdown(
                        label: "Single Unit Detail",
                        hint: "Select option",
                        items: ["360", "Buccal Only"],
                        onChanged: (val) {},
                      ),
                      SizedBox(height: 20.h),
                    ],

                    if (showFullCastBridge) ...[
                      CustomDropdown(
                        label: "Bridge Type",
                        hint: "Select option",
                        items: [
                          "Full Ridge",
                          "Modified ridge lap",
                          "No contact",
                          "Point contact",
                          "Point in socket",
                        ],
                        onChanged: (val) {},
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ],

                  /// ---------- METAL for Standard ----------
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

                /// ===========================
                /// DENTURE SECTION
                /// ===========================
                if (standardType == "DENTURES") ...[
                  CustomDropdown(
                    label: "Denture Type",
                    hint: "Select option",
                    items: ["Denture Construction", "Denture Other"],
                    onChanged: (val) => setState(() {
                      dentureOption = val;
                      showDentureConstruction = val == "Denture Construction";
                      showDentureOther = val == "Denture Other";
                    }),
                  ),
                  SizedBox(height: 20.h),

                  if (showDentureConstruction) ...[
                    CustomDropdown(
                      label: "Denture Construction Options",
                      hint: "Select stage",
                      items: [
                        "Bite Block",
                        "Special Tray",
                        "Clasps",
                        "Mesh Reinforcement",
                        "Try In",
                        "Re-Try In",
                        "Finish",
                      ],
                      onChanged: (val) => setState(() {
                        dentureConstructionOption = val;
                      }),
                    ),
                    SizedBox(height: 20.h),

                    if (dentureConstructionOption == "Re-Try In" ||
                        dentureConstructionOption == "Finish") ...[
                      CustomDropdown(
                        label: "Select Teeth",
                        hint: "Select Teeth",
                        items: ["Anterior", "Posterior", "Full Arch"],
                        onChanged: (val) {},
                      ),
                      SizedBox(height: 15.h),
                      CustomDropdown(
                        label: "Select Shade",
                        hint: "Select Shade",
                        items: ["A1", "A2", "A3", "B1", "B2", "B3"],
                        onChanged: (val) {},
                      ),
                      SizedBox(height: 15.h),
                    ],
                  ],

                  if (showDentureOther) ...[
                    CustomDropdown(
                      label: "Denture Other Options",
                      hint: "Select option",
                      items: ["Repair", "Reline", "Rebase"],
                      onChanged: (val) {},
                    ),
                    SizedBox(height: 20.h),
                  ],
                ],
              ],

              /// ===========================
              /// Premium Tier
              /// ===========================
              if (tier == "Premium") ...[
                CustomDropdown(
                  label: "Premium Type",
                  hint: "Select Type",
                  items: ["CROWN/BRIDGE", "DENTURES", "IMPLANTS", "ORTHODONTIC", "MISC"],
                  onChanged: (val) => setState(() => standardType = val),
                ),
                SizedBox(height: 20.h),

                /// Premium: CROWN / BRIDGE
                if (standardType == "CROWN/BRIDGE") ...[
                  CustomDropdown(
                    label: "Crown / BRIDGE Type",
                    hint: "Select Crown Type",
                    items: ["PFM (NP)", "FULL CAST", "METAL"],
                    onChanged: (val) => setState(() => crownType = val),
                  ),
                  SizedBox(height: 20.h),

                  /// PFM (NP)
                  if (crownType == "PFM (NP)") ...[
                    CustomDropdown(
                      label: "PFM (NP) Type",
                      hint: "Select option",
                      items: ["Single unit crown", "Maryland bridge", "Conventional Bridge"],
                      onChanged: (val) => setState(() {
                        pfmOption = val;
                        showSingleUnitDropdown = val == "Single unit crown";
                        showMarylandBridgeDropdown = val == "Maryland bridge";
                        showConventionalBridgeDropdown = val == "Conventional Bridge";
                      }),
                    ),
                    SizedBox(height: 20.h),

                    if (showSingleUnitDropdown) ...[
                      CustomDropdown(
                        label: "Porcelain Butt Margin",
                        hint: "Select detail",
                        items: ["360", "Buccal Only"],
                        onChanged: (val) {},
                      ),
                      SizedBox(height: 20.h),
                    ],

                    if (showMarylandBridgeDropdown) ...[
                      CustomDropdown(
                        label: "Maryland Bridge Type",
                        hint: "Select option",
                        items: [
                          "Full pontic support",
                          "Modified ridge lap pontic",
                          "No contact pontic",
                          "Point contact pontic",
                          "Ovate pontic",
                        ],
                        onChanged: (val) {},
                      ),
                      SizedBox(height: 20.h),
                    ],

                    if (showConventionalBridgeDropdown) ...[
                      CustomDropdown(
                        label: "Conventional Bridge Type",
                        hint: "Select option",
                        items: [
                          "Full Ridge",
                          "Modified ridge lap",
                          "No contact",
                          "Point contact",
                          "Point in socket",
                        ],
                        onChanged: (val) {},
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ],

                  /// FULL CAST
                  if (crownType == "FULL CAST") ...[
                    CustomDropdown(
                      label: "FULL CAST Parent Option",
                      hint: "Select option",
                      items: ["Single Unit Bridge", "Bridge"], // Post & Core removed
                      onChanged: (val) => setState(() {
                        fullCastOption = val;
                        showFullCastSingleUnit = val == "Single Unit Bridge";
                        showFullCastBridge = val == "Bridge";
                        showFullCastPostCore = false;
                      }),
                    ),
                    SizedBox(height: 20.h),

                    if (showFullCastSingleUnit) ...[
                      CustomDropdown(
                        label: "Single Unit Detail",
                        hint: "Select option",
                        items: ["360", "Buccal Only"],
                        onChanged: (val) {},
                      ),
                      SizedBox(height: 20.h),
                    ],

                    if (showFullCastBridge) ...[
                      CustomDropdown(
                        label: "Bridge Type",
                        hint: "Select option",
                        items: [
                          "Full Ridge",
                          "Modified ridge lap",
                          "No contact",
                          "Point contact",
                          "Point in socket",
                        ],
                        onChanged: (val) {},
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ],

                  /// METAL for Premium with sub-dropdown
                  if (crownType == "METAL") ...[
                    CustomDropdown(
                      label: "METAL Options",
                      hint: "Select option",
                      items: ["Emax", "Zirconia", "Composite Onlay"],
                      onChanged: (val) => setState(() {
                        metalOption = val;
                        showEmaxDropdown = val == "Emax";
                        showZirconiaDropdown = val == "Zirconia";
                        showCompositeDropdown = val == "Composite Onlay";
                      }),
                    ),
                    SizedBox(height: 20.h),

                    if (showEmaxDropdown) ...[
                      CustomDropdown(
                        label: "Emax Type",
                        hint: "Select type",
                        items: ["Single Unit Crown", "Veneer", "Maryland bridge", "Conventional Bridge"],
                        onChanged: (val) {},
                      ),
                      SizedBox(height: 20.h),
                    ],

                    if (showZirconiaDropdown) ...[
                      CustomDropdown(
                        label: "Zirconia Type",
                        hint: "Select type",
                        items: ["Single Unit Crown", "Veneer", "Maryland bridge", "Conventional Bridge"],
                        onChanged: (val) {},
                      ),
                      SizedBox(height: 20.h),
                    ],

                    if (showCompositeDropdown) ...[
                      CustomDropdown(
                        label: "Composite Onlay Type",
                        hint: "Select type",
                        items: ["Hybrid Composite", "Nano Composite", "Microfilled Composite"],
                        onChanged: (val) {},
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ],
                ],

                /// DENTURE section Premium
                if (standardType == "DENTURES") ...[
                  CustomDropdown(
                    label: "Denture Type",
                    hint: "Select option",
                    items: ["Denture Construction", "Denture Other"],
                    onChanged: (val) => setState(() {
                      dentureOption = val;
                      showDentureConstruction = val == "Denture Construction";
                      showDentureOther = val == "Denture Other";
                    }),
                  ),
                  SizedBox(height: 20.h),

                  if (showDentureConstruction) ...[
                    CustomDropdown(
                      label: "Denture Construction Options",
                      hint: "Select stage",
                      items: [
                        "Bite Block",
                        "Special Tray",
                        "Clasps",
                        "Mesh Reinforcement",
                        "Try In",
                        "Re-Try In",
                        "Finish",
                      ],
                      onChanged: (val) => setState(() {
                        dentureConstructionOption = val;
                      }),
                    ),
                    SizedBox(height: 20.h),

                    if (dentureConstructionOption == "Re-Try In" ||
                        dentureConstructionOption == "Finish") ...[
                      CustomDropdown(
                        label: "Select Teeth",
                        hint: "Select Teeth",
                        items: ["Anterior", "Posterior", "Full Arch"],
                        onChanged: (val) {},
                      ),
                      SizedBox(height: 15.h),
                      CustomDropdown(
                        label: "Select Shade",
                        hint: "Select Shade",
                        items: ["A1", "A2", "A3", "B1", "B2", "B3"],
                        onChanged: (val) {},
                      ),
                      SizedBox(height: 15.h),
                    ],
                  ],

                  if (showDentureOther) ...[
                    CustomDropdown(
                      label: "Denture Other Options",
                      hint: "Select option",
                      items: ["Repair", "Reline", "Rebase"],
                      onChanged: (val) {},
                    ),
                    SizedBox(height: 20.h),
                  ],
                ],
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
