import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_button/custom_button.dart';
import 'package:event_platform/view/components/custom_from_card/custom_from_card.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../components/custom_loader/custom_loader.dart';
import '../controller/add_controller.dart';
import '../widget/custom_dropdown.dart';

class AddCaseScreen extends StatelessWidget {
  AddCaseScreen({super.key});

  final AddCaseController controller = Get.put(AddCaseController());

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
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Case Type
              CustomDropdown(
                label: "Case Type",
                hint: "Select case type",
                items: ["New Case", "Continue Case", "Remake"],
                onChanged: (val) => controller.caseType.value = val ?? '',
              ),
              SizedBox(height: 20.h),

              if (controller.caseType.value == "New Case") ...[
                /// Patient Info
                CustomFormCard(
                  title: 'Patient ID',
                  controller: controller.patientIdController,
                ),
                CustomDropdown(
                  label: "Patient Gender",
                  hint: "Select M/F",
                  items: ["Male", "Female"],
                  onChanged: (val) => controller.gender.value = val ?? '',
                ),
                SizedBox(height: 15.h),
                CustomFormCard(
                  title: 'Age',
                  controller: controller.ageController,
                ),
                CustomFormCard(
                  title: 'Scan Number (Optional)',
                  controller: controller.scanNumberController,
                ),

                /// Product Tier
                CustomDropdown(
                  label: "Product Tier",
                  hint: "Select product tier",
                  items: ["Standard", "Premium"],
                  onChanged: (val) => controller.onTierChange(val),
                ),
                SizedBox(height: 20.h),

                /// ================= Standard Section =================
                if (controller.tier.value == "Standard") ...[
                  CustomDropdown(
                    label: "Standard Type",
                    hint: "Select Type",
                    items: ["CROWN/BRIDGE", "DENTURES", "MISC"],
                    onChanged: (val) =>
                        controller.onStandardTypeChange(val ?? ''),
                  ),
                  SizedBox(height: 20.h),

                  /// Crown / Bridge
                  if (controller.standardType.value == "CROWN/BRIDGE") ...[
                    CustomDropdown(
                      label: "Crown / BRIDGE Type",
                      hint: "Select Crown Type",
                      items: ["PFM (NP)", "FULL CAST", "METAL"],
                      onChanged: (val) => controller.onCrownTypeChange(val),
                    ),
                    SizedBox(height: 20.h),

                    /// PFM Options
                    if (controller.crownType.value == "PFM (NP)") ...[
                      CustomDropdown(
                        label: "PFM (NP) Type",
                        hint: "Select option",
                        items: [
                          "Single unit crown",
                          "Maryland bridge",
                          "Conventional Bridge"
                        ],
                        onChanged: (val) =>
                            controller.onPFMOptionChange(val),
                      ),
                      SizedBox(height: 20.h),

                      /// Single Unit Crown
                      if (controller.showSingleUnitDropdown.value) ...[
                        CustomDropdown(
                          label: "Porcelain Butt Margin",
                          hint: "Select detail",
                          items: ["360", "Buccal Only"],
                          onChanged: (val) {},
                        ),
                        Wrap(
                          spacing: 8,
                          children: ["A1", "A2", "A3", "B1", "C1"].map((shade) {
                            return Obx(() => FilterChip(
                              label: Text(shade),
                              selected: controller.singleUnitTeeth.contains(shade),
                              onSelected: (selected) {
                                if (selected) {
                                  controller.singleUnitTeeth.add(shade);
                                } else {
                                  controller.singleUnitTeeth.remove(shade);
                                }
                              },
                            ));
                          }).toList(),
                        ),
                        CustomFormCard(
                          title: "Special Instructions",
                          hintText: "Describe Your Instructions",
                          maxLine: 4,
                          controller: TextEditingController(),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(
                            textAlign: TextAlign.start,
                            text: "Upload Cover Image",
                            fontSize: 16.w,
                            fontWeight: FontWeight.w500,
                            bottom: 8.h,
                          ),
                        ),
                        Obx(() {
                          return GestureDetector(
                            onTap: () async {
                              await controller.pickFiles(); // Multi-file picker
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: AppColors.grey1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: controller.selectedFiles.isNotEmpty
                                  ? Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: controller.selectedFiles.map((file) {
                                  String fileName = file.path.split('/').last;
                                  return Chip(
                                    label: Text(
                                      fileName,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    avatar: Icon(
                                      file.path.endsWith(".pdf") ? Icons.picture_as_pdf : Icons.image,
                                      size: 20,
                                      color: AppColors.primary,
                                    ),
                                    onDeleted: () {
                                      controller.selectedFiles.remove(file);
                                    },
                                  );
                                }).toList(),
                              )
                                  : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 40.h),
                                  Icon(Icons.upload_file, size: 50, color: AppColors.grey1),
                                  SizedBox(height: 10.h),
                                  CustomText(
                                    text: 'Upload a video and photo',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.black,
                                  ),
                                  SizedBox(height: 40.h),
                                ],
                              ),
                            ),
                          );
                        }),

                      ],
                      /// Maryland Bridge
                      if (controller.showMarylandBridgeDropdown.value) ...[
                        CustomDropdown(
                          label: "Select Pontic Teeth",
                          hint: "Select teeth",
                          items: ["Full ridge","Modify","No contract","Point contact","Point in socket (ovate)"],
                          onChanged: (val) {},
                        ),
                        CustomDropdown(
                          label: "Select Wing Teeth",
                          hint: "Select teeth",
                          items: ["A1","A2","B1","C1"],
                          onChanged: (val) {},
                        ),
                        Wrap(
                          spacing: 8,
                          children: ["A1", "A2", "A3", "B1", "C1"].map((shade) {
                            return Obx(() => FilterChip(
                              label: Text(shade),
                              selected: controller.singleUnitTeeth.contains(shade),
                              onSelected: (selected) {
                                if (selected) {
                                  controller.singleUnitTeeth.add(shade);
                                } else {
                                  controller.singleUnitTeeth.remove(shade);
                                }
                              },
                            ));
                          }).toList(),
                        ),
                        CustomFormCard(
                          title: "Special Instructions",
                          hintText: "Describe Your Instructions",
                          maxLine: 4,
                          controller: TextEditingController(),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(
                            text: "Upload Attachments",
                            fontSize: 16.w,
                            fontWeight: FontWeight.w500,
                            bottom: 8.h,
                          ),
                        ),
                        Obx(() {
                          return GestureDetector(
                            onTap: () async {
                              await controller.pickFiles(); // Multi-file picker
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: AppColors.grey1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: controller.selectedFiles.isNotEmpty
                                  ? Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: controller.selectedFiles.map((file) {
                                  String fileName = file.path.split('/').last;
                                  return Chip(
                                    label: Text(fileName, overflow: TextOverflow.ellipsis),
                                    avatar: Icon(
                                      file.path.endsWith(".pdf") ? Icons.picture_as_pdf : Icons.image,
                                      size: 20,
                                      color: AppColors.primary,
                                    ),
                                    onDeleted: () {
                                      controller.selectedFiles.remove(file);
                                    },
                                  );
                                }).toList(),
                              )
                                  : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 40.h),
                                  Icon(Icons.upload_file, size: 50, color: AppColors.grey1),
                                  SizedBox(height: 10.h),
                                  CustomText(
                                    text: 'Upload a video and photo',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.black,
                                  ),
                                  SizedBox(height: 40.h),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                      /// Conventional Bridge
                      if (controller.showConventionalBridgeDropdown.value) ...[
                        CustomDropdown(
                          label: "Pontic Design",
                          hint: "Select teeth",
                          items: ["Full ridge", "Modify", "No contact", "Point contact", "Point in socket (ovate)"],
                          onChanged: (val) {},
                        ),
                        Wrap(
                          spacing: 8,
                          children: ["A1", "A2", "A3", "B1", "C1"].map((shade) {
                            return Obx(() => FilterChip(
                              label: Text(shade),
                              selected: controller.singleUnitTeeth.contains(shade),
                              onSelected: (selected) {
                                if (selected) {
                                  controller.singleUnitTeeth.add(shade);
                                } else {
                                  controller.singleUnitTeeth.remove(shade);
                                }
                              },
                            ));
                          }).toList(),
                        ),
                        CustomFormCard(
                          title: "Description",
                          hintText: "Describe your case",
                          maxLine: 4,
                          controller: TextEditingController(),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(
                            text: "Upload Attachments",
                            fontSize: 16.w,
                            fontWeight: FontWeight.w500,
                            bottom: 8.h,
                          ),
                        ),
                        Obx(() {
                          return GestureDetector(
                            onTap: () async {
                              await controller.pickFiles(); // Multi-file picker
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: AppColors.grey1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: controller.selectedFiles.isNotEmpty
                                  ? Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: controller.selectedFiles.map((file) {
                                  String fileName = file.path.split('/').last;
                                  return Chip(
                                    label: Text(fileName, overflow: TextOverflow.ellipsis),
                                    avatar: Icon(
                                      file.path.endsWith(".pdf") ? Icons.picture_as_pdf : Icons.image,
                                      size: 20,
                                      color: AppColors.primary,
                                    ),
                                    onDeleted: () {
                                      controller.selectedFiles.remove(file);
                                    },
                                  );
                                }).toList(),
                              )
                                  : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 40.h),
                                  Icon(Icons.upload_file, size: 50, color: AppColors.grey1),
                                  SizedBox(height: 10.h),
                                  CustomText(
                                    text: 'Upload a video and photo',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.black,
                                  ),
                                  SizedBox(height: 40.h),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],


                    ],

                    /// FULL CAST Options
                    if (controller.crownType.value == "FULL CAST") ...[
                      CustomDropdown(
                        label: "Full Cast Type",
                        hint: "Select option",
                        items: ["Single unit crown", "Bridge", "Post and Core"],
                        onChanged: (val) => controller.onFullCastChange(val),
                      ),
                      SizedBox(height: 20.h),

                      /// Single Unit Crown
                      if (controller.showFullCastSingleUnit.value) ...[
                        CustomDropdown(
                          label: "Porcelain Butt Margin",
                          hint: "Select detail",
                          items: ["360", "Buccal Only"],
                          onChanged: (val) {},
                        ),
                        Wrap(
                          spacing: 8,
                          children: ["A1", "A2", "A3", "B1", "C1"].map((shade) {
                            return Obx(() => FilterChip(
                              label: Text(shade),
                              selected: controller.singleUnitTeeth.contains(shade),
                              onSelected: (selected) {
                                if (selected) {
                                  controller.singleUnitTeeth.add(shade);
                                } else {
                                  controller.singleUnitTeeth.remove(shade);
                                }
                              },
                            ));
                          }).toList(),
                        ),
                        CustomFormCard(
                          title: "Special Instructions",
                          hintText: "Describe Your Instructions",
                          maxLine: 4,
                          controller: TextEditingController(),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(
                            textAlign: TextAlign.start,
                            text: "Upload Cover Image",
                            fontSize: 16.w,
                            fontWeight: FontWeight.w500,
                            bottom: 8.h,
                          ),
                        ),
                        Obx(() {
                          return GestureDetector(
                            onTap: () async {
                              await controller.pickFiles();
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: AppColors.grey1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: controller.selectedFiles.isNotEmpty
                                  ? Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: controller.selectedFiles.map((file) {
                                  String fileName = file.path.split('/').last;
                                  return Chip(
                                    label: Text(fileName, overflow: TextOverflow.ellipsis),
                                    avatar: Icon(
                                      file.path.endsWith(".pdf") ? Icons.picture_as_pdf : Icons.image,
                                      size: 20,
                                      color: AppColors.primary,
                                    ),
                                    onDeleted: () {
                                      controller.selectedFiles.remove(file);
                                    },
                                  );
                                }).toList(),
                              )
                                  : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 40.h),
                                  Icon(Icons.upload_file, size: 50, color: AppColors.grey1),
                                  SizedBox(height: 10.h),
                                  CustomText(
                                    text: 'Upload a video and photo',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.black,
                                  ),
                                  SizedBox(height: 40.h),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],

                      /// Bridge
                      if (controller.showFullCastBridge.value) ...[
                        CustomDropdown(
                          label: "Pontic Design",
                          hint: "Select teeth",
                          items: ["Full ridge", "Modify", "No contact", "Point contact", "Point in socket (ovate)"],
                          onChanged: (val) {},
                        ),
                        Wrap(
                          spacing: 8,
                          children: ["A1", "A2", "A3", "B1", "C1"].map((shade) {
                            return Obx(() => FilterChip(
                              label: Text(shade),
                              selected: controller.singleUnitTeeth.contains(shade),
                              onSelected: (selected) {
                                if (selected) {
                                  controller.singleUnitTeeth.add(shade);
                                } else {
                                  controller.singleUnitTeeth.remove(shade);
                                }
                              },
                            ));
                          }).toList(),
                        ),
                        CustomFormCard(
                          title: "Description",
                          hintText: "Describe your case",
                          maxLine: 4,
                          controller: TextEditingController(),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(
                            text: "Upload Attachments",
                            fontSize: 16.w,
                            fontWeight: FontWeight.w500,
                            bottom: 8.h,
                          ),
                        ),
                        Obx(() {
                          return GestureDetector(
                            onTap: () async {
                              await controller.pickFiles();
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: AppColors.grey1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: controller.selectedFiles.isNotEmpty
                                  ? Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: controller.selectedFiles.map((file) {
                                  String fileName = file.path.split('/').last;
                                  return Chip(
                                    label: Text(fileName, overflow: TextOverflow.ellipsis),
                                    avatar: Icon(
                                      file.path.endsWith(".pdf") ? Icons.picture_as_pdf : Icons.image,
                                      size: 20,
                                      color: AppColors.primary,
                                    ),
                                    onDeleted: () {
                                      controller.selectedFiles.remove(file);
                                    },
                                  );
                                }).toList(),
                              )
                                  : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 40.h),
                                  Icon(Icons.upload_file, size: 50, color: AppColors.grey1),
                                  SizedBox(height: 10.h),
                                  CustomText(
                                    text: 'Upload a video and photo',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.black,
                                  ),
                                  SizedBox(height: 40.h),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],

                      /// Post and Core
                      /*if (controller.showPostAndCore.value) ...[
                        CustomDropdown(
                          label: "Post Type",
                          hint: "Select detail",
                          items: ["Custom", "Prefabricated"],
                          onChanged: (val) {},
                        ),
                        Wrap(
                          spacing: 8,
                          children: ["A1", "A2", "A3", "B1", "C1"].map((shade) {
                            return Obx(() => FilterChip(
                              label: Text(shade),
                              selected: controller.postAndCoreTeeth.contains(shade),
                              onSelected: (selected) {
                                if (selected) {
                                  controller.postAndCoreTeeth.add(shade);
                                } else {
                                  controller.postAndCoreTeeth.remove(shade);
                                }
                              },
                            ));
                          }).toList(),
                        ),
                        CustomFormCard(
                          title: "Instructions",
                          hintText: "Describe your Post & Core",
                          maxLine: 4,
                          controller: TextEditingController(),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(
                            text: "Upload Attachments",
                            fontSize: 16.w,
                            fontWeight: FontWeight.w500,
                            bottom: 8.h,
                          ),
                        ),
                        Obx(() {
                          return GestureDetector(
                            onTap: () async {
                              await controller.pickFiles();
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: AppColors.grey1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: controller.selectedFiles.isNotEmpty
                                  ? Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: controller.selectedFiles.map((file) {
                                  String fileName = file.path.split('/').last;
                                  return Chip(
                                    label: Text(fileName, overflow: TextOverflow.ellipsis),
                                    avatar: Icon(
                                      file.path.endsWith(".pdf") ? Icons.picture_as_pdf : Icons.image,
                                      size: 20,
                                      color: AppColors.primary,
                                    ),
                                    onDeleted: () {
                                      controller.selectedFiles.remove(file);
                                    },
                                  );
                                }).toList(),
                              )
                                  : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 40.h),
                                  Icon(Icons.upload_file, size: 50, color: AppColors.grey1),
                                  SizedBox(height: 10.h),
                                  CustomText(
                                    text: 'Upload a video and photo',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.black,
                                  ),
                                  SizedBox(height: 40.h),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],*/
                    ],

                    /// ========== METAL Options ==========
                    /*if (controller.crownType.value == "METAL") ...[
                      CustomDropdown(
                        label: "Pontic Design",
                        hint: "Select teeth",
                        items: ["Full ridge", "Modify", "No contact", "Point contact", "Point in socket (ovate)"],
                        onChanged: (val) {},
                      ),
                      Wrap(
                        spacing: 8,
                        children: ["A1", "A2", "A3", "B1", "C1"].map((shade) {
                          return Obx(() => FilterChip(
                            label: Text(shade),
                            selected: controller.metalBridgeTeeth.contains(shade),
                            onSelected: (selected) {
                              if (selected) {
                                controller.metalBridgeTeeth.add(shade);
                              } else {
                                controller.metalBridgeTeeth.remove(shade);
                              }
                            },
                          ));
                        }).toList(),
                      ),
                      CustomFormCard(
                        title: "Description",
                        hintText: "Describe your case",
                        maxLine: 4,
                        controller: TextEditingController(),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: CustomText(
                          text: "Upload Attachments",
                          fontSize: 16.w,
                          fontWeight: FontWeight.w500,
                          bottom: 8.h,
                        ),
                      ),
                      Obx(() {
                        return GestureDetector(
                          onTap: () async {
                            await controller.pickFiles();
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: AppColors.grey1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: controller.selectedFiles.isNotEmpty
                                ? Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: controller.selectedFiles.map((file) {
                                String fileName = file.path.split('/').last;
                                return Chip(
                                  label: Text(fileName, overflow: TextOverflow.ellipsis),
                                  avatar: Icon(
                                    file.path.endsWith(".pdf") ? Icons.picture_as_pdf : Icons.image,
                                    size: 20,
                                    color: AppColors.primary,
                                  ),
                                  onDeleted: () {
                                    controller.selectedFiles.remove(file);
                                  },
                                );
                              }).toList(),
                            )
                                : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 40.h),
                                Icon(Icons.upload_file, size: 50, color: AppColors.grey1),
                                SizedBox(height: 10.h),
                                CustomText(
                                  text: 'Upload a video and photo',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: AppColors.black,
                                ),
                                SizedBox(height: 40.h),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],*/


                  ],

                  /// Dentures
                  /*if (controller.standardType.value == "DENTURES") ...[
                    CustomDropdown(
                      label: "Denture Type",
                      hint: "Select option",
                      items: ["Denture Construction", "Denture Other"],
                      onChanged: (val) =>
                          controller.onDentureTypeChange(val),
                    ),
                    SizedBox(height: 20.h),
                    /// DENTURE → Denture Construction
                    if (controller.showDentureConstruction.value) ...[
                      /// Bite Block Section
                      Align(
                        alignment: Alignment.topLeft,
                        child: CustomText(
                          text: "Bite Block",
                          fontSize: 16.w,
                          fontWeight: FontWeight.w500,
                          bottom: 8.h,
                        ),
                      ),
                      Obx(() => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: controller.biteBlockUpper.value,
                                activeColor: AppColors.primary,
                                onChanged: (val) {
                                  controller.biteBlockUpper.value = val ?? false;
                                },
                              ),
                              CustomText(
                                text: "Upper",
                                fontSize: 14.w,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: controller.biteBlockLower.value,
                                activeColor: AppColors.primary,
                                onChanged: (val) {
                                  controller.biteBlockLower.value = val ?? false;
                                },
                              ),
                              CustomText(
                                text: "Lower",
                                fontSize: 14.w,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ],
                      )),
                      SizedBox(height: 15.h),
                      /// Special Tray Selection (Upper & Lower side by side)
                      Align(
                        alignment: Alignment.topLeft,
                        child: CustomText(
                          text: "Special Tray",
                          fontSize: 16.w,
                          fontWeight: FontWeight.w500,
                          bottom: 8.h,
                        ),
                      ),
                      Obx(() => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: controller.specialTrayUpper.value,
                                activeColor: AppColors.primary,
                                onChanged: (val) {
                                  controller.specialTrayUpper.value = val ?? false;
                                },
                              ),
                              CustomText(
                                text: "Upper",
                                fontSize: 14.w,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: controller.specialTrayLower.value,
                                activeColor: AppColors.primary,
                                onChanged: (val) {
                                  controller.specialTrayLower.value = val ?? false;
                                },
                              ),
                              CustomText(
                                text: "Lower",
                                fontSize: 14.w,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ],
                      )),
                      SizedBox(height: 15.h),
                      Wrap(
                        spacing: 8,
                        children: ["A1", "A2", "A3", "B1", "C1"].map((shade) {
                          return Obx(() => FilterChip(
                            label: Text(shade),
                            selected: controller.singleUnitTeeth.contains(shade),
                            onSelected: (selected) {
                              if (selected) {
                                controller.singleUnitTeeth.add(shade);
                              } else {
                                controller.singleUnitTeeth.remove(shade);
                              }
                            },
                          ));
                        }).toList(),
                      ),
                      SizedBox(height: 15.h),

                      /// Porcelain Butt Margin Dropdown
                      CustomDropdown(
                        label: "Porcelain Butt Margin",
                        hint: "Select detail",
                        items: ["Try In", "Re-try In", "Finish"],
                        onChanged: (val) => controller.porcelainButtMargin.value = val ?? '',
                      ),

                      SizedBox(height: 20.h),

                      /// Try In Section
                      if (controller.porcelainButtMargin.value == "Try In") ...[
                        Wrap(
                          spacing: 8,
                          children: ["A1", "A2", "A3", "B1", "C1"].map((shade) {
                            return Obx(() => FilterChip(
                              label: Text(shade),
                              selected: controller.tryInTeeth.contains(shade),
                              onSelected: (selected) {
                                if (selected) {
                                  controller.tryInTeeth.add(shade);
                                } else {
                                  controller.tryInTeeth.remove(shade);
                                }
                              },
                            ));
                          }).toList(),
                        ),
                        SizedBox(height: 15.h),

                        CustomFormCard(
                          title: "Description",
                          hintText: "Describe your Try In",
                          maxLine: 4,
                          controller: controller.tryInDescriptionController,
                        ),
                        SizedBox(height: 15.h),

                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(
                            text: "Upload Try In Attachments",
                            fontSize: 16.w,
                            fontWeight: FontWeight.w500,
                            bottom: 8.h,
                          ),
                        ),

                        Obx(() {
                          return GestureDetector(
                            onTap: () async {
                              await controller.pickTryInFiles();
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: AppColors.grey1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: controller.tryInAttachments.isNotEmpty
                                  ? Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: controller.tryInAttachments.map((file) {
                                  String fileName = file.path.split('/').last;
                                  return Chip(
                                    label: Text(fileName, overflow: TextOverflow.ellipsis),
                                    avatar: Icon(
                                      file.path.endsWith(".pdf")
                                          ? Icons.picture_as_pdf
                                          : Icons.image,
                                      size: 20,
                                      color: AppColors.primary,
                                    ),
                                    onDeleted: () {
                                      controller.tryInAttachments.remove(file);
                                    },
                                  );
                                }).toList(),
                              )
                                  : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 40.h),
                                  Icon(Icons.upload_file, size: 50, color: AppColors.grey1),
                                  SizedBox(height: 10.h),
                                  CustomText(
                                    text: 'Upload images or PDFs',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.black,
                                  ),
                                  SizedBox(height: 40.h),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],

                      /// Re-Try In Section (Same as Try In)
                      if (controller.porcelainButtMargin.value == "Re-try In") ...[
                        Wrap(
                          spacing: 8,
                          children: ["A1", "A2", "A3", "B1", "C1"].map((shade) {
                            return Obx(() => FilterChip(
                              label: Text(shade),
                              selected: controller.reTryTeeth.contains(shade),
                              onSelected: (selected) {
                                if (selected) {
                                  controller.reTryTeeth.add(shade);
                                } else {
                                  controller.reTryTeeth.remove(shade);
                                }
                              },
                            ));
                          }).toList(),
                        ),
                        SizedBox(height: 15.h),

                        CustomFormCard(
                          title: "Description",
                          hintText: "Describe your Re-Try In",
                          maxLine: 4,
                          controller: controller.reTryDescriptionController,
                        ),
                        SizedBox(height: 15.h),

                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(
                            text: "Upload Re-Try In Attachments",
                            fontSize: 16.w,
                            fontWeight: FontWeight.w500,
                            bottom: 8.h,
                          ),
                        ),

                        Obx(() {
                          return GestureDetector(
                            onTap: () async {
                              await controller.pickReTryFiles();
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: AppColors.grey1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: controller.reTryAttachments.isNotEmpty
                                  ? Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: controller.reTryAttachments.map((file) {
                                  String fileName = file.path.split('/').last;
                                  return Chip(
                                    label: Text(fileName, overflow: TextOverflow.ellipsis),
                                    avatar: Icon(
                                      file.path.endsWith(".pdf")
                                          ? Icons.picture_as_pdf
                                          : Icons.image,
                                      size: 20,
                                      color: AppColors.primary,
                                    ),
                                    onDeleted: () {
                                      controller.reTryAttachments.remove(file);
                                    },
                                  );
                                }).toList(),
                              )
                                  : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 40.h),
                                  Icon(Icons.upload_file, size: 50, color: AppColors.grey1),
                                  SizedBox(height: 10.h),
                                  CustomText(
                                    text: 'Upload images or PDFs',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.black,
                                  ),
                                  SizedBox(height: 40.h),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],

                      /// Finish Section (as it was)
                      if (controller.porcelainButtMargin.value == "Finish") ...[
                        Wrap(
                          spacing: 8,
                          children: ["A1", "A2", "A3", "B1", "C1"].map((shade) {
                            return Obx(() => FilterChip(
                              label: Text(shade),
                              selected: controller.finishTeeth.contains(shade),
                              onSelected: (selected) {
                                if (selected) {
                                  controller.finishTeeth.add(shade);
                                } else {
                                  controller.finishTeeth.remove(shade);
                                }
                              },
                            ));
                          }).toList(),
                        ),
                        SizedBox(height: 15.h),

                        CustomFormCard(
                          title: "Description",
                          hintText: "Describe your Finish",
                          maxLine: 4,
                          controller: controller.finishDescriptionController,
                        ),
                        SizedBox(height: 15.h),

                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(
                            text: "Upload Finish Attachments",
                            fontSize: 16.w,
                            fontWeight: FontWeight.w500,
                            bottom: 8.h,
                          ),
                        ),

                        Obx(() {
                          return GestureDetector(
                            onTap: () async {
                              await controller.pickFinishFiles();
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: AppColors.grey1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: controller.finishAttachments.isNotEmpty
                                  ? Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: controller.finishAttachments.map((file) {
                                  String fileName = file.path.split('/').last;
                                  return Chip(
                                    label: Text(fileName, overflow: TextOverflow.ellipsis),
                                    avatar: Icon(
                                      file.path.endsWith(".pdf")
                                          ? Icons.picture_as_pdf
                                          : Icons.image,
                                      size: 20,
                                      color: AppColors.primary,
                                    ),
                                    onDeleted: () {
                                      controller.finishAttachments.remove(file);
                                    },
                                  );
                                }).toList(),
                              )
                                  : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 40.h),
                                  Icon(Icons.upload_file, size: 50, color: AppColors.grey1),
                                  SizedBox(height: 10.h),
                                  CustomText(
                                    text: 'Upload images or PDFs',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.black,
                                  ),
                                  SizedBox(height: 40.h),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],

                    ],

                    if (controller.showDentureOther.value) ...[
                      /// Bite Block Section
                      Align(
                        alignment: Alignment.topLeft,
                        child: CustomText(
                          text: "Bite Block",
                          fontSize: 16.w,
                          fontWeight: FontWeight.w500,
                          bottom: 8.h,
                        ),
                      ),
                      Obx(() => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: controller.biteBlockUpper.value,
                                activeColor: AppColors.primary,
                                onChanged: (val) {
                                  controller.biteBlockUpper.value = val ?? false;
                                },
                              ),
                              CustomText(
                                text: "Upper",
                                fontSize: 14.w,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: controller.biteBlockLower.value,
                                activeColor: AppColors.primary,
                                onChanged: (val) {
                                  controller.biteBlockLower.value = val ?? false;
                                },
                              ),
                              CustomText(
                                text: "Lower",
                                fontSize: 14.w,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ],
                      )),
                      SizedBox(height: 15.h),

                      /// Special Tray Section
                      Align(
                        alignment: Alignment.topLeft,
                        child: CustomText(
                          text: "Special Tray",
                          fontSize: 16.w,
                          fontWeight: FontWeight.w500,
                          bottom: 8.h,
                        ),
                      ),
                      Obx(() => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: controller.specialTrayUpper.value,
                                activeColor: AppColors.primary,
                                onChanged: (val) {
                                  controller.specialTrayUpper.value = val ?? false;
                                },
                              ),
                              CustomText(
                                text: "Upper",
                                fontSize: 14.w,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: controller.specialTrayLower.value,
                                activeColor: AppColors.primary,
                                onChanged: (val) {
                                  controller.specialTrayLower.value = val ?? false;
                                },
                              ),
                              CustomText(
                                text: "Lower",
                                fontSize: 14.w,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ],
                      )),
                      SizedBox(height: 15.h),

                      /// Teeth Shade Selection
                      Wrap(
                        spacing: 8,
                        children: ["A1", "A2", "A3", "B1", "C1"].map((shade) {
                          return Obx(() => FilterChip(
                            label: Text(shade),
                            selected: controller.singleUnitTeeth.contains(shade),
                            onSelected: (selected) {
                              if (selected) {
                                controller.singleUnitTeeth.add(shade);
                              } else {
                                controller.singleUnitTeeth.remove(shade);
                              }
                            },
                          ));
                        }).toList(),
                      ),
                      SizedBox(height: 15.h),

                      /// Porcelain Butt Margin Dropdown
                      CustomDropdown(
                        label: "Porcelain Butt Margin",
                        hint: "Select detail",
                        items: ["Try In", "Re-try In", "Finish"],
                        onChanged: (val) => controller.porcelainButtMargin.value = val ?? '',
                      ),
                      SizedBox(height: 20.h),

                      /// Try In Section
                      if (controller.porcelainButtMargin.value == "Try In") ...[
                        Wrap(
                          spacing: 8,
                          children: ["A1", "A2", "A3", "B1", "C1"].map((shade) {
                            return Obx(() => FilterChip(
                              label: Text(shade),
                              selected: controller.tryInTeeth.contains(shade),
                              onSelected: (selected) {
                                if (selected) {
                                  controller.tryInTeeth.add(shade);
                                } else {
                                  controller.tryInTeeth.remove(shade);
                                }
                              },
                            ));
                          }).toList(),
                        ),
                        SizedBox(height: 15.h),
                        CustomFormCard(
                          title: "Description",
                          hintText: "Describe your Try In",
                          maxLine: 4,
                          controller: controller.tryInDescriptionController,
                        ),
                        SizedBox(height: 15.h),
                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(
                            text: "Upload Try In Attachments",
                            fontSize: 16.w,
                            fontWeight: FontWeight.w500,
                            bottom: 8.h,
                          ),
                        ),
                        Obx(() {
                          return GestureDetector(
                            onTap: () async {
                              await controller.pickTryInFiles();
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: AppColors.grey1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: controller.tryInAttachments.isNotEmpty
                                  ? Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: controller.tryInAttachments.map((file) {
                                  String fileName = file.path.split('/').last;
                                  return Chip(
                                    label: Text(fileName, overflow: TextOverflow.ellipsis),
                                    avatar: Icon(
                                      file.path.endsWith(".pdf") ? Icons.picture_as_pdf : Icons.image,
                                      size: 20,
                                      color: AppColors.primary,
                                    ),
                                    onDeleted: () {
                                      controller.tryInAttachments.remove(file);
                                    },
                                  );
                                }).toList(),
                              )
                                  : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 40.h),
                                  Icon(Icons.upload_file, size: 50, color: AppColors.grey1),
                                  SizedBox(height: 10.h),
                                  CustomText(
                                    text: 'Upload images or PDFs',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.black,
                                  ),
                                  SizedBox(height: 40.h),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],

                      /// Re-Try In Section
                      if (controller.porcelainButtMargin.value == "Re-try In") ...[
                        Wrap(
                          spacing: 8,
                          children: ["A1", "A2", "A3", "B1", "C1"].map((shade) {
                            return Obx(() => FilterChip(
                              label: Text(shade),
                              selected: controller.reTryTeeth.contains(shade),
                              onSelected: (selected) {
                                if (selected) {
                                  controller.reTryTeeth.add(shade);
                                } else {
                                  controller.reTryTeeth.remove(shade);
                                }
                              },
                            ));
                          }).toList(),
                        ),
                        SizedBox(height: 15.h),
                        CustomFormCard(
                          title: "Description",
                          hintText: "Describe your Re-Try In",
                          maxLine: 4,
                          controller: controller.reTryDescriptionController,
                        ),
                        SizedBox(height: 15.h),
                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(
                            text: "Upload Re-Try In Attachments",
                            fontSize: 16.w,
                            fontWeight: FontWeight.w500,
                            bottom: 8.h,
                          ),
                        ),
                        Obx(() {
                          return GestureDetector(
                            onTap: () async {
                              await controller.pickReTryFiles();
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: AppColors.grey1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: controller.reTryAttachments.isNotEmpty
                                  ? Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: controller.reTryAttachments.map((file) {
                                  String fileName = file.path.split('/').last;
                                  return Chip(
                                    label: Text(fileName, overflow: TextOverflow.ellipsis),
                                    avatar: Icon(
                                      file.path.endsWith(".pdf") ? Icons.picture_as_pdf : Icons.image,
                                      size: 20,
                                      color: AppColors.primary,
                                    ),
                                    onDeleted: () {
                                      controller.reTryAttachments.remove(file);
                                    },
                                  );
                                }).toList(),
                              )
                                  : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 40.h),
                                  Icon(Icons.upload_file, size: 50, color: AppColors.grey1),
                                  SizedBox(height: 10.h),
                                  CustomText(
                                    text: 'Upload images or PDFs',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.black,
                                  ),
                                  SizedBox(height: 40.h),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],

                      /// Finish Section
                      if (controller.porcelainButtMargin.value == "Finish") ...[
                        Wrap(
                          spacing: 8,
                          children: ["A1", "A2", "A3", "B1", "C1"].map((shade) {
                            return Obx(() => FilterChip(
                              label: Text(shade),
                              selected: controller.finishTeeth.contains(shade),
                              onSelected: (selected) {
                                if (selected) {
                                  controller.finishTeeth.add(shade);
                                } else {
                                  controller.finishTeeth.remove(shade);
                                }
                              },
                            ));
                          }).toList(),
                        ),
                        SizedBox(height: 15.h),
                        CustomFormCard(
                          title: "Description",
                          hintText: "Describe your Finish",
                          maxLine: 4,
                          controller: controller.finishDescriptionController,
                        ),
                        SizedBox(height: 15.h),
                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(
                            text: "Upload Finish Attachments",
                            fontSize: 16.w,
                            fontWeight: FontWeight.w500,
                            bottom: 8.h,
                          ),
                        ),
                        Obx(() {
                          return GestureDetector(
                            onTap: () async {
                              await controller.pickFinishFiles();
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: AppColors.grey1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: controller.finishAttachments.isNotEmpty
                                  ? Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: controller.finishAttachments.map((file) {
                                  String fileName = file.path.split('/').last;
                                  return Chip(
                                    label: Text(fileName, overflow: TextOverflow.ellipsis),
                                    avatar: Icon(
                                      file.path.endsWith(".pdf") ? Icons.picture_as_pdf : Icons.image,
                                      size: 20,
                                      color: AppColors.primary,
                                    ),
                                    onDeleted: () {
                                      controller.finishAttachments.remove(file);
                                    },
                                  );
                                }).toList(),
                              )
                                  : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 40.h),
                                  Icon(Icons.upload_file, size: 50, color: AppColors.grey1),
                                  SizedBox(height: 10.h),
                                  CustomText(
                                    text: 'Upload images or PDFs',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.black,
                                  ),
                                  SizedBox(height: 40.h),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ],

                  ],*/
                ],

                /// ================= Premium Section =================
                if (controller.tier.value == "Premium") ...[
                  CustomDropdown(
                    label: "Premium Type",
                    hint: "Select Type",
                    items: ["CROWN/BRIDGE", "IMPLANTS", "ORTHO", "DENTURES"],
                    onChanged: (val) =>
                        controller.onStandardTypeChange(val ?? ''),
                  ),
                  SizedBox(height: 20.h),

                  /// Premium Crown/Bridge
                  if (controller.standardType.value == "CROWN/BRIDGE") ...[
                    CustomDropdown(
                      label: "Premium Crown Type",
                      hint: "Select Crown Type",
                      items: ["Zirconia", "E-max", "Layered Zirconia"],
                      onChanged: (val) => controller.onCrownTypeChange(val),
                    ),
                    SizedBox(height: 20.h),

                    /// Zirconia Options
                    if (controller.crownType.value == "Zirconia") ...[
                      CustomDropdown(
                        label: "Zirconia Options",
                        hint: "Select option",
                        items: ["Monolithic", "Layered", "Translucent"],
                        onChanged: (val) {},
                      ),
                    ],

                    /// E-max Options
                    if (controller.crownType.value == "E-max") ...[
                      CustomDropdown(
                        label: "E-max Type",
                        hint: "Select option",
                        items: ["Veneer", "Crown", "Inlay", "Onlay"],
                        onChanged: (val) {},
                      ),
                    ],

                    /// Layered Zirconia Options
                    if (controller.crownType.value == "Layered Zirconia") ...[
                      CustomDropdown(
                        label: "Layered Zirconia Type",
                        hint: "Select layer option",
                        items: ["Single", "Multi Layer"],
                        onChanged: (val) {},
                      ),
                    ],
                  ],

                  /// Premium Implants
                  if (controller.standardType.value == "IMPLANTS") ...[
                    CustomDropdown(
                      label: "Implant Type",
                      hint: "Select option",
                      items: ["Screw Retained", "Cement Retained"],
                      onChanged: (val) {},
                    ),
                    CustomDropdown(
                      label: "Material Type",
                      hint: "Select material",
                      items: ["Titanium", "Zirconia", "Hybrid"],
                      onChanged: (val) {},
                    ),
                  ],

                  /// Premium Ortho
                  if (controller.standardType.value == "ORTHO") ...[
                    CustomDropdown(
                      label: "Ortho Appliance Type",
                      hint: "Select option",
                      items: ["Aligner", "Retainer", "Space Maintainer"],
                      onChanged: (val) {},
                    ),
                  ],

                  /// Premium Dentures
                  if (controller.standardType.value == "DENTURES") ...[
                    CustomDropdown(
                      label: "Denture Material",
                      hint: "Select option",
                      items: ["Acrylic", "Flexible", "Cobalt Chrome"],
                      onChanged: (val) {},
                    ),
                  ],
                ],

                SizedBox(height: 15.h),

                /// Submit Button
                Obx(() => controller.isLoading.value
                    ? const CustomLoader()
                    : CustomButton(
                  onTap: controller.submitCase,
                  title: 'Submit Case',
                  fillColor: AppColors.primary,
                )),
              ],
            ],
          );
        }),
      ),
    );
  }
}
