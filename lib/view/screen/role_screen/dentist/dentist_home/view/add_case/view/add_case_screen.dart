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
        // ✅ NOTUN WIDGET ADD KORA HOYECHE (Original code-e chilo)
        // ✅ =================================
        SizedBox(height: 20.h),
        // CustomFormCard(
        //  title: 'Global Case Description',
        //  hintText: 'Add any overall case notes or instructions...',
        //  controller: controller.descriptionController, // Notun controller connect kora holo
        //  maxLine: 4,
        // ),
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
            children: [
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

              _InstructionCardWidget(
                // ✅ FIXED
                controller: controller.descriptionController,
                title: "Special Instructions",
                hintText: "Describe Your Instructions",
              ),
              _FileUploadWidget(
                selectedFiles: controller.selectedFiles,
                onTap: controller.pickFiles,
                // ✅ FIXED
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
              _InstructionCardWidget(
                // ✅ FIXED
                controller: controller.descriptionController,
                title: "Special Instructions",
                hintText: "Describe Your Instructions",
              ),
              _FileUploadWidget(
                selectedFiles: controller.selectedFiles,
                onTap: controller.pickFiles,
                // ✅ FIXED
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
              _InstructionCardWidget(
                // ✅ FIXED
                controller: controller.descriptionController,
                title: "Description",
                hintText: "Describe your case",
              ),
              _FileUploadWidget(
                selectedFiles: controller.selectedFiles,
                onTap: controller.pickFiles,
                // ✅ FIXED
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
              // CustomDropdown(
              //  label: "Porcelain Butt Margin",
              //  hint: "Select detail",
              //  items: ["360", "Buccal Only"],
              //  onChanged: (val) {},
              // ),
              Align(
                alignment: Alignment.centerLeft,
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: _TeethSelectionWidget(
                      selectedTeeth: controller.fullCastSingleUnitTeeth),
                ),
              ),
              SizedBox(height: 20.h),
              _InstructionCardWidget(
                // ✅ FIXED
                controller: controller.descriptionController,
                title: "Special Instructions",
                hintText: "Describe Your Instructions",
              ),
              _FileUploadWidget(
                selectedFiles: controller.selectedFiles,
                onTap: controller.pickFiles,
                // ✅ FIXED
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
              _InstructionCardWidget(
                // ✅ FIXED
                controller: controller.descriptionController,
                title: "Description",
                hintText: "Describe your case",
              ),
              _FileUploadWidget(
                selectedFiles: controller.selectedFiles,
                onTap: controller.pickFiles,
                // ✅ FIXED
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
              // CustomDropdown(
              //  label: "Post Type",
              //  hint: "Select detail",
              //  items: ["Custom", "Prefabricated"],
              //  onChanged: (val) {},
              // ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: _TeethSelectionWidget(
                      selectedTeeth: controller.postAndCoreTeeth)),
              SizedBox(height: 20.h),
              _InstructionCardWidget(
                // ✅ FIXED
                controller: controller.descriptionController,
                title: "Instructions",
                hintText: "Describe your Post & Core",
              ),
              _FileUploadWidget(
                selectedFiles: controller.selectedFiles,
                onTap: controller.pickFiles,
                // ✅ FIXED
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

  /// ========================================================================
  /// ✅ STANDARD BUILD METAL OPTIONS (Horizontal Radio Buttons)
  /// ========================================================================
  Widget _buildStandardBuildMetalOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ✅ Step 1: Horizontal Radio Buttons
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Metal Options",
              fontSize: 16.w,
              fontWeight: FontWeight.w500,
              bottom: 8.h,
            ),
            Obx(() => Row(
              children: [
                // Radio 1: Composite Inlay
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

                // Radio 2: Composite Onlay
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

        // ✅ Step 2: Show form if type is selected
        Obx(() {
          if (controller.standardBuildMetalType.value.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Select Teeth
                Align(
                  alignment: Alignment.centerLeft,
                  child: _TeethSelectionWidget(
                    selectedTeeth: controller.singleUnitTeeth,
                    title: "Select Teeth",
                  ),
                ),
                SizedBox(height: 20.h),

                // 2. Description
                _InstructionCardWidget(
                  controller: controller.descriptionController,
                  title: "Description",
                  hintText: "Describe your case",
                ),
                SizedBox(height: 15.h),

                // 3. Attachments
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
  // ✅ =================================
  // ✅ UPDATED METAL OPTIONS WIDGET
  // ✅ This now contains the full logic for Emax, Zirconia, and Composite Onlay
  // ✅ =================================
  Widget _buildMetalOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ✅ Step 1: Pontic Design Dropdown (Main Selection)
        CustomDropdown(
          label: "Pontic Design",
          hint: "Select design",
          items: ["Emax", "Zirconia", "Composite Onlay"],
          onChanged: (val) {
            controller.ponticDesign.value = val ?? '';
            // ✅ IMPORTANT: Reset sub-types when this changes
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
                // ✅ Notun Dropdown: Emax Type
                CustomDropdown(
                  label: "Select Emax Type",
                  hint: "Select Emax type",
                  items: ["Single unit crown", "Veneer"],
                  onChanged: (val) => controller.emaxType.value = val ?? '',
                ),
                SizedBox(height: 20.h),

                // ✅ Emax -> Single unit crown (Using existing fields)
                if (controller.emaxType.value == "Single unit crown")
                  Column(
                    children: [
                      ShadeSelectionDropdown(
                        selectedShades: controller.emaxTeeth, // existing
                        title: "Select Teeth & Shade",
                        hint: "Choose teeth for Emax",
                      ),
                      SizedBox(height: 15.h),
                      _InstructionCardWidget(
                        controller:
                        controller.emaxInstructionsController, // existing
                        title: "Description",
                        hintText: "Describe your Emax case",
                      ),
                      SizedBox(height: 15.h),
                      _FileUploadWidget(
                        selectedFiles: controller.emaxAttachments, // existing
                        onTap: controller.pickFiles,
                        onFileDeleted: (file) => controller.removeFile(
                            file, controller.emaxAttachments),
                        uploadTitle: "Upload Emax Attachments",
                        uploadHint: "Upload images or PDFs",
                      ),
                    ],
                  ),

                // ✅ Emax -> Veneer (Using new fields)
                if (controller.emaxType.value == "Veneer")
                  Column(
                    children: [
                      ShadeSelectionDropdown(
                        selectedShades: controller.emaxVeneerTeeth, // NEW
                        title: "Select Teeth & Shade",
                        hint: "Choose teeth for Veneer",
                      ),
                      SizedBox(height: 15.h),
                      _InstructionCardWidget(
                        controller:
                        controller.emaxVeneerInstructionsController, // NEW
                        title: "Instructions",
                        hintText: "Describe your Veneer case",
                      ),
                      SizedBox(height: 15.h),
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
                // ✅ Notun Dropdown: Zirconia Type
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

                // ✅ Zirconia -> Single unit crown (Using existing Zirconia fields)
                if (controller.zirconiaType.value == "Single unit crown")
                  Column(
                    children: [
                      ShadeSelectionDropdown(
                        selectedShades: controller.zirconiaTeeth, // existing
                        title: "Select Teeth & Shade",
                        hint: "Choose teeth for Zirconia",
                      ),
                      SizedBox(height: 15.h),
                      _InstructionCardWidget(
                        controller: controller
                            .zirconiaInstructionsController, // existing
                        title: "Instructions",
                        hintText: "Describe your Zirconia case",
                      ),
                      SizedBox(height: 15.h),
                      _FileUploadWidget(
                        selectedFiles:
                        controller.zirconiaAttachments, // existing
                        onTap: controller.pickFiles,
                        onFileDeleted: (file) => controller.removeFile(
                            file, controller.zirconiaAttachments),
                        uploadTitle: "Upload Zirconia Attachments",
                        uploadHint: "Upload images or PDFs",
                      ),
                    ],
                  ),

                // ✅ Zirconia -> Veneer (Using new fields)
                if (controller.zirconiaType.value == "Veneer")
                  Column(
                    children: [
                      ShadeSelectionDropdown(
                        selectedShades: controller.zirconiaVeneerTeeth, // NEW
                        title: "Select Teeth & Shade",
                        hint: "Choose teeth for Veneer",
                      ),
                      SizedBox(height: 15.h),
                      _InstructionCardWidget(
                        controller: controller
                            .zirconiaVeneerInstructionsController, // NEW
                        title: "Instructions",
                        hintText: "Describe your Veneer case",
                      ),
                      SizedBox(height: 15.h),
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

                // ✅ Zirconia -> Maryland bridge (Reusing existing PFM UI with NEW controllers)
                if (controller.zirconiaType.value == "Maryland bridge")
                  _buildReusableMarylandBridgeForm(), // NEW HELPER

                // ✅ Zirconia -> Conventional Bridge (Reusing existing PFM UI with NEW controllers)
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
                _InstructionCardWidget(
                  controller:
                  controller.compositeOnlayInstructionsController, // NEW
                  title: "Instructions",
                  hintText: "Describe your Composite Onlay case",
                ),
                SizedBox(height: 15.h),
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

  /// MARK: Dentures Section
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
        // ✅ ==========================================================
        // ✅ UPDATED: Logic for "Denture Other"
        // ✅ Ekhon Reline/Repair/Addition checkbox er sathe
        // ✅ Teeth, Shade, Description, Upload widget dekhabe.
        // ✅ ==========================================================
        if (controller.showDentureOther.value)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Multi-choice radio buttons
              buildDentureOtherCheckbox(
                title: "Denture Other",
                selectedValues: controller.dentureOtherSelections,
              ),
              SizedBox(height: 20.h),

              // 2. Select Teeth (using standard dentureTeeth list)
              Align(
                  alignment: Alignment.centerLeft,
                  child: _TeethSelectionWidget(
                      selectedTeeth: controller.dentureTeeth)),
              SizedBox(height: 15.h),

              // 3. Select Shade (using singleUnitTeeth as per pattern)
              ShadeSelectionDropdown(
                  selectedShades: controller.singleUnitTeeth),
              SizedBox(height: 15.h),

              // 4. Description (reusing one of the denture controllers)
              _InstructionCardWidget(
                controller: controller.descriptionController,
                title: "Description",
                hintText: "Describe your case (Reline, Repair, etc.)",
              ),
              SizedBox(height: 15.h),

              // 5. Upload Attachments (using standard dentureAttachments list)
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
        // Text(
        //   "Clasps(selected number)",
        //   style: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w600),
        // ),
        // SizedBox(height: 20.h),
        // Text(
        //   "Mesh Reinforcement",
        //   style: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w600),
        // ),
        // SizedBox(height: 20.h),
        // _TeethSelectionWidget(
        //   selectedTeeth: controller.singleUnitTeeth), // Reusing
        // SizedBox(height: 15.h),

        // ✅ ==========================================================
        // ✅ UPDATED: Replaced dropdown and forms with reusable widget
        // ✅ ==========================================================
        _buildDentureStageSelectionForms(),
      ],
    );
  }

  // ✅ ==========================================================
  // ✅ NEW WIDGET: _buildDentureStageSelectionForms (for Standard)
  // ✅ Contains the logic for selecting Try In, Re-try In, or Finish
  // ✅ ==========================================================
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
            descriptionTitle: "Description",
            descriptionHint: "Describe your Try In",
            // ✅ FIXED
            descController: controller.descriptionController,
            uploadTitle: "Upload Try In Attachments",
            fileList: controller.dentureAttachments,
            onUploadTap: controller.pickFiles,
            // ✅ FIXED
            onFileDeleted: (file) =>
                controller.removeFile(file, controller.dentureAttachments),
          ),
        if (controller.porcelainButtMargin.value == "Re-try In")
          _buildDentureStageWidget(
            teethList: controller.dentureTeeth,
            descriptionTitle: "Description",
            descriptionHint: "Describe your Re-Try In",
            // ✅ FIXED
            descController: controller.descriptionController,
            uploadTitle: "Upload Re-Try In Attachments",
            fileList: controller.dentureAttachments,
            onUploadTap: controller.pickFiles,
            // ✅ FIXED
            onFileDeleted: (file) =>
                controller.removeFile(file, controller.dentureAttachments),
          ),
        if (controller.porcelainButtMargin.value == "Finish")
          _buildDentureStageWidget(
            teethList: controller.dentureTeeth,
            descriptionTitle: "Description",
            descriptionHint: "Describe your Finish",
            // ✅ FIXED
            descController: controller.dentureFinishDescController,
            uploadTitle: "Upload Finish Attachments",
            fileList: controller.dentureAttachments,
            onUploadTap: controller.pickFiles,
            // ✅ FIXED
            onFileDeleted: (file) =>
                controller.removeFile(file, controller.dentureAttachments),
          ),
      ],
    );
  }

  Widget _buildDentureotherDetailsForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCheckboxRow(
          title: "Bite Block",
          upperValue: controller.biteBlockUpper,
          lowerValue: controller.biteBlockLower,
        ),
        // _buildCheckboxRow(
        //  title: "Special Tray",
        //  upperValue: controller.specialTrayUpper,
        //  lowerValue: controller.specialTrayLower,
        // ),
        // Text("Clasps(selected number)",style: TextStyle(fontSize: 16.h,fontWeight: FontWeight.w600),),
        // SizedBox(height: 20.h),
        // Text("Mesh Reinforcement",style: TextStyle(fontSize: 16.h,fontWeight: FontWeight.w600),),
        // SizedBox(height: 20.h),
        // _TeethSelectionWidget(
        //   selectedTeeth: controller.singleUnitTeeth), // Reusing
        // SizedBox(height: 15.h),
        //
        // CustomDropdown(
        //  label: "Porcelain Butt Margin",
        //  hint: "Select detail",
        //  items: ["Try In", "Re-try In", "Finish"],
        //  onChanged: (val) => controller.porcelainButtMargin.value = val ?? '',
        // ),
        SizedBox(height: 20.h),
        if (controller.porcelainButtMargin.value == "Try In")
          _buildDentureStageWidget(
            teethList: controller.dentureTeeth,
            descriptionTitle: "Description",
            descriptionHint: "Describe your Try In",
            // ✅ FIXED
            descController: controller.dentureTryInDescController,
            uploadTitle: "Upload Try In Attachments",
            fileList: controller.dentureAttachments,
            onUploadTap: controller.pickFiles,
            // ✅ FIXED
            onFileDeleted: (file) =>
                controller.removeFile(file, controller.dentureAttachments),
          ),
        if (controller.porcelainButtMargin.value == "Re-try In")
          _buildDentureStageWidget(
            teethList: controller.dentureTeeth,
            descriptionTitle: "Description",
            descriptionHint: "Describe your Re-Try In",
            // ✅ FIXED
            descController: controller.dentureReTryInDescController,
            uploadTitle: "Upload Re-Try In Attachments",
            fileList: controller.dentureAttachments,
            onUploadTap: controller.pickFiles,
            // ✅ FIXED
            onFileDeleted: (file) =>
                controller.removeFile(file, controller.dentureAttachments),
          ),
        if (controller.porcelainButtMargin.value == "Finish")
          _buildDentureStageWidget(
            teethList: controller.dentureTeeth,
            descriptionTitle: "Description",
            descriptionHint: "Describe your Finish",
            // ✅ FIXED
            descController: controller.dentureFinishDescController,
            uploadTitle: "Upload Finish Attachments",
            fileList: controller.dentureAttachments,
            onUploadTap: controller.pickFiles,
            // ✅ FIXED
            onFileDeleted: (file) =>
                controller.removeFile(file, controller.dentureAttachments),
          ),
      ],
    );
  }

  Widget _buildDentureStageWidget({
    required RxList<String> teethList,
    required String descriptionTitle,
    required String descriptionHint,
    required TextEditingController descController, // ✅ FIXED
    required String uploadTitle,
    required RxList<File> fileList,
    required VoidCallback onUploadTap,
    required Function(File) onFileDeleted, // ✅ FIXED
  }) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: _TeethSelectionWidget(selectedTeeth: teethList)),
        SizedBox(height: 15.h),
        SingleShadeSelector(selectedShade: controller.shadeController),
        _InstructionCardWidget(
          controller: descController, // ✅ FIXED
          title: descriptionTitle,
          hintText: descriptionHint,
        ),
        SizedBox(height: 15.h),
        _FileUploadWidget(
          selectedFiles: fileList,
          onTap: onUploadTap,
          onFileDeleted: onFileDeleted, // ✅ FIXED
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

        // ✅ ==========================================================
        // ✅ NEW: Added ORTHODONTIC flow
        // ✅ ==========================================================
        if (controller.premiumType.value == "ORTHODONTIC")
          _buildPremiumOrthodontic(),

        // ✅ ==========================================================
        // ✅ NEW: Added MISC flow
        // ✅ ==========================================================
        if (controller.premiumType.value == "MISC") _buildPremiumMisc(),

        // TODO: Add IMPLANTS form
      ],
    );
  }

  // ✅ ==========================================================
  // ✅ NEW WIDGET: _buildPremiumOrthodontic
  // ✅ ==========================================================
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

  // ✅ ==========================================================
  // ✅ NEW WIDGET: _buildPremiumMisc (Updated)
  // ✅ ==========================================================
  Widget _buildPremiumMisc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdown(
          label: "Misc Type",
          hint: "Select option",
          items: [
            // ✅ UPDATED LIST
            "Study Module",
            "Sports Guard",
            "TW",
            "Night Guard",
            "Vacuum Formed Stent", // ✅ NEW
            "Re-etch"
          ],
          onChanged: (val) {
            controller.premiumMiscType.value = val ?? '';
            // ✅ Reset all single-choice values when dropdown changes
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
                  // ✅ CHANGED to Radio
                  title: "Study Module Options",
                  options: ["Diagnostic Wax", "Select Teeth"],
                  groupValue: controller.miscStudyModuleSelection,
                ),
                // ✅ Conditionally show TeethSelectionWidget
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
                // ✅ No radio buttons per user request "sports guard => color"
                _InstructionCardWidget(
                  controller: controller.miscSportsGuardController,
                  title: "Color", // ✅ Changed title
                  hintText: "Specify desired color(s)", // ✅ Changed hint
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
                  // ✅ CHANGED to Radio
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
                  // ✅ CHANGED to Radio
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
                // ✅ No radio buttons for this one
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
                  // ✅ CHANGED to Radio
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

  // ✅ ==========================================================
  // ✅ NEW WIDGET: _buildPremiumDentures
  // ✅ This is the new entry point for the Premium Denture flow
  // ✅ ==========================================================
  Widget _buildPremiumDentures() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdown(
          label: "Denture Type",
          hint: "Select option",
          items: ["Denture Construction", "Denture Other"],
          // ✅ Uses the controller function you provided
          onChanged: (val) => controller.onPremiumDentureTypeChange(val),
        ),
        SizedBox(height: 20.h),
        // ✅ Conditionally shows the construction form or "other" checkboxes
        if (controller.showDentureConstruction.value)
          _buildPremiumDentureConstructionForm(), // ✅ New form

        // ✅ ==========================================================
        // ✅ UPDATED: Logic for "Denture Other" (Premium)
        // ✅ Ekhon Reline/Repair/Addition checkbox er sathe
        // ✅ Teeth, Shade, Description, Upload widget dekhabe.
        // ✅ ==========================================================
        if (controller.showDentureOther.value)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Multi-choice radio buttons
              buildDentureOtherCheckbox(
                title: "Denture Other",
                selectedValues: controller.dentureOtherSelections,
              ),
              SizedBox(height: 20.h),

              // 2. Select Teeth (using premium dentureTeeth list)
              Align(
                  alignment: Alignment.centerLeft,
                  child: _TeethSelectionWidget(
                      selectedTeeth: controller.premiumDentureTryInMetalTeeth)),
              SizedBox(height: 15.h),

              // 3. Select Shade (using singleUnitTeeth as per pattern)
              ShadeSelectionDropdown(
                  selectedShades: controller.singleUnitTeeth),
              SizedBox(height: 15.h),

              // 4. Description (reusing one of the premium denture controllers)
              _InstructionCardWidget(
                controller: controller.premiumDentureTryInMetalController,
                title: "Description",
                hintText: "Describe your case (Reline, Repair, etc.)",
              ),
              SizedBox(height: 15.h),

              // 5. Upload Attachments (using premium dentureAttachments list)
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

  // ✅ ==========================================================
  // ✅ NEW WIDGET: _buildPremiumDentureConstructionForm
  // ✅ Contains the full logic for Bite Block, Tray, and Stages
  // ✅ ==========================================================
  Widget _buildPremiumDentureConstructionForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- 1. Reusing existing checkbox widgets ---
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

        // ✅ ==========================================================
        // ✅ UPDATED: Replaced dropdown and forms with reusable widget
        // ✅ ==========================================================
        _buildPremiumDentureStageSelectionForms(),
      ],
    );
  }

  // ✅ ==========================================================
  // ✅ NEW WIDGET: _buildPremiumDentureStageSelectionForms (for Premium)
  // ✅ Contains the logic for selecting premium stages
  // ✅ ==========================================================
  Widget _buildPremiumDentureStageSelectionForms() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- 2. New Dropdown for Construction Type ---
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
              descriptionTitle: "Description",
              descriptionHint: "Describe your Try In",
              descController: controller.premiumDentureTryInMetalController,
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
              descriptionTitle: "Description",
              descriptionHint: "Describe your Re-Try In",
              descController: controller.premiumDentureReTryInController,
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
              descriptionTitle: "Description",
              descriptionHint: "Describe your Finish Acrylic case",
              descController: controller.premiumDentureFinishAcrylicController,
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
              descriptionTitle: "Description",
              descriptionHint: "Describe your Finish Flexi case",
              descController: controller.premiumDentureFinishFlexiController,
              uploadTitle: "Upload Finish Flexi Attachments",
              fileList: controller.premiumDentureFinishFlexiAttachments,
              onUploadTap: controller.pickFiles,
              onFileDeleted: (file) => controller.removeFile(
                  file, controller.premiumDentureFinishFlexiAttachments),
            );
          }

          // Return empty box if no stage is selected
          return const SizedBox.shrink();
        }),
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
          // ✅ FIXED: Calling premium-specific function
          onChanged: (val) => controller.onPremiumCrownTypeChange(val),
        ),
        SizedBox(height: 20.h),
        // ✅ Reusing standard PFM/FullCast/Metal widgets
        if (controller.crownType.value == "PFM (NP)") _buildPfmNpOptions(),
        if (controller.crownType.value == "FULL CAST") _buildFullCastOptions(),
        // ✅ This will now render the new, complex metal options
        if (controller.crownType.value == "METAL") _buildMetalOptions(),
      ],
    );
  }

  Widget _buildPremiumPfmNpOptions() {
    // NOTE: This function was in your original code.
    // It appears redundant because _buildPremiumCrownBridge now calls _buildPfmNpOptions directly.
    // However, I am keeping it to ensure the file is identical to your original structure.
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
          onChanged: (val) => controller.onPremiumPFMOptionChange(val),
        ),
        SizedBox(height: 20.h),
        if (controller.showSingleUnitDropdown.value)
          Column(
            children: [
              CustomDropdown(
                label: "Porcelain Butt Margin",
                hint: "Select detail",
                items: ["360", "Buccal Only"],
                onChanged: (val) {},
              ),
              _TeethSelectionWidget(
                // ✅ FIXED: Using common list
                selectedTeeth: controller.singleUnitTeeth,
              ),
              _InstructionCardWidget(
                // ✅ FIXED
                controller: controller.pfmSingleUnitInstructionsController,
                title: "Special Instructions",
                hintText: "Describe Your Instructions",
              ),
              _FileUploadWidget(
                selectedFiles: controller.selectedFiles,
                onTap: controller.pickFiles,
                // ✅ FIXED
                onFileDeleted: (file) =>
                    controller.removeFile(file, controller.selectedFiles),
                uploadTitle: "Upload Cover Image",
                uploadHint: "Upload a video and photo",
              ),
            ],
          ),
        // ... Other premium PFM options (Maryland, Conventional) ...
      ],
    );
  }

  // ✅ =================================
  // ✅ NOTUN HELPER WIDGETS (ZIRCONIA)
  // ✅ =================================
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
            // Using ShadeSelectionDropdown as per your PFM Maryland Bridge code
            child: ShadeSelectionDropdown(
                selectedShades: controller.zirconiaMarylandBridgeTeeth) // NEW
        ),
        SizedBox(height: 20.h),
        _InstructionCardWidget(
          controller:
          controller.zirconiaMarylandBridgeInstructionsController, // NEW
          title: "Special Instructions",
          hintText: "Describe Your Instructions",
        ),
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
          // ✅ Using ShadeSelectionDropdown to match your new pattern
          child: ShadeSelectionDropdown(
              selectedShades:
              controller.zirconiaConventionalBridgeTeeth), // NEW
        ),
        SizedBox(height: 20.h),
        _InstructionCardWidget(
          // ✅ The original PFM form had this commented out, but it's needed
          controller:
          controller.zirconiaConventionalBridgeDescController, // NEW
          title: "Description",
          hintText: "Describe your case",
        ),
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
              // ✅ onChanged: (val) {}
              // We set onChanged to an empty function or null
              // because the logic is now handled inside the InkWell
              // of the DropdownMenuItem's child.
              // This prevents the dropdown from closing on selection.
              onChanged: (value) {
                // This callback is still triggered, but we don't need to
                // close the dropdown. The state is already updated.
              },
              // ✅ This is a workaround to keep the dropdown open
              // We return null to prevent it from "selecting" a value
              // which would close the menu.
              // Note: A better approach might be a custom dropdown,
              // but this works for the default DropdownButton.
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