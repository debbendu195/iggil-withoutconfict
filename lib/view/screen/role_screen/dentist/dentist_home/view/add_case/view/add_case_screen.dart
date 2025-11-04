import 'dart:io'; // Import File for _FileUploadWidget
import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_button/custom_button.dart';
import 'package:event_platform/view/components/custom_from_card/custom_from_card.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
              _buildCaseTypeDropdown(),
              SizedBox(height: 20.h),
              if (controller.caseType.value == "New") _buildNewCaseForm(),
            ],
          );
        }),
      ),
    );
  }

  /// MARK: Private Builder Methods
  Widget _buildCaseTypeDropdown() {
    return CustomDropdown(
      label: "Case Type",
      hint: "Select case type",
      // ✅ Step 1: UI-te ei value-gulo dekhabe
      items: ["New Case", "Continue Case", "Remake"],
      onChanged: (val) {
        // ✅ Step 2: UI value-ke API value-te map/convert kora
        String apiValue = '';
        String apiValue2 = "";
        if (val == "New Case") {
          apiValue2 = "New";
          apiValue = "New"; // "New Case" select korle "New" save hobe
        } else if (val == "Continue Case") {
          apiValue2 = "Continue";
          apiValue =
          "Continue"; // "Continue Case" select korle "Continuation" save hobe
        } else if (val == "Remake") {
          apiValue2 = "Remake";
          apiValue = "Remake"; // "Remake" select korle "Remake" save hobe
        }
        // ✅ Step 3: Controller-e correct API value-ti set kora
        controller.caseType.value = apiValue;
        controller.caseTypeSend.value = apiValue2;
      },
    );
  }

  Widget _buildNewCaseForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPatientInfo(),
        _buildProductTier(),
        SizedBox(height: 20.h),
        if (controller.tier.value == "Standard") _buildStandardSection(),
        if (controller.tier.value == "Premium") _buildPremiumSection(),
        // ✅ =================================
        // ✅ GLOBAL DESCRIPTION (MOVED HERE)
        // ✅ =================================
        SizedBox(height: 20.h),
        // This will only show if a tier is selected
        if (controller.tier.value.isNotEmpty)
          CustomFormCard(
            title: 'Global Case Description',
            hintText: 'Add any overall case notes or instructions...',
            controller: controller.descriptionController, // Global controller
            maxLine: 4,
          ),
        SizedBox(height: 15.h),
        // ✅ =================================
        _buildSubmitButton(),
      ],
    );
  }

  Widget _buildPatientInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          keyboardType: TextInputType.number, // Set keyboard type for age
        ),
        CustomFormCard(
          title: 'Scan Number (Optional)',
          controller: controller.scanNumberController,
        ),
      ],
    );
  }

  Widget _buildProductTier() {
    return CustomDropdown(
      label: "Product Tier",
      hint: "Select product tier",
      items: ["Standard", "Premium"],
      onChanged: (val) => controller.onTierChange(val),
    );
  }

  Widget _buildSubmitButton() {
    return Obx(() => controller.isLoading.value
        ? const CustomLoader()
        : CustomButton(
      onTap: controller.submitCase,
      title: 'Submit Case',
      fillColor: AppColors.primary,
    ));
  }

  // ============================================
  // ========= STANDARD SECTION =========
  // ===== (NO CHANGES AS REQUESTED) ======
  // ============================================

  /// MARK: Standard Section
  Widget _buildStandardSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdown(
          label: "Standard Type",
          hint: "Select Type",
          items: ["CROWN/BRIDGE", "DENTURES", "MISC"],
          onChanged: (val) => controller.onStandardTypeChange(val ?? ''),
        ),
        SizedBox(height: 20.h),
        if (controller.standardType.value == "CROWN/BRIDGE")
          _buildStandardCrownBridge(),
        if (controller.standardType.value == "DENTURES")
          _buildStandardDentures(),
        // TODO: Add Standard MISC form if needed
      ],
    );
  }

  Widget _buildStandardCrownBridge() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdown(
          label: "Crown / BRIDGE Type",
          hint: "Select Crown Type",
          items: ["PFM (NP)", "FULL CAST", "METAL"],
          onChanged: (val) => controller.onCrownTypeChange(val),
        ),
        SizedBox(height: 20.h),
        if (controller.crownType.value == "PFM (NP)") _buildPfmNpOptions(),
        if (controller.crownType.value == "FULL CAST") _buildFullCastOptions(),
        // ✅ This will now render the new, complex metal options
        if (controller.crownType.value == "METAL") _buildStandardBuildMetalOptions(),
      ],
    );
  }

  Widget _buildPfmNpOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdown(
          label: "PFM (NP) Type",
          hint: "Select option",
          items: [
            "Single unit crown",
            "Maryland bridge",
            "Conventional Bridge"
          ],
          onChanged: (val) => controller.onPFMOptionChange(val),
        ),
        SizedBox(height: 20.h),
        if (controller.showSingleUnitDropdown.value)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, // ✅ Added for alignment
            children: [
              // ✅ ADDED TEXT WIDGET AS REQUESTED
              CustomText(
                text: "Single unit crown pfm",
                fontSize: 18.w, // Made it a bit larger like a subtitle
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
                bottom: 15.h,
                textAlign: TextAlign.start,
              ),
              CustomDropdown(
                label: "Porcelain Butt Margin",
                hint: "Select detail",
                items: ["360", "Buccal Only"],
                onChanged: (val) {
                  controller.pfmSingleUnitPorcelainButtMargin.value = val ?? '';
                },
              ),
              SizedBox(height: 20.h),
              Align(
                  alignment: Alignment.centerLeft,
                  child: _TeethSelectionWidget(
                      selectedTeeth: controller.singleUnitTeeth)),
              SizedBox(height: 20.h),

              // ✅ NEW: Single Shade Selector
              SingleShadeSelector(
                selectedShade: controller.shadeController,
                title: "Select Shade",
                hint: "Choose shade for selected teeth",
              ),
              SizedBox(height: 20.h),

              // ✅ Re-using global description controller
              // _InstructionCardWidget(
              //   controller: controller.descriptionController,
              //   title: "Special Instructions",
              //   hintText: "Describe Your Instructions",
              // ),
              _FileUploadWidget(
                selectedFiles: controller.selectedFiles,
                onTap: controller.pickFiles,
                onFileDeleted: (file) =>
                    controller.removeFile(file, controller.selectedFiles),
                uploadTitle: "Upload Cover Image",
                uploadHint: "Upload a video and photo",
              ),
            ],
          ),
        if (controller.showMarylandBridgeDropdown.value)
          Column(
            children: [
              CustomDropdown(
                label: "Select Pontic Teeth",
                hint: "Select teeth",
                items: [
                  "Full ridge",
                  "Modify",
                  "No contract",
                  "Point contact",
                  "Point in socket (ovate)"
                ],
                onChanged: (val) {
                  controller.marylandponticTeeth.value = val ?? '';
                },
              ),
              SizedBox(height: 20.h),
              CustomDropdown(
                label: "Select Wing Teeth",
                hint: "Select teeth",
                items: ["A1", "A2", "B1", "C1"],
                onChanged: (val) {
                  controller.marylandwingTeeth.value = val ?? '';
                },
              ),
              SizedBox(height: 20.h),
              Align(
                  alignment: Alignment.centerLeft,
                  child: _TeethSelectionWidget(
                      selectedTeeth: controller.singleUnitTeeth)),
              SizedBox(height: 20.h),

              //select shade widget (global usage) just copy and paste where shade needed
              SingleShadeSelector(
                selectedShade: controller.shadeController,
                title: "Select Shade",
                hint: "Choose shade for selected teeth",
              ),
              SizedBox(height: 20.h),
              // _InstructionCardWidget(
              //   controller: controller.descriptionController,
              //   title: "Special Instructions",
              //   hintText: "Describe Your Instructions",
              // ),
              _FileUploadWidget(
                selectedFiles: controller.selectedFiles,
                onTap: controller.pickFiles,
                onFileDeleted: (file) =>
                    controller.removeFile(file, controller.selectedFiles),
                uploadTitle: "Upload Attachments",
                uploadHint: "Upload a video and photo",
              ),
            ],
          ),
        if (controller.showConventionalBridgeDropdown.value)
          Column(
            children: [
              CustomDropdown(
                label: "Pontic Design",
                hint: "Select teeth",
                items: [
                  "Full ridge",
                  "Modify Ridge Lap",
                  "No contact",
                  "Point contact",
                  "Point in socket (ovate)"
                ],
                onChanged: (val) {
                  controller.ponticDesign.value = val??"";
                },
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: _TeethSelectionWidget(
                    selectedTeeth: controller.conventionalBridgeTeeth),
              ),
              SizedBox(height: 20.h),
              //select shade widget (global usage) just copy and paste where shade needed
              SingleShadeSelector(
                selectedShade: controller.shadeController,
                title: "Select Shade",
                hint: "Choose shade for selected teeth",
              ),
              SizedBox(height: 20.h),
              // _InstructionCardWidget(
              //  controller: controller.descriptionController,
              //  title: "Description",
              //  hintText: "Describe your case",
              // ),
              _FileUploadWidget(
                selectedFiles: controller.selectedFiles,
                onTap: controller.pickFiles,
                onFileDeleted: (file) =>
                    controller.removeFile(file, controller.selectedFiles),
                uploadTitle: "Upload Attachments",
                uploadHint: "Upload a video and photo",
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildFullCastOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdown(
          label: "Full Cast Type",
          hint: "Select option",
          items: ["Single unit crown", "Bridge", "Post & Core"],
          onChanged: (val) => controller.onFullCastChange(val),
        ),
        SizedBox(height: 20.h),
        if (controller.showFullCastSingleUnit.value)
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: _TeethSelectionWidget(
                      selectedTeeth: controller.fullCastSingleUnitTeeth),
                ),
              ),
              SizedBox(height: 20.h),
              // _InstructionCardWidget(
              //   controller: controller.descriptionController,
              //   title: "Special Instructions",
              //   hintText: "Describe Your Instructions",
              // ),
              _FileUploadWidget(
                selectedFiles: controller.selectedFiles,
                onTap: controller.pickFiles,
                onFileDeleted: (file) =>
                    controller.removeFile(file, controller.selectedFiles),
                uploadTitle: "Upload Cover Image",
                uploadHint: "Upload a video and photo",
              ),
            ],
          ),
        if (controller.showFullCastBridge.value)
          Column(
            children: [
              CustomDropdown(
                label: "Pontic Design",
                hint: "Select teeth",
                items: [
                  "Full ridge",
                  "Modify Ridge Lap",
                  "No contact",
                  "Point contact",
                  "Point in socket (ovate)"
                ],
                onChanged: (val) {
                  controller.ponticDesign.value = val??"";
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: _TeethSelectionWidget(
                      selectedTeeth: controller.bridgeTeeth)),
              SizedBox(
                height: 20.h,
              ),
              // _InstructionCardWidget(
              //   controller: controller.descriptionController,
              //   title: "Description",
              //   hintText: "Describe your case",
              // ),
              _FileUploadWidget(
                selectedFiles: controller.selectedFiles,
                onTap: controller.pickFiles,
                onFileDeleted: (file) =>
                    controller.removeFile(file, controller.selectedFiles),
                uploadTitle: "Upload Attachments",
                uploadHint: "Upload a video and photo",
              ),
            ],
          ),
        if (controller.showPostAndCore.value)
          Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: _TeethSelectionWidget(
                      selectedTeeth: controller.postAndCoreTeeth)),
              SizedBox(height: 20.h),
              // _InstructionCardWidget(
              //   controller: controller.descriptionController,
              //   title: "Instructions",
              //   hintText: "Describe your Post & Core",
              // ),
              _FileUploadWidget(
                selectedFiles: controller.selectedFiles,
                onTap: controller.pickFiles,
                onFileDeleted: (file) =>
                    controller.removeFile(file, controller.selectedFiles),
                uploadTitle: "Upload Attachments",
                uploadHint: "Upload a video and photo",
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildStandardBuildMetalOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Metal Options",
              fontSize: 14.w,
              fontWeight: FontWeight.w500,
              bottom: 8.h,
            ),
            Obx(() => Row(
              children: [
                Row(
                  children: [
                    Radio<String>(
                      value: "Composite Inlay",
                      groupValue: controller.standardBuildMetalType.value,
                      onChanged: (val) {
                        if (val != null) {
                          controller.standardBuildMetalType.value = val;
                        }
                      },
                      activeColor: AppColors.primary,
                    ),
                    CustomText(
                      text: "Composite Inlay",
                      fontSize: 14.w,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                SizedBox(width: 20.w), // Space between radio buttons
                Row(
                  children: [
                    Radio<String>(
                      value: "Composite Onlay",
                      groupValue: controller.standardBuildMetalType.value,
                      onChanged: (val) {
                        if (val != null) {
                          controller.standardBuildMetalType.value = val;
                        }
                      },
                      activeColor: AppColors.primary,
                    ),
                    CustomText(
                      text: "Composite Onlay",
                      fontSize: 14.w,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            )),
          ],
        ),
        SizedBox(height: 20.h),
        Obx(() {
          if (controller.standardBuildMetalType.value.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: _TeethSelectionWidget(
                    selectedTeeth: controller.singleUnitTeeth,
                    title: "Select Teeth",
                  ),
                ),
                SizedBox(height: 20.h),
                // _InstructionCardWidget(
                //   controller: controller.descriptionController,
                //   title: "Special Instruction",
                //   hintText: "Describe your case",
                // ),
                // SizedBox(height: 15.h),
                _FileUploadWidget(
                  selectedFiles: controller.selectedFiles,
                  onTap: controller.pickFiles,
                  onFileDeleted: (file) =>
                      controller.removeFile(file, controller.selectedFiles),
                  uploadTitle: "Upload Attachments",
                  uploadHint: "Upload images or PDFs",
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        }),
      ],
    );
  }

  Widget _buildStandardDentures() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdown(
          label: "Denture Type",
          hint: "Select option",
          items: ["Denture Construction", "Denture Other"],
          onChanged: (val) => controller.onDentureTypeChange(val),
        ),
        SizedBox(height: 20.h),
        if (controller.showDentureConstruction.value)
          _buildDentureDetailsForm(),
        if (controller.showDentureOther.value)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDentureOtherCheckbox(
                title: "Denture Other",
                selectedValues: controller.dentureOtherSelections,
              ),
              SizedBox(height: 20.h),
              Align(
                  alignment: Alignment.centerLeft,
                  child: _TeethSelectionWidget(
                      selectedTeeth: controller.dentureTeeth)),
              SizedBox(height: 15.h),
              SingleShadeSelector(selectedShade: controller.shadeController),
              SizedBox(height: 15.h),
              // This UI part seems to have a bug in your original code.
              // It uses descriptionController, but the API sends dentureTryInDescController.
              // As requested, I am NOT changing the standard part.
              _InstructionCardWidget(
                controller: controller.descriptionController,
                title: "Description",
                hintText: "Describe your case (Reline, Repair, etc.)",
              ),
              SizedBox(height: 15.h),
              _FileUploadWidget(
                selectedFiles: controller.dentureAttachments,
                onTap: controller.pickFiles,
                onFileDeleted: (file) =>
                    controller.removeFile(file, controller.dentureAttachments),
                uploadTitle: "Upload Attachments",
                uploadHint: "Upload images or PDFs",
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildDentureDetailsForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCheckboxRow(
          title: "Bite Block",
          upperValue: controller.biteBlockUpper,
          lowerValue: controller.biteBlockLower,
        ),
        _buildCheckboxRow(
          title: "Special Tray",
          upperValue: controller.specialTrayUpper,
          lowerValue: controller.specialTrayLower,
        ),
        _buildDentureStageSelectionForms(),
      ],
    );
  }

  Widget _buildDentureStageSelectionForms() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdown(
          label: "Porcelain Butt Margin",
          hint: "Select detail",
          items: ["Try In", "Re-try In", "Finish"],
          onChanged: (val) => controller.porcelainButtMargin.value = val ?? '',
        ),
        SizedBox(height: 20.h),
        if (controller.porcelainButtMargin.value == "Try In")
          _buildDentureStageWidget(
            teethList: controller.dentureTeeth,
            // descriptionTitle: "Description", (Removed, global desc used)
            // descriptionHint: "Describe your Try In", (Removed, global desc used)
            descController: controller.descriptionController, // Uses global
            uploadTitle: "Upload Try In Attachments",
            fileList: controller.dentureAttachments,
            onUploadTap: controller.pickFiles,
            onFileDeleted: (file) =>
                controller.removeFile(file, controller.dentureAttachments),
          ),
        if (controller.porcelainButtMargin.value == "Re-try In")
          _buildDentureStageWidget(
            teethList: controller.dentureTeeth,
            // descriptionTitle: "Description", (Removed, global desc used)
            // descriptionHint: "Describe your Re-Try In", (Removed, global desc used)
            descController: controller.descriptionController, // Uses global
            uploadTitle: "Upload Re-Try In Attachments",
            fileList: controller.dentureAttachments,
            onUploadTap: controller.pickFiles,
            onFileDeleted: (file) =>
                controller.removeFile(file, controller.dentureAttachments),
          ),
        if (controller.porcelainButtMargin.value == "Finish")
        // This part has a bug in your original code (uses dentureFinishDescController
        // while API sends descriptionController). Per your request, I am not changing it.
          _buildDentureStageWidget(
            teethList: controller.dentureTeeth,
            // descriptionTitle: "Description", (Removed, global desc used)
            // descriptionHint: "Describe your Finish", (Removed, global desc used)
            descController: controller.dentureFinishDescController, // Bug in original
            uploadTitle: "Upload Finish Attachments",
            fileList: controller.dentureAttachments,
            onUploadTap: controller.pickFiles,
            onFileDeleted: (file) =>
                controller.removeFile(file, controller.dentureAttachments),
          ),
      ],
    );
  }

  Widget _buildDentureStageWidget({
    required RxList<String> teethList,
    // required String descriptionTitle, // No longer needed
    // required String descriptionHint, // No longer needed
    required TextEditingController descController,
    required String uploadTitle,
    required RxList<File> fileList,
    required VoidCallback onUploadTap,
    required Function(File) onFileDeleted,
  }) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: _TeethSelectionWidget(selectedTeeth: teethList)),
        SizedBox(height: 15.h),
        SingleShadeSelector(selectedShade: controller.shadeController),
        // Instruction card is now global
        // _InstructionCardWidget(
        //   controller: descController,
        //   title: descriptionTitle,
        //   hintText: descriptionHint,
        // ),
        SizedBox(height: 15.h),
        _FileUploadWidget(
          selectedFiles: fileList,
          onTap: onUploadTap,
          onFileDeleted: onFileDeleted,
          uploadTitle: uploadTitle,
          uploadHint: "Upload images or PDFs",
        ),
      ],
    );
  }

  Widget _buildCheckboxRow({
    required String title,
    required RxBool upperValue,
    required RxBool lowerValue,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: 16.w,
          fontWeight: FontWeight.w500,
          bottom: 8.h,
        ),
        Obx(() => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Checkbox(
                value: upperValue.value,
                activeColor: AppColors.primary,
                onChanged: (val) => upperValue.value = val ?? false,
              ),
              CustomText(
                  text: "Upper",
                  fontSize: 14.w,
                  fontWeight: FontWeight.w400),
            ]),
            Row(children: [
              Checkbox(
                value: lowerValue.value,
                activeColor: AppColors.primary,
                onChanged: (val) => lowerValue.value = val ?? false,
              ),
              CustomText(
                  text: "Lower",
                  fontSize: 14.w,
                  fontWeight: FontWeight.w400),
            ]),
          ],
        )),
        SizedBox(height: 15.h),
      ],
    );
  }

  Widget buildDentureOtherCheckbox({
    required String title,
    required RxList<String> selectedValues, // ✅ List for multiple selections
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: 16.w,
          fontWeight: FontWeight.w500,
          bottom: 8.h,
        ),
        Obx(() => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Reline Checkbox
            Row(
              children: [
                Checkbox(
                  value: selectedValues.contains("Reline"),
                  activeColor: AppColors.primary,
                  onChanged: (val) {
                    if (val == true) {
                      selectedValues.add("Reline");
                    } else {
                      selectedValues.remove("Reline");
                    }
                  },
                ),
                CustomText(
                  text: "Reline",
                  fontSize: 14.w,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(width: 10.w),
              ],
            ),
            // ✅ Repair Checkbox
            Row(
              children: [
                Checkbox(
                  value: selectedValues.contains("Repair"),
                  activeColor: AppColors.primary,
                  onChanged: (val) {
                    if (val == true) {
                      selectedValues.add("Repair");
                    } else {
                      selectedValues.remove("Repair");
                    }
                  },
                ),
                CustomText(
                  text: "Repair",
                  fontSize: 14.w,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(width: 10.w),
              ],
            ),
            // ✅ Addition Checkbox
            Row(
              children: [
                Checkbox(
                  value: selectedValues.contains("Addition"),
                  activeColor: AppColors.primary,
                  onChanged: (val) {
                    if (val == true) {
                      selectedValues.add("Addition");
                    } else {
                      selectedValues.remove("Addition");
                    }
                  },
                ),
                CustomText(
                  text: "Addition",
                  fontSize: 14.w,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ],
        )),
        SizedBox(height: 15.h),
      ],
    );
  }

  // ============================================
  // ========= PREMIUM SECTION (UPDATED) ========
  // ============================================

  /// MARK: Premium Section
  Widget _buildPremiumSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdown(
          label: "Premium Type",
          hint: "Select Type",
          items: [
            "CROWN/BRIDGE",
            "DENTURES",
            "IMPLANTS",
            "ORTHODONTIC",
            "MISC"
          ],
          onChanged: (val) => controller.onPremiumTypeChange(val ?? ''),
        ),
        SizedBox(height: 20.h),
        if (controller.premiumType.value == "CROWN/BRIDGE")
          _buildPremiumCrownBridge(),

        if (controller.premiumType.value == "DENTURES") _buildPremiumDentures(),

        if (controller.premiumType.value == "ORTHODONTIC")
          _buildPremiumOrthodontic(),

        if (controller.premiumType.value == "MISC") _buildPremiumMisc(),

        // TODO: Add IMPLANTS form
      ],
    );
  }

  Widget _buildPremiumCrownBridge() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdown(
          label: "Crown / BRIDGE Type",
          hint: "Select Crown Type",
          items: ["PFM (NP)", "FULL CAST", "METAL"],
          onChanged: (val) => controller.onPremiumCrownTypeChange(val),
        ),
        SizedBox(height: 20.h),
        // ✅ Reusing standard PFM/FullCast widgets
        if (controller.crownType.value == "PFM (NP)") _buildPfmNpOptions(),
        if (controller.crownType.value == "FULL CAST") _buildFullCastOptions(),
        // ✅ This will now render the new, complex metal options
        if (controller.crownType.value == "METAL") _buildMetalOptions(),
      ],
    );
  }

  Widget _buildMetalOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdown(
          label: "Pontic Design",
          hint: "Select design",
          items: ["Emax", "Zirconia", "Composite Onlay"],
          onChanged: (val) {
            controller.ponticDesign.value = val ?? '';
            controller.emaxType.value = '';
            controller.zirconiaType.value = '';
          },
        ),
        SizedBox(height: 20.h),

        // ✅ =================================
        // ✅ Step 2: EMAX FLOW
        // ✅ =================================
        Obx(() {
          if (controller.ponticDesign.value == "Emax") {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDropdown(
                  label: "Select Emax Type",
                  hint: "Select Emax type",
                  items: ["Single unit crown", "Veneer"],
                  onChanged: (val) => controller.emaxType.value = val ?? '',
                ),
                SizedBox(height: 20.h),

                // ✅ Emax -> Single unit crown
                if (controller.emaxType.value == "Single unit crown")
                  Column(
                    children: [
                      ShadeSelectionDropdown(
                        selectedShades: controller.emaxTeeth,
                        title: "Select Teeth & Shade",
                        hint: "Choose teeth for Emax",
                      ),
                      SizedBox(height: 15.h),
                      // ✅ UPDATED: Uses global description controller
                      // _InstructionCardWidget(
                      //   controller: controller.descriptionController,
                      //   title: "Description",
                      //   hintText: "Describe your Emax case",
                      // ),
                      // SizedBox(height: 15.h),
                      _FileUploadWidget(
                        selectedFiles: controller.emaxAttachments,
                        onTap: controller.pickFiles,
                        onFileDeleted: (file) => controller.removeFile(
                            file, controller.emaxAttachments),
                        uploadTitle: "Upload Emax Attachments",
                        uploadHint: "Upload images or PDFs",
                      ),
                    ],
                  ),

                // ✅ Emax -> Veneer
                if (controller.emaxType.value == "Veneer")
                  Column(
                    children: [
                      ShadeSelectionDropdown(
                        selectedShades: controller.emaxVeneerTeeth, // NEW
                        title: "Select Teeth & Shade",
                        hint: "Choose teeth for Veneer",
                      ),
                      SizedBox(height: 15.h),
                      // ✅ UPDATED: Uses global description controller
                      // _InstructionCardWidget(
                      //   controller: controller.descriptionController, // NEW
                      //   title: "Instructions",
                      //   hintText: "Describe your Veneer case",
                      // ),
                      // SizedBox(height: 15.h),
                      _FileUploadWidget(
                        selectedFiles: controller.emaxVeneerAttachments, // NEW
                        onTap: controller.pickFiles,
                        onFileDeleted: (file) => controller.removeFile(
                            file, controller.emaxVeneerAttachments),
                        uploadTitle: "Upload Veneer Attachments",
                        uploadHint: "Upload images or PDFs",
                      ),
                    ],
                  ),
              ],
            );
          }
          return const SizedBox.shrink(); // Hide if not Emax
        }),

        // ✅ =================================
        // ✅ Step 3: ZIRCONIA FLOW
        // ✅ =================================
        Obx(() {
          if (controller.ponticDesign.value == "Zirconia") {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDropdown(
                  label: "Select Zirconia Type",
                  hint: "Select Zirconia type",
                  items: [
                    "Single unit crown",
                    "Veneer",
                    "Maryland bridge",
                    "Conventional Bridge"
                  ],
                  onChanged: (val) => controller.zirconiaType.value = val ?? '',
                ),
                SizedBox(height: 20.h),

                // ✅ Zirconia -> Single unit crown
                if (controller.zirconiaType.value == "Single unit crown")
                  Column(
                    children: [
                      ShadeSelectionDropdown(
                        selectedShades: controller.zirconiaTeeth,
                        title: "Select Teeth & Shade",
                        hint: "Choose teeth for Zirconia",
                      ),
                      SizedBox(height: 15.h),
                      // ✅ UPDATED: Uses global description controller
                      // _InstructionCardWidget(
                      //   controller: controller.descriptionController,
                      //   title: "Instructions",
                      //   hintText: "Describe your Zirconia case",
                      // ),
                      // SizedBox(height: 15.h),
                      _FileUploadWidget(
                        selectedFiles:
                        controller.zirconiaAttachments,
                        onTap: controller.pickFiles,
                        onFileDeleted: (file) => controller.removeFile(
                            file, controller.zirconiaAttachments),
                        uploadTitle: "Upload Zirconia Attachments",
                        uploadHint: "Upload images or PDFs",
                      ),
                    ],
                  ),

                // ✅ Zirconia -> Veneer
                if (controller.zirconiaType.value == "Veneer")
                  Column(
                    children: [
                      ShadeSelectionDropdown(
                        selectedShades: controller.zirconiaVeneerTeeth, // NEW
                        title: "Select Teeth & Shade",
                        hint: "Choose teeth for Veneer",
                      ),
                      SizedBox(height: 15.h),
                      // ✅ UPDATED: Uses global description controller
                      // _InstructionCardWidget(
                      //   controller: controller.descriptionController, // NEW
                      //   title: "Instructions",
                      //   hintText: "Describe your Veneer case",
                      // ),
                      // SizedBox(height: 15.h),
                      _FileUploadWidget(
                        selectedFiles:
                        controller.zirconiaVeneerAttachments, // NEW
                        onTap: controller.pickFiles,
                        onFileDeleted: (file) => controller.removeFile(
                            file, controller.zirconiaVeneerAttachments),
                        uploadTitle: "Upload Veneer Attachments",
                        uploadHint: "Upload images or PDFs",
                      ),
                    ],
                  ),

                // ✅ Zirconia -> Maryland bridge
                if (controller.zirconiaType.value == "Maryland bridge")
                  _buildReusableMarylandBridgeForm(), // NEW HELPER

                // ✅ Zirconia -> Conventional Bridge
                if (controller.zirconiaType.value == "Conventional Bridge")
                  _buildReusableConventionalBridgeForm(), // NEW HELPER
              ],
            );
          }
          return const SizedBox.shrink(); // Hide if not Zirconia
        }),

        // ✅ =================================
        // ✅ Step 4: COMPOSITE ONLAY FLOW
        // ✅ =================================
        Obx(() {
          if (controller.ponticDesign.value == "Composite Onlay") {
            return Column(
              children: [
                ShadeSelectionDropdown(
                  selectedShades: controller.compositeOnlayTeeth, // NEW
                  title: "Select Teeth & Shade",
                  hint: "Choose teeth for Composite Onlay",
                ),
                SizedBox(height: 15.h),
                // ✅ UPDATED: Uses global description controller
                // _InstructionCardWidget(
                //   controller:
                //       controller.descriptionController, // NEW
                //   title: "Instructions",
                //   hintText: "Describe your Composite Onlay case",
                // ),
                // SizedBox(height: 15.h),
                _FileUploadWidget(
                  selectedFiles: controller.compositeOnlayAttachments, // NEW
                  onTap: controller.pickFiles,
                  onFileDeleted: (file) => controller.removeFile(
                      file, controller.compositeOnlayAttachments),
                  uploadTitle: "Upload Composite Onlay Attachments",
                  uploadHint: "Upload images or PDFs",
                ),
              ],
            );
          }
          return const SizedBox.shrink(); // Hide if not Composite Onlay
        }),
      ],
    );
  }

  Widget _buildPremiumOrthodontic() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdown(
          label: "Orthodontic Type",
          hint: "Select option",
          items: ["Fixed Retainer", "Essix Retainer"],
          onChanged: (val) =>
          controller.premiumOrthodonticType.value = val ?? '',
        ),
        SizedBox(height: 20.h),

        // --- 1. Fixed Retainer ---
        Obx(() {
          if (controller.premiumOrthodonticType.value == "Fixed Retainer") {
            return Column(
              children: [
                _InstructionCardWidget(
                  controller: controller.orthoFixedRetainerController,
                  title: "Description",
                  hintText: "Describe your Fixed Retainer case",
                ),
                SizedBox(height: 15.h),
                _FileUploadWidget(
                  selectedFiles: controller.orthoFixedRetainerAttachments,
                  onTap: controller.pickFiles,
                  onFileDeleted: (file) => controller.removeFile(
                      file, controller.orthoFixedRetainerAttachments),
                  uploadTitle: "Upload Attachments",
                  uploadHint: "Upload images or PDFs",
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        }),

        // --- 2. Essix Retainer ---
        Obx(() {
          if (controller.premiumOrthodonticType.value == "Essix Retainer") {
            return Column(
              children: [
                _InstructionCardWidget(
                  controller: controller.orthoEssixRetainerController,
                  title: "Description",
                  hintText: "Describe your Essix Retainer case",
                ),
                SizedBox(height: 15.h),
                _FileUploadWidget(
                  selectedFiles: controller.orthoEssixRetainerAttachments,
                  onTap: controller.pickFiles,
                  onFileDeleted: (file) => controller.removeFile(
                      file, controller.orthoEssixRetainerAttachments),
                  uploadTitle: "Upload Attachments",
                  uploadHint: "Upload images or PDFs",
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        }),
      ],
    );
  }

  Widget _buildPremiumMisc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdown(
          label: "Misc Type",
          hint: "Select option",
          items: [
            "Study Module",
            "Sports Guard",
            "TW",
            "Night Guard",
            "Vacuum Formed Stent",
            "Re-etch"
          ],
          onChanged: (val) {
            controller.premiumMiscType.value = val ?? '';
            controller.miscStudyModuleSelection.value = '';
            controller.miscTwSelection.value = '';
            controller.miscNightGuardSelection.value = '';
            controller.miscReEtchSelection.value = '';
          },
        ),
        SizedBox(height: 20.h),

        // --- 1. Study Module ---
        Obx(() {
          if (controller.premiumMiscType.value == "Study Module") {
            return Column(
              children: [
                _buildSingleSelectRadioList(
                  title: "Study Module Options",
                  options: ["Diagnostic Wax", "Select Teeth"],
                  groupValue: controller.miscStudyModuleSelection,
                ),
                Obx(() {
                  if (controller.miscStudyModuleSelection.value ==
                      "Select Teeth") {
                    return Column(
                      children: [
                        SizedBox(height: 15.h),
                        _TeethSelectionWidget(
                          selectedTeeth: controller.miscStudyModuleTeeth,
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                }),
                SizedBox(height: 15.h),
                _InstructionCardWidget(
                  controller: controller.miscStudyModuleController,
                  title: "Description",
                  hintText: "Describe your Study Module case",
                ),
                SizedBox(height: 15.h),
                _FileUploadWidget(
                  selectedFiles: controller.miscStudyModuleAttachments,
                  onTap: controller.pickFiles,
                  onFileDeleted: (file) => controller.removeFile(
                      file, controller.miscStudyModuleAttachments),
                  uploadTitle: "Upload Attachments",
                  uploadHint: "Upload images or PDFs",
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        }),

        // --- 2. Sports Guard ---
        Obx(() {
          if (controller.premiumMiscType.value == "Sports Guard") {
            return Column(
              children: [
                _InstructionCardWidget(
                  controller: controller.miscSportsGuardController,
                  title: "Color",
                  hintText: "Specify desired color(s)",
                ),
                SizedBox(height: 15.h),
                _FileUploadWidget(
                  selectedFiles: controller.miscSportsGuardAttachments,
                  onTap: controller.pickFiles,
                  onFileDeleted: (file) => controller.removeFile(
                      file, controller.miscSportsGuardAttachments),
                  uploadTitle: "Upload Attachments",
                  uploadHint: "Upload images or PDFs",
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        }),

        // --- 3. TW (Tray Whitening) ---
        Obx(() {
          if (controller.premiumMiscType.value == "TW") {
            return Column(
              children: [
                _buildSingleSelectRadioList(
                  title: "TW Options",
                  options: ["With Reservoirs", "Without Reservoirs"],
                  groupValue: controller.miscTwSelection,
                ),
                SizedBox(height: 15.h),
                _InstructionCardWidget(
                  controller: controller.miscTwController,
                  title: "Description",
                  hintText: "Describe your TW case",
                ),
                SizedBox(height: 15.h),
                _FileUploadWidget(
                  selectedFiles: controller.miscTwAttachments,
                  onTap: controller.pickFiles,
                  onFileDeleted: (file) =>
                      controller.removeFile(file, controller.miscTwAttachments),
                  uploadTitle: "Upload Attachments",
                  uploadHint: "Upload images or PDFs",
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        }),

        // --- 4. Night Guard ---
        Obx(() {
          if (controller.premiumMiscType.value == "Night Guard") {
            return Column(
              children: [
                _buildSingleSelectRadioList(
                  title: "Night Guard Options",
                  options: ["Soft", "Hard Acrylic"],
                  groupValue: controller.miscNightGuardSelection,
                ),
                SizedBox(height: 15.h),
                _InstructionCardWidget(
                  controller: controller.miscNightGuardController,
                  title: "Description",
                  hintText: "Describe your Night Guard case",
                ),
                SizedBox(height: 15.h),
                _FileUploadWidget(
                  selectedFiles: controller.miscNightGuardAttachments,
                  onTap: controller.pickFiles,
                  onFileDeleted: (file) => controller.removeFile(
                      file, controller.miscNightGuardAttachments),
                  uploadTitle: "Upload Attachments",
                  uploadHint: "Upload images or PDFs",
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        }),

        // --- 5. Vacuum Formed Stent --- (NEW)
        Obx(() {
          if (controller.premiumMiscType.value == "Vacuum Formed Stent") {
            return Column(
              children: [
                _InstructionCardWidget(
                  controller: controller.miscVacuumStentController,
                  title: "Description",
                  hintText: "Describe your Vacuum Formed Stent case",
                ),
                SizedBox(height: 15.h),
                _FileUploadWidget(
                  selectedFiles: controller.miscVacuumStentAttachments,
                  onTap: controller.pickFiles,
                  onFileDeleted: (file) => controller.removeFile(
                      file, controller.miscVacuumStentAttachments),
                  uploadTitle: "Upload Attachments",
                  uploadHint: "Upload images or PDFs",
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        }),

        // --- 6. Re-etch ---
        Obx(() {
          if (controller.premiumMiscType.value == "Re-etch") {
            return Column(
              children: [
                _buildSingleSelectRadioList(
                  title: "Re-etch Options",
                  options: ["Crown", "Bridge"],
                  groupValue: controller.miscReEtchSelection,
                ),
                SizedBox(height: 15.h),
                _InstructionCardWidget(
                  controller: controller.miscReEtchController,
                  title: "Description",
                  hintText: "Describe your Re-etch case",
                ),
                SizedBox(height: 15.h),
                _FileUploadWidget(
                  selectedFiles: controller.miscReEtchAttachments,
                  onTap: controller.pickFiles,
                  onFileDeleted: (file) => controller.removeFile(
                      file, controller.miscReEtchAttachments),
                  uploadTitle: "Upload Attachments",
                  uploadHint: "Upload images or PDFs",
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        }),
      ],
    );
  }

  Widget _buildPremiumDentures() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdown(
          label: "Denture Type",
          hint: "Select option",
          items: ["Denture Construction", "Denture Other"],
          onChanged: (val) => controller.onPremiumDentureTypeChange(val),
        ),
        SizedBox(height: 20.h),
        if (controller.showDentureConstruction.value)
          _buildPremiumDentureConstructionForm(),

        if (controller.showDentureOther.value)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDentureOtherCheckbox(
                title: "Denture Other",
                selectedValues: controller.dentureOtherSelections,
              ),
              SizedBox(height: 20.h),

              Align(
                  alignment: Alignment.centerLeft,
                  child: _TeethSelectionWidget(
                      selectedTeeth: controller.premiumDentureTryInMetalTeeth)),
              SizedBox(height: 15.h),

              SingleShadeSelector(selectedShade: controller.shadeController),
              SizedBox(height: 15.h),

              // ✅ This specific "other" description uses its own controller
              _InstructionCardWidget(
                controller: controller.premiumDentureTryInMetalController,
                title: "Description",
                hintText: "Describe your case (Reline, Repair, etc.)",
              ),
              SizedBox(height: 15.h),

              _FileUploadWidget(
                selectedFiles: controller.premiumDentureTryInMetalAttachments,
                onTap: controller.pickFiles,
                onFileDeleted: (file) => controller.removeFile(
                    file, controller.premiumDentureTryInMetalAttachments),
                uploadTitle: "Upload Attachments",
                uploadHint: "Upload images or PDFs",
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildPremiumDentureConstructionForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCheckboxRow(
          title: "Bite Block",
          upperValue: controller.biteBlockUpper,
          lowerValue: controller.biteBlockLower,
        ),
        _buildCheckboxRow(
          title: "Special Tray",
          upperValue: controller.specialTrayUpper,
          lowerValue: controller.specialTrayLower,
        ),
        Text(
          "Clasps(selected number)",
          style: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 20.h),
        Text(
          "Mesh Reinforcement",
          style: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 20.h),
        _buildPremiumDentureStageSelectionForms(),
      ],
    );
  }

  Widget _buildPremiumDentureStageSelectionForms() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdown(
          label: "Select Denture Construction Type",
          hint: "Select stage",
          items: [
            "Try In with metal framework CoCr",
            "Re-try In",
            "Finish Acrylic",
            "Finish Flexi"
          ],
          onChanged: (val) =>
          controller.premiumDentureConstructionType.value = val ?? '',
        ),
        SizedBox(height: 20.h),

        // --- 3. Conditional Stage Forms ---
        Obx(() {
          // --- 3.1. Try In with Metal ---
          if (controller.premiumDentureConstructionType.value ==
              "Try In with metal framework CoCr") {
            return _buildDentureStageWidget(
              teethList: controller.premiumDentureTryInMetalTeeth,
              // ✅ UPDATED: Use global controller
              descController: controller.descriptionController,
              uploadTitle: "Upload Try In Attachments",
              fileList: controller.premiumDentureTryInMetalAttachments,
              onUploadTap: controller.pickFiles,
              onFileDeleted: (file) => controller.removeFile(
                  file, controller.premiumDentureTryInMetalAttachments),
            );
          }

          // --- 3.2. Re-try In ---
          if (controller.premiumDentureConstructionType.value == "Re-try In") {
            return _buildDentureStageWidget(
              teethList: controller.premiumDentureReTryInTeeth,
              // ✅ UPDATED: Use global controller
              descController: controller.descriptionController,
              uploadTitle: "Upload Re-Try In Attachments",
              fileList: controller.premiumDentureReTryInAttachments,
              onUploadTap: controller.pickFiles,
              onFileDeleted: (file) => controller.removeFile(
                  file, controller.premiumDentureReTryInAttachments),
            );
          }

          // --- 3.3. Finish Acrylic ---
          if (controller.premiumDentureConstructionType.value ==
              "Finish Acrylic") {
            return _buildDentureStageWidget(
              teethList: controller.premiumDentureFinishAcrylicTeeth,
              // ✅ UPDATED: Use global controller
              descController: controller.descriptionController,
              uploadTitle: "Upload Finish Acrylic Attachments",
              fileList: controller.premiumDentureFinishAcrylicAttachments,
              onUploadTap: controller.pickFiles,
              onFileDeleted: (file) => controller.removeFile(
                  file, controller.premiumDentureFinishAcrylicAttachments),
            );
          }

          // --- 3.4. Finish Flexi ---
          if (controller.premiumDentureConstructionType.value ==
              "Finish Flexi") {
            return _buildDentureStageWidget(
              teethList: controller.premiumDentureFinishFlexiTeeth,
              // ✅ UPDATED: Use global controller
              descController: controller.descriptionController,
              uploadTitle: "Upload Finish Flexi Attachments",
              fileList: controller.premiumDentureFinishFlexiAttachments,
              onUploadTap: controller.pickFiles,
              onFileDeleted: (file) => controller.removeFile(
                  file, controller.premiumDentureFinishFlexiAttachments),
            );
          }
          return const SizedBox.shrink();
        }),
      ],
    );
  }

  Widget _buildReusableMarylandBridgeForm() {
    return Column(
      children: [
        CustomDropdown(
          label: "Select Pontic Teeth",
          hint: "Select teeth",
          items: [
            "Full ridge",
            "Modify",
            "No contract",
            "Point contact",
            "Point in socket (ovate)"
          ],
          onChanged: (val) {
            // TODO: Connect to controller if needed
          },
        ),
        SizedBox(height: 20.h),
        CustomDropdown(
          label: "Select Wing Teeth",
          hint: "Select teeth",
          items: ["A1", "A2", "B1", "C1"], // This list seems to be shades
          onChanged: (val) {
            // TODO: Connect to controller if needed
          },
        ),
        SizedBox(height: 20.h),
        Align(
            alignment: Alignment.centerLeft,
            child: ShadeSelectionDropdown(
                selectedShades: controller.zirconiaMarylandBridgeTeeth) // NEW
        ),
        SizedBox(height: 20.h),
        // ✅ UPDATED: Use global controller
        // _InstructionCardWidget(
        //   controller:
        //       controller.descriptionController, // NEW
        //   title: "Special Instructions",
        //   hintText: "Describe Your Instructions",
        // ),
        _FileUploadWidget(
          selectedFiles: controller.zirconiaMarylandBridgeAttachments, // NEW
          onTap: controller.pickFiles,
          onFileDeleted: (file) => controller.removeFile(
              file, controller.zirconiaMarylandBridgeAttachments),
          uploadTitle: "Upload Attachments",
          uploadHint: "Upload a video and photo",
        ),
      ],
    );
  }

  Widget _buildReusableConventionalBridgeForm() {
    return Column(
      children: [
        CustomDropdown(
          label: "Pontic Design",
          hint: "Select teeth",
          items: [
            "Full ridge",
            "Modify Ridge Lap",
            "No contact",
            "Point contact",
            "Point in socket (ovate)"
          ],
          onChanged: (val) {
            // TODO: Connect to controller if needed
          },
        ),
        SizedBox(height: 20.h),
        Align(
          alignment: Alignment.centerLeft,
          child: ShadeSelectionDropdown(
              selectedShades:
              controller.zirconiaConventionalBridgeTeeth), // NEW
        ),
        SizedBox(height: 20.h),
        // ✅ UPDATED: Use global controller
        // _InstructionCardWidget(
        //   controller:
        //       controller.descriptionController, // NEW
        //   title: "Description",
        //   hintText: "Describe your case",
        // ),
        _FileUploadWidget(
          selectedFiles:
          controller.zirconiaConventionalBridgeAttachments, // NEW
          onTap: controller.pickFiles,
          onFileDeleted: (file) => controller.removeFile(
              file, controller.zirconiaConventionalBridgeAttachments),
          uploadTitle: "Upload Attachments",
          uploadHint: "Upload a video and photo",
        ),
      ],
    );
  }
} // ✅ End of AddCaseScreen class

///Shades selection widget
/// ✅ Professional Shade Selector Dropdown Widget
/// ✅ Multiple Selection Support via Dropdown
/// ✅ Data will be sent as selected (e.g., ["A1", "B2"])
class ShadeSelectionDropdown extends StatelessWidget {
  final RxList<String> selectedShades;
  final String title;
  final String hint;
  // ✅ Complete shade list (A1-A4, B1-B4, C1-C4, D1-D4)
  static const List<String> allShades = [
    "A1",
    "A2",
    "A3",
    "A4",
    "B1",
    "B2",
    "B3",
    "B4",
    "C1",
    "C2",
    "C3",
    "C4",
    "D1",
    "D2",
    "D3",
    "D4",
  ];
  const ShadeSelectionDropdown({
    Key? key,
    required this.selectedShades,
    this.title = "Select Shades",
    this.hint = "Choose shades",
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: 16.w,
          fontWeight: FontWeight.w600,
          bottom: 8.h,
        ),
        // ✅ Dropdown Button
        Obx(() => Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey1),
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.white,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(
                selectedShades.isEmpty
                    ? hint
                    : "${selectedShades.length} shade(s) selected",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: selectedShades.isEmpty
                      ? AppColors.grey1
                      : AppColors.black,
                ),
              ),
              icon: Icon(Icons.arrow_drop_down, color: AppColors.primary),
              items: allShades.map((shade) {
                final isSelected = selectedShades.contains(shade);
                return DropdownMenuItem<String>(
                  value: shade,
                  // ✅ This ensures the dropdown doesn't close on item click
                  // ✅ We handle the logic in onChanged
                  child: StatefulBuilder(
                    builder: (context, setState) {
                      return InkWell(
                        onTap: () {
                          // This is where we manually toggle the state
                          if (selectedShades.contains(shade)) {
                            selectedShades.remove(shade);
                          } else {
                            selectedShades.add(shade);
                          }
                          // We call setState to rebuild the checkbox
                          setState(() {});
                        },
                        child: Row(
                          children: [
                            Checkbox(
                              value: isSelected,
                              activeColor: AppColors.primary,
                              onChanged: (val) {
                                // Toggle state
                                if (val == true) {
                                  selectedShades.add(shade);
                                } else {
                                  selectedShades.remove(shade);
                                }
                              },
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              shade,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
              onChanged: (value) {
                // This callback is still triggered, but we don't need to
                // close the dropdown. The state is already updated.
              },
              value: null,
            ),
          ),
        )),
        // ✅ Selected Shades Display (Chips)
        SizedBox(height: 12.h),
        Obx(() {
          if (selectedShades.isEmpty) {
            return CustomText(
              text: "No shades selected",
              fontSize: 13.sp,
              color: AppColors.grey1,
              fontWeight: FontWeight.w400,
            );
          }
          return Wrap(
            spacing: 6.w,
            runSpacing: 6.h,
            children: selectedShades.map((shade) {
              return Chip(
                label: Text(
                  shade,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: AppColors.primary,
                deleteIcon: const Icon(
                  Icons.close,
                  size: 16,
                  color: Colors.white,
                ),
                onDeleted: () => selectedShades.remove(shade),
              );
            }).toList(),
          );
        }),
      ],
    );
  }
}

/// MARK: Reusable Private Widgets (FIXED)
class _TeethSelectionWidget extends StatelessWidget {
  final RxList<String> selectedTeeth;
  final List<String> availableShades;
  final String title; // ✅ New: Title parameter
  const _TeethSelectionWidget(
      {required this.selectedTeeth,
        this.availableShades = const ["A1", "A2", "A3", "B1", "C1"],
        this.title = 'Select Teeth' // ✅ Default title
      });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: 14.w,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.left,
          bottom: 5.h,
          top: 5.h,
        ),
        Wrap(
          spacing: 15,
          children: availableShades.map((shade) {
            return Obx(() => FilterChip(
              label: Text(shade),
              selected: selectedTeeth.contains(shade),
              onSelected: (selected) {
                if (selected) {
                  selectedTeeth.add(shade);
                } else {
                  selectedTeeth.remove(shade);
                }
              },
            ));
          }).toList(),
        ),
      ],
    );
  }
}

class _InstructionCardWidget extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final int maxLine;
  const _InstructionCardWidget({
    required this.controller,
    required this.title,
    required this.hintText,
    this.maxLine = 4,
  });
  @override
  Widget build(BuildContext context) {
    return CustomFormCard(
      title: title,
      hintText: hintText,
      maxLine: maxLine,
      controller: controller, // ✅ Ekhon controller pass hocche
    );
  }
}

class _FileUploadWidget extends StatelessWidget {
  final RxList<File> selectedFiles;
  final VoidCallback onTap;
  final Function(File) onFileDeleted; // ✅ FIXED
  final String uploadTitle;
  final String uploadHint;
  const _FileUploadWidget({
    required this.selectedFiles,
    required this.onTap,
    required this.onFileDeleted, // ✅ FIXED
    required this.uploadTitle,
    required this.uploadHint,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          textAlign: TextAlign.start,
          text: uploadTitle,
          fontSize: 16.w,
          fontWeight: FontWeight.w500,
          bottom: 8.h,
        ),
        Obx(() {
          return GestureDetector(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: AppColors.grey1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: selectedFiles.isNotEmpty
                  ? Wrap(
                spacing: 8,
                runSpacing: 8,
                children: selectedFiles.map((file) {
                  String fileName = file.path.split('/').last;
                  return Chip(
                    label: Text(
                      fileName,
                      overflow: TextOverflow.ellipsis,
                    ),
                    avatar: Icon(
                      file.path.endsWith(".pdf")
                          ? Icons.picture_as_pdf
                          : Icons.image,
                      size: 20,
                      color: AppColors.primary,
                    ),
                    onDeleted: () {
                      onFileDeleted(file); // ✅ FIXED
                    },
                  );
                }).toList(),
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),
                  Icon(Icons.upload_file,
                      size: 50, color: AppColors.grey1),
                  SizedBox(height: 10.h),
                  CustomText(
                    text: uploadHint,
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
    );
  }
}

// ✅ ==========================================================
// ✅ NEW REUSABLE WIDGET: _buildSingleSelectRadioList
// ✅ ==========================================================
Widget _buildSingleSelectRadioList({
  required String title,
  required List<String> options,
  required RxString groupValue, // Use RxString for single selection
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(
        text: title,
        fontSize: 16.w,
        fontWeight: FontWeight.w500,
        bottom: 8.h,
      ),
      Obx(() => Column(
        children: options.map((option) {
          return RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: groupValue.value,
            onChanged: (val) {
              if (val != null) {
                groupValue.value = val;
              }
            },
            activeColor: AppColors.primary,
            contentPadding: EdgeInsets.zero,
            dense: true,
          );
        }).toList(),
      )),
      SizedBox(height: 15.h),
    ],
  );
}

/// ✅ SINGLE SHADE SELECTOR DROPDOWN
/// Reusable widget for selecting ONE shade
class SingleShadeSelector extends StatelessWidget {
  final RxString selectedShade;
  final String title;
  final String hint;

  // ✅ Complete shade list (A1-A4, B1-B4, C1-C4, D1-D4)
  static const List<String> allShades = [
    "A1",
    "A2",
    "A3",
    "A4",
    "B1",
    "B2",
    "B3",
    "B4",
    "C1",
    "C2",
    "C3",
    "C4",
    "D1",
    "D2",
    "D3",
    "D4",
  ];

  const SingleShadeSelector({
    Key? key,
    required this.selectedShade,
    this.title = "Select Shade",
    this.hint = "Choose shade",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: 16.w,
          fontWeight: FontWeight.w600,
          bottom: 8.h,
        ),
        Obx(() => Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey1),
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.white,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(
                hint,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.grey1,
                ),
              ),
              value:
              selectedShade.value.isEmpty ? null : selectedShade.value,
              icon: Icon(Icons.arrow_drop_down, color: AppColors.primary),
              items: allShades.map((shade) {
                return DropdownMenuItem<String>(
                  value: shade,
                  child: Text(
                    shade,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (val) {
                if (val != null) {
                  selectedShade.value = val;
                }
              },
            ),
          ),
        )),

        // ✅ Selected Shade Display (Optional but nice UX)
        SizedBox(height: 8.h),
        Obx(() {
          if (selectedShade.value.isEmpty) {
            return const SizedBox.shrink();
          }
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(color: AppColors.primary, width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle, color: AppColors.primary, size: 16.sp),
                SizedBox(width: 6.w),
                Text(
                  "Selected: ${selectedShade.value}",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}