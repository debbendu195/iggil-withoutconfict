import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
// TODO: Apnar real project-er path import korun
import '../../../../../../../../service/api_client.dart';
import '../../../../../../../../service/api_url.dart';

class AddCaseController extends GetxController {
  /// ========= Text Controllers =========
  final patientIdController = TextEditingController();
  final ageController = TextEditingController();
  final scanNumberController = TextEditingController();

  // ✅ TOP-LEVEL DESCRIPTION CONTROLLER
  final descriptionController = TextEditingController();

  // (Nested) Instruction Controllers

  final pfmSingleUnitInstructionsController = TextEditingController();
  final pfmMarylandInstructionsController = TextEditingController();
  final pfmConventionalBridgeDescController = TextEditingController();
  final fcSingleUnitInstructionsController = TextEditingController();
  final fcBridgeDescController = TextEditingController();
  final fcPostAndCoreInstructionsController = TextEditingController();
  final metalBridgeDescController = TextEditingController();
  final dentureTryInDescController = TextEditingController();
  final dentureReTryInDescController = TextEditingController();
  final dentureFinishDescController = TextEditingController();

  /// ========= Standard Build Metal Variables =========
  var standardBuildMetalType = ''.obs; // "Composite Inlay" or "Composite Onlay"

  // ✅ =================================
  // ✅ NOTUN VARIABLES (Premium Denture)
  // ✅ =================================
  var premiumDentureConstructionType =
      ''.obs; // "Try In with metal...", "Re-try In", etc.

  // --- New fields for Premium Denture Stages ---
  final premiumDentureTryInMetalController = TextEditingController();
  var premiumDentureTryInMetalTeeth = <String>[].obs;
  var premiumDentureTryInMetalAttachments = <File>[].obs;

  final premiumDentureReTryInController = TextEditingController();
  var premiumDentureReTryInTeeth = <String>[].obs;
  var premiumDentureReTryInAttachments = <File>[].obs;

  final premiumDentureFinishAcrylicController = TextEditingController();
  var premiumDentureFinishAcrylicTeeth = <String>[].obs;
  var premiumDentureFinishAcrylicAttachments = <File>[].obs;

  final premiumDentureFinishFlexiController = TextEditingController();
  var premiumDentureFinishFlexiTeeth = <String>[].obs;
  var premiumDentureFinishFlexiAttachments = <File>[].obs;

  // ✅ =================================
  // ✅ NEW VARIABLES (Premium Orthodontic)
  // ✅ =================================
  var premiumOrthodonticType = ''.obs; // "Fixed Retainer", "Essix Retainer"
  final orthoFixedRetainerController = TextEditingController();
  var orthoFixedRetainerAttachments = <File>[].obs;
  final orthoEssixRetainerController = TextEditingController();
  var orthoEssixRetainerAttachments = <File>[].obs;

  // ✅ =================================
  // ✅ NEW VARIABLES (Premium Misc) - Updated for Radio Buttons
  // ✅ =================================
  var premiumMiscType = ''.obs; // "Study Module", "Sports Guard", etc.

  // Misc - Study Module
  var miscStudyModuleSelection = ''.obs; // ✅ CHANGED: Radio button selection
  var miscStudyModuleTeeth = <String>[].obs; // ✅ NEW: For "Select Teeth"
  final miscStudyModuleController = TextEditingController();
  var miscStudyModuleAttachments = <File>[].obs;

  // Misc - Sports Guard
  // No selection variable needed, only description for "Color"
  final miscSportsGuardController = TextEditingController();
  var miscSportsGuardAttachments = <File>[].obs;

  // Misc - TW
  var miscTwSelection = ''.obs; // ✅ CHANGED: Radio button selection
  final miscTwController = TextEditingController();
  var miscTwAttachments = <File>[].obs;

  // Misc - Night Guard
  var miscNightGuardSelection = ''.obs; // ✅ CHANGED: Radio button selection
  final miscNightGuardController = TextEditingController();
  var miscNightGuardAttachments = <File>[].obs;

  // Misc - Vacuum Formed Stent (NEW)
  final miscVacuumStentController = TextEditingController();
  var miscVacuumStentAttachments = <File>[].obs;

  // Misc - Re-etch
  var miscReEtchSelection = ''.obs; // ✅ CHANGED: Radio button selection
  final miscReEtchController = TextEditingController();
  var miscReEtchAttachments = <File>[].obs;

  /// ========= Metal/Pontic Design Variables =========
  var ponticDesign = ''.obs; // "Emax", "Zirconia", or "Composite Onlay"
  var marylandponticTeeth = ''.obs;
  var marylandwingTeeth = ''.obs;

  // Emax (Original - now used for Single Unit)
  var emaxTeeth = <String>[].obs;
  final emaxInstructionsController = TextEditingController();
  var emaxAttachments = <File>[].obs;

  // Zirconia (Original - now used for Single Unit)
  var zirconiaTeeth = <String>[].obs;
  final zirconiaInstructionsController = TextEditingController();
  var zirconiaAttachments = <File>[].obs;

  // Composite Onlay (Original)
  var compositeOnlayTeeth = <String>[].obs;
  final compositeOnlayInstructionsController = TextEditingController();
  var compositeOnlayAttachments = <File>[].obs;

  // ✅ =================================
  // ✅ NOTUN VARIABLES (Metal)
  // ✅ =================================

  // ========= Shade Variables (Single Selection) =========
  var shadeController = ''.obs;

  // --- New Sub-Type Trackers ---
  var emaxType = ''.obs; // Stores "Single unit crown" or "Veneer"
  var zirconiaType = ''.obs; // Stores "Single unit crown", "Veneer", etc.

  // --- New fields for Emax -> Veneer ---
  var emaxVeneerTeeth = <String>[].obs;
  final emaxVeneerInstructionsController = TextEditingController();
  var emaxVeneerAttachments = <File>[].obs;

  // --- New fields for Zirconia -> Veneer ---
  var zirconiaVeneerTeeth = <String>[].obs;
  final zirconiaVeneerInstructionsController = TextEditingController();
  var zirconiaVeneerAttachments = <File>[].obs;

  // --- New fields for Zirconia -> Maryland bridge ---
  var zirconiaMarylandBridgeTeeth = <String>[].obs;
  final zirconiaMarylandBridgeInstructionsController = TextEditingController();
  var zirconiaMarylandBridgeAttachments = <File>[].obs;

  // --- New fields for Zirconia -> Conventional Bridge ---
  var zirconiaConventionalBridgeTeeth = <String>[].obs;
  final zirconiaConventionalBridgeDescController = TextEditingController();
  var zirconiaConventionalBridgeAttachments = <File>[].obs;

  /// ========= Observables (Dropdowns) =========
  var caseType = ''.obs;
  var caseTypeSend = ''.obs;
  var gender = ''.obs;
  var tier = ''.obs;

  /// ========= Standard / Reusable Observables =========
  var standardType = ''.obs;
  var crownType = ''.obs;
  var pfmOption = ''.obs;
  var fullCastOption = ''.obs;
  var dentureType = ''.obs;
  // ✅ NEW VARIABLE for Porcelain Butt Margin
  var pfmSingleUnitPorcelainButtMargin = ''.obs;
  var porcelainButtMargin = ''.obs; // Denture stage selection

  /// ========= Premium Observables =========
  var premiumType = ''.obs;
  // ========= Metal/Pontic Design Variables (already declared above) =========

  /// ========= Visibility Flags =========
  var showSingleUnitDropdown = false.obs;
  var showMarylandBridgeDropdown = false.obs;
  var showConventionalBridgeDropdown = false.obs;
  var showFullCastSingleUnit = false.obs;
  var showFullCastBridge = false.obs;
  var showPostAndCore = false.obs;
  var showMetalBridge =
      false.obs; // This flag seems to be for the *old* metal bridge
  var showDentureConstruction = false.obs;
  var showDentureOther = false.obs;

  /// ========= Denture Checkboxes (OLD - Keep for backward compatibility) =========
  var biteBlockUpper = false.obs;
  var biteBlockLower = false.obs;
  var specialTrayUpper = false.obs;
  var specialTrayLower = false.obs;
  var meshReinforcement = false.obs;

  /// ✅ ========= NEW: Denture Other Radio Button Selections =========
  var dentureOtherSelections =
      <String>[].obs; // "Reline", "Repair", or "Addition"

  /// ========= Common Teeth & Attachments =========
  var singleUnitTeeth = <String>[].obs;
  var marylandPonticTeeth = <String>[].obs;
  var marylandWingTeeth = <String>[].obs;
  var conventionalBridgeTeeth = <String>[].obs;
  var fullCastSingleUnitTeeth = <String>[].obs;
  var postAndCoreTeeth = <String>[].obs;
  var bridgeTeeth = <String>[].obs;
  var metalBridgeTeeth =
      <String>[].obs; // This seems to be for the *old* metal bridge
  var dentureTeeth = <String>[].obs;

  /// ========= File Attachments =========
  var selectedFiles = <File>[].obs; // Fallback for PFM, FullCast
  var dentureAttachments = <File>[].obs;

  var isLoading = false.obs;

  /// ========= Helper: Reset All Product Data =========
  void _clearAllProductData() {
    // Dropdowns
    standardType.value = '';
    crownType.value = '';
    pfmOption.value = '';
    fullCastOption.value = '';
    dentureType.value = '';
    premiumType.value = '';
    porcelainButtMargin.value = '';
    ponticDesign.value = '';

    // ✅ Clear Premium Denture
    premiumDentureConstructionType.value = '';
    premiumDentureTryInMetalTeeth.clear();
    premiumDentureTryInMetalController.clear();
    premiumDentureTryInMetalAttachments.clear();
    premiumDentureReTryInTeeth.clear();
    premiumDentureReTryInController.clear();
    premiumDentureReTryInAttachments.clear();
    premiumDentureFinishAcrylicTeeth.clear();
    premiumDentureFinishAcrylicController.clear();
    premiumDentureFinishAcrylicAttachments.clear();
    premiumDentureFinishFlexiTeeth.clear();
    premiumDentureFinishFlexiController.clear();
    premiumDentureFinishFlexiAttachments.clear();

    // ✅ Clear Premium Orthodontic
    premiumOrthodonticType.value = '';
    orthoFixedRetainerController.clear();
    orthoFixedRetainerAttachments.clear();
    orthoEssixRetainerController.clear();
    orthoEssixRetainerAttachments.clear();

    // ✅ Clear Premium Misc (Updated)
    premiumMiscType.value = '';
    miscStudyModuleSelection.value = '';
    miscStudyModuleTeeth.clear();
    miscStudyModuleController.clear();
    miscStudyModuleAttachments.clear();
    miscSportsGuardController.clear();
    miscSportsGuardAttachments.clear();
    miscTwSelection.value = '';
    miscTwController.clear();
    miscTwAttachments.clear();
    miscNightGuardSelection.value = '';
    miscNightGuardController.clear();
    miscNightGuardAttachments.clear();
    miscVacuumStentController.clear();
    miscVacuumStentAttachments.clear();
    miscReEtchSelection.value = '';
    miscReEtchController.clear();
    miscReEtchAttachments.clear();

    // ✅ Clear Emax
    emaxType.value = '';
    emaxTeeth.clear();
    emaxInstructionsController.clear();
    emaxAttachments.clear();
    emaxVeneerTeeth.clear();
    emaxVeneerInstructionsController.clear();
    emaxVeneerAttachments.clear();

    // ✅ Clear Zirconia
    zirconiaType.value = '';
    zirconiaTeeth.clear();
    zirconiaInstructionsController.clear();
    zirconiaAttachments.clear();
    zirconiaVeneerTeeth.clear();
    zirconiaVeneerInstructionsController.clear();
    zirconiaVeneerAttachments.clear();
    zirconiaMarylandBridgeTeeth.clear();
    zirconiaMarylandBridgeInstructionsController.clear();
    zirconiaMarylandBridgeAttachments.clear();
    zirconiaConventionalBridgeTeeth.clear();
    zirconiaConventionalBridgeDescController.clear();
    zirconiaConventionalBridgeAttachments.clear();

    // ✅ Clear Composite
    compositeOnlayTeeth.clear();
    compositeOnlayInstructionsController.clear();
    compositeOnlayAttachments.clear();

    // ✅ Clear Denture Other Radio Selection
    dentureOtherSelections.clear();

    // Visibility
    showSingleUnitDropdown.value = false;
    showMarylandBridgeDropdown.value = false;
    showConventionalBridgeDropdown.value = false;
    showFullCastSingleUnit.value = false;
    showFullCastBridge.value = false;
    showPostAndCore.value = false;
    showMetalBridge.value = false;
    showDentureConstruction.value = false;
    showDentureOther.value = false;

    // Teeth Lists
    singleUnitTeeth.clear();
    marylandPonticTeeth.clear();
    marylandWingTeeth.clear();
    conventionalBridgeTeeth.clear();
    fullCastSingleUnitTeeth.clear();
    bridgeTeeth.clear();
    postAndCoreTeeth.clear();
    metalBridgeTeeth.clear();
    dentureTeeth.clear();

    // File Lists
    selectedFiles.clear();
    dentureAttachments.clear();

    // Instruction Controllers
    pfmSingleUnitInstructionsController.clear();
    pfmMarylandInstructionsController.clear();
    pfmConventionalBridgeDescController.clear();
    fcSingleUnitInstructionsController.clear();
    fcBridgeDescController.clear();
    fcPostAndCoreInstructionsController.clear();
    metalBridgeDescController.clear();
    dentureTryInDescController.clear();
    dentureReTryInDescController.clear();
    dentureFinishDescController.clear();
  }

  /// ========= Helper: Reset Crown/Bridge Data =========
  void _clearCrownBridgeData() {
    pfmOption.value = '';
    fullCastOption.value = '';
    showSingleUnitDropdown.value = false;
    showMarylandBridgeDropdown.value = false;
    showConventionalBridgeDropdown.value = false;
    showFullCastSingleUnit.value = false;
    showFullCastBridge.value = false;
    showPostAndCore.value = false;
    showMetalBridge.value = false;
    shadeController.value = '';

    // ✅ Clear Metal/Pontic data as well
    ponticDesign.value = '';
    emaxType.value = '';
    zirconiaType.value = '';
    emaxTeeth.clear();
    emaxInstructionsController.clear();
    emaxAttachments.clear();
    emaxVeneerTeeth.clear();
    emaxVeneerInstructionsController.clear();
    emaxVeneerAttachments.clear();
    zirconiaTeeth.clear();
    zirconiaInstructionsController.clear();
    zirconiaAttachments.clear();
    zirconiaVeneerTeeth.clear();
    zirconiaVeneerInstructionsController.clear();
    zirconiaVeneerAttachments.clear();
    zirconiaMarylandBridgeTeeth.clear();
    zirconiaMarylandBridgeInstructionsController.clear();
    zirconiaMarylandBridgeAttachments.clear();
    zirconiaConventionalBridgeTeeth.clear();
    zirconiaConventionalBridgeDescController.clear();
    zirconiaConventionalBridgeAttachments.clear();
    compositeOnlayTeeth.clear();
    compositeOnlayInstructionsController.clear();
    compositeOnlayAttachments.clear();

    singleUnitTeeth.clear();
    marylandPonticTeeth.clear();
    marylandWingTeeth.clear();
    conventionalBridgeTeeth.clear();
    fullCastSingleUnitTeeth.clear();
    bridgeTeeth.clear();
    postAndCoreTeeth.clear();
    metalBridgeTeeth.clear();
    selectedFiles.clear();

    pfmSingleUnitInstructionsController.clear();
    pfmMarylandInstructionsController.clear();
    pfmConventionalBridgeDescController.clear();
    fcSingleUnitInstructionsController.clear();
    fcBridgeDescController.clear();
    fcPostAndCoreInstructionsController.clear();
    metalBridgeDescController.clear();
  }

  /// ========= Dropdown Logic =========
  void onTierChange(String? val) {
    tier.value = val ?? '';
    _clearAllProductData();
  }

  void onStandardTypeChange(String val) {
    standardType.value = val;
    crownType.value = '';
    dentureType.value = '';
    _clearCrownBridgeData();
  }

  void onCrownTypeChange(String? val) {
    crownType.value = val ?? '';
    _clearCrownBridgeData();
    // This flag seems obsolete with the new Metal options,
    // but we keep it for backward compatibility if it's used elsewhere.
    showMetalBridge.value = crownType.value == "METAL";
  }

  void onPFMOptionChange(String? val) {
    pfmOption.value = val ?? '';
    showSingleUnitDropdown.value = pfmOption.value == "Single unit crown";
    showMarylandBridgeDropdown.value = pfmOption.value == "Maryland bridge";
    showConventionalBridgeDropdown.value =
        pfmOption.value == "Conventional Bridge";
  }

  void onFullCastChange(String? val) {
    fullCastOption.value = val ?? '';
    showFullCastSingleUnit.value = val == "Single unit crown";
    showFullCastBridge.value = val == "Bridge";
    showPostAndCore.value = val == "Post & Core";
  }

  void onDentureTypeChange(String? val) {
    dentureType.value = val ?? '';
    showDentureConstruction.value = val == "Denture Construction";
    showDentureOther.value = val == "Denture Other";

    // ✅ Clear radio selection when switching denture types
    if (val != "Denture Other") {
      dentureOtherSelections.clear();
    }
  }

  /// ========= Premium Logic =========
  void onPremiumTypeChange(String? val) {
    premiumType.value = val ?? '';
    crownType.value = '';
    dentureType.value = '';
    // ✅ Reset premium denture stage on type change
    premiumDentureConstructionType.value = '';

    // ✅ Reset Ortho and Misc types
    premiumOrthodonticType.value = '';
    premiumMiscType.value = '';

    _clearCrownBridgeData();
  }

  void onPremiumCrownTypeChange(String? val) => onCrownTypeChange(val);
  void onPremiumPFMOptionChange(String? val) => onPFMOptionChange(val);
  void onPremiumFullCastOptionChange(String? val) => onFullCastChange(val);
  // ✅ Updated Premium Denture Logic
  void onPremiumDentureTypeChange(String? val) {
    dentureType.value = val ?? '';
    showDentureConstruction.value = val == "Denture Construction";
    showDentureOther.value = val == "Denture Other";

    // ✅ Clear radio selection when switching denture types
    if (val != "Denture Other") {
      dentureOtherSelections.clear();
    }
    // ✅ Clear stage selection when switching
    premiumDentureConstructionType.value = '';
  }

  /// ========= File Upload Logic (Updated) =========
  /// ✅ This function now adds files to the correct list based on UI state
  Future<void> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null) {
      List<File> newFiles = result.paths.map((p) => File(p!)).toList();

      // Determine target list
      // 1. Dentures (Standard)
      if (tier.value == "Standard" &&
          (showDentureConstruction.value || showDentureOther.value)) {
        dentureAttachments.addAll(newFiles);
        return;
      }

      // ✅ 2. Dentures (Premium)
      if (tier.value == "Premium" && premiumType.value == "DENTURES") {
        if (showDentureOther.value) {
          // Special case for "Denture Other"
          premiumDentureTryInMetalAttachments.addAll(newFiles);
          return;
        }
        final stage = premiumDentureConstructionType.value;
        if (stage == "Try In with metal framework CoCr") {
          premiumDentureTryInMetalAttachments.addAll(newFiles);
          return;
        }
        if (stage == "Re-try In") {
          premiumDentureReTryInAttachments.addAll(newFiles);
          return;
        }
        if (stage == "Finish Acrylic") {
          premiumDentureFinishAcrylicAttachments.addAll(newFiles);
          return;
        }
        if (stage == "Finish Flexi") {
          premiumDentureFinishFlexiAttachments.addAll(newFiles);
          return;
        }
      }

      // ✅ 3. Orthodontic (Premium)
      if (tier.value == "Premium" && premiumType.value == "ORTHODONTIC") {
        if (premiumOrthodonticType.value == "Fixed Retainer") {
          orthoFixedRetainerAttachments.addAll(newFiles);
          return;
        }
        if (premiumOrthodonticType.value == "Essix Retainer") {
          orthoEssixRetainerAttachments.addAll(newFiles);
          return;
        }
      }

      // ✅ 4. Misc (Premium)
      if (tier.value == "Premium" && premiumType.value == "MISC") {
        if (premiumMiscType.value == "Study Module") {
          miscStudyModuleAttachments.addAll(newFiles);
          return;
        }
        if (premiumMiscType.value == "Sports Guard") {
          miscSportsGuardAttachments.addAll(newFiles);
          return;
        }
        if (premiumMiscType.value == "TW") {
          miscTwAttachments.addAll(newFiles);
          return;
        }
        if (premiumMiscType.value == "Night Guard") {
          miscNightGuardAttachments.addAll(newFiles);
          return;
        }
        if (premiumMiscType.value == "Vacuum Formed Stent") {
          // ✅ NEW
          miscVacuumStentAttachments.addAll(newFiles);
          return;
        }
        if (premiumMiscType.value == "Re-etch") {
          miscReEtchAttachments.addAll(newFiles);
          return;
        }
      }

      // ✅ 5. Metal Options (Premium or Standard)
      if (crownType.value == "METAL") {
        if (ponticDesign.value == "Emax") {
          if (emaxType.value == "Single unit crown") {
            emaxAttachments.addAll(newFiles);
            return;
          }
          if (emaxType.value == "Veneer") {
            emaxVeneerAttachments.addAll(newFiles);
            return;
          }
        }
        if (ponticDesign.value == "Zirconia") {
          if (zirconiaType.value == "Single unit crown") {
            zirconiaAttachments.addAll(newFiles);
            return;
          }
          if (zirconiaType.value == "Veneer") {
            zirconiaVeneerAttachments.addAll(newFiles);
            return;
          }
          if (zirconiaType.value == "Maryland bridge") {
            zirconiaMarylandBridgeAttachments.addAll(newFiles);
            return;
          }
          if (zirconiaType.value == "Conventional Bridge") {
            zirconiaConventionalBridgeAttachments.addAll(newFiles);
            return;
          }
        }
        if (ponticDesign.value == "Composite Onlay") {
          compositeOnlayAttachments.addAll(newFiles);
          return;
        }
      }

      // ✅ 6. PFM / Full Cast / Other Standard options
      // This is the default/fallback list for PFM, Full Cast, etc.
      selectedFiles.addAll(newFiles);
    }
  }

  void removeFile(File fileToRemove, RxList<File> targetAttachmentList) {
    targetAttachmentList.remove(fileToRemove);
  }

  /// ========= Snackbar =========
  void showMessage(String message, {bool isError = false}) {
    if (isError) {
      // ToastMessage.showErrorToast(Get.context!, message);
      Get.snackbar("Error", message,
          backgroundColor: Colors.red, colorText: Colors.white);
    } else {
      // ToastMessage.showSuccessToast(Get.context!, message);
      Get.snackbar("Success", message,
          backgroundColor: Colors.green, colorText: Colors.white);
    }
  }

  // =================================================================
  // ========= SUBMIT CASE (Updated) =========
  // =================================================================

  Future<void> submitCase() async {
    if (patientIdController.text.isEmpty) {
      showMessage("Please enter Patient ID", isError: true);
      return;
    }
    if (ageController.text.isEmpty) {
      showMessage("Please enter Age", isError: true);
      return;
    }

    isLoading.value = true;

    try {
      // 1. Build the main body

/*
      debugPrint("=== EMAX DEBUG ===");
      debugPrint("ponticDesign: ${ponticDesign.value}");
      debugPrint("emaxType: ${emaxType.value}");
      debugPrint("emaxTeeth: ${emaxTeeth.toList()}");
      debugPrint("shadeController: ${shadeController.value}");
      debugPrint("emaxAttachments: ${emaxAttachments.length}");
      debugPrint("==================");
*/


      Map<String, dynamic> body = {
        "caseType": caseType.value,
        "gender": gender.value,
        "age": int.tryParse(ageController.text.trim()) ?? 0,
        "patientID": patientIdController.text.trim(),
        "selectedTier": tier.value,
        "standard": tier.value == "Standard" ? _buildStandardData() : null,
        "premium": tier.value == "Premium" ? _buildPremiumData() : null,
        "description": descriptionController.text.trim(),
      };

      if (scanNumberController.text.trim().isNotEmpty) {
        body["scan_number"] = scanNumberController.text.trim();
      }

      debugPrint(
          "Request body ==================================: ${jsonEncode(body)}");

      // 2. Prepare API call
      dynamic response;
      Map<String, String> stringBody = body.map(
            (key, value) =>
            MapEntry(key, value is String ? value : jsonEncode(value)),
      );

      // ✅ GATHER ALL FILES from all lists
      List<File> allFiles = [];
      allFiles.addAll(selectedFiles); // PFM, FullCast
      allFiles.addAll(dentureAttachments); // Standard Dentures

      // Metal
      allFiles.addAll(emaxAttachments); // Emax Single
      allFiles.addAll(emaxVeneerAttachments); // Emax Veneer
      allFiles.addAll(zirconiaAttachments); // Zirconia Single
      allFiles.addAll(zirconiaVeneerAttachments); // Zirconia Veneer
      allFiles.addAll(zirconiaMarylandBridgeAttachments); // Zirc Maryland
      allFiles.addAll(zirconiaConventionalBridgeAttachments); // Zirc Conventional
      allFiles.addAll(compositeOnlayAttachments); // Composite

      // ✅ Premium Dentures
      allFiles.addAll(premiumDentureTryInMetalAttachments);
      allFiles.addAll(premiumDentureReTryInAttachments);
      allFiles.addAll(premiumDentureFinishAcrylicAttachments);
      allFiles.addAll(premiumDentureFinishFlexiAttachments);

      // ✅ Premium Orthodontic
      allFiles.addAll(orthoFixedRetainerAttachments);
      allFiles.addAll(orthoEssixRetainerAttachments);

      // ✅ Premium Misc
      allFiles.addAll(miscStudyModuleAttachments);
      allFiles.addAll(miscSportsGuardAttachments);
      allFiles.addAll(miscTwAttachments);
      allFiles.addAll(miscNightGuardAttachments);
      allFiles.addAll(miscVacuumStentAttachments); // ✅ NEW
      allFiles.addAll(miscReEtchAttachments);

      if (allFiles.isNotEmpty) {
        List<MultipartBody> multipart = [];
        for (var file in allFiles) {
          multipart.add(MultipartBody("globalAttachments", file));
        }
        debugPrint(
            "Total files to upload ========================: ${allFiles.length}");
        response = await ApiClient.postMultipartData(
          ApiUrl.createCaseUrl,
          stringBody,
          multipartBody: multipart,
        );
      } else {
        response = await ApiClient.postData(
          ApiUrl.createCaseUrl,
          jsonEncode(body),
        );
      }

      isLoading.value = false;

      // 3. Handle Response
      Map<String, dynamic> jsonResponse = {};
      if (response.body != null && response.body.isNotEmpty) {
        if (response.body is String) {
          jsonResponse = jsonDecode(response.body);
        } else if (response.body is Map) {
          jsonResponse = response.body;
        }
      }

      debugPrint(
          "========================Submit Case Response: $jsonResponse");
      if (response.statusCode == 200 || response.statusCode == 201) {
        showMessage(
            jsonResponse['message']?.toString() ?? "Case created successfully!");
        Get.snackbar("Success", "Case Created Successfully");
        Get.back();
        _clearAllFields();
      } else {
        showMessage(
            jsonResponse['message']?.toString() ?? "Failed to create case",
            isError: true);
      }
    } catch (e) {
      isLoading.value = false;
      print("Submit Case Error: $e");
      showMessage("An error occurred. Please try again.", isError: true);
    }
  }

  void _clearAllFields() {
    patientIdController.clear();
    ageController.clear();
    scanNumberController.clear();
    descriptionController.clear();
    gender.value = '';
    caseType.value = '';
    tier.value = '';
    _clearAllProductData();
  }

  // =================================================================
  // ========= Private JSON Builders (Updated) =========
  // =================================================================

  List<String> _getFilePaths(RxList<File> fileList) {
    return []; // Files are sent as multipart, no need to send paths in JSON
  }

  Map<String, dynamic>? _buildStandardData() {
    return {
      "CrownBridge": standardType.value == "CROWN/BRIDGE"
          ? _buildStandardCrownBridgeData()
          : null,
      "Dentures": standardType.value == "DENTURES"
          ? _buildStandardDenturesData()
          : null,
      "Misc": null, // Standard Misc not implemented in UI
    };
  }

  Map<String, dynamic>? _buildPremiumData() {
    return {
      "CrownBridge": premiumType.value == "CROWN/BRIDGE"
          ? _buildPremiumCrownBridgeData()
          : null,
      "dentures": premiumType.value == "DENTURES"
          ? _buildPremiumDenturesData()
          : null,
      "implants": premiumType.value == "IMPLANTS"
          ? {"attachments": _getFilePaths(selectedFiles)} // Placeholder
          : null,
      // ✅ UPDATED to call new JSON builder
      "orthodontic": premiumType.value == "ORTHODONTIC"
          ? _buildPremiumOrthodonticData()
          : null,
      // ✅ UPDATED to call new JSON builder
      "misc": premiumType.value == "MISC"
          ? _buildPremiumMiscData()
          : null,
    };
  }

  // ✅ UPDATED to use new Metal Free builder
  Map<String, dynamic>? _buildStandardCrownBridgeData() {
    return {
      "pfm": crownType.value == "PFM (NP)" ? _buildPfmData() : null,
      "fullCast": crownType.value == "FULL CAST" ? _buildFullCastData() : null,
      "metalFree": crownType.value == "METAL"
          ? _buildStandardMetalFreeData() // ✅ Using new helper
          : null,
      "dentures": null,
    };
  }

  // ✅ UPDATED to use new Metal Free builder
  Map<String, dynamic>? _buildPremiumCrownBridgeData() {
    if (crownType.value.isNotEmpty) {
      return {
        "pfm": crownType.value == "PFM (NP)" ? _buildPfmData() : null,
        "fullCast": crownType.value == "FULL CAST" ? _buildFullCastData() : null,
        "metalFree": crownType.value == "METAL"
            ? _buildMetalFreeData() // ✅ Using new helper
            : null,
      };
    }
    return null;
  }

  // ✅ =================================================================
  // ✅ NEW: Premium Orthodontic JSON Builder
  // ✅ =================================================================
  Map<String, dynamic>? _buildPremiumOrthodonticData() {
    return {
      "type": premiumOrthodonticType.value,
      "fixedRetainer": premiumOrthodonticType.value == "Fixed Retainer" ? {
        "description": orthoFixedRetainerController.text,
        "attachments": _getFilePaths(orthoFixedRetainerAttachments),
      } : null,
      "essixRetainer": premiumOrthodonticType.value == "Essix Retainer" ? {
        "description": orthoEssixRetainerController.text,
        "attachments": _getFilePaths(orthoEssixRetainerAttachments),
      } : null,
    };
  }


  // ✅ =================================================================
  // ✅ NEW: Premium Misc JSON Builder (Updated for Radio Buttons)
  // ✅ =================================================================
  Map<String, dynamic>? _buildPremiumMiscData() {
    return {
      "type": premiumMiscType.value,
      "studyModule": premiumMiscType.value == "Study Module" ? {
        "selection": miscStudyModuleSelection.value, // ✅ CHANGED
        "teeth": miscStudyModuleTeeth.toList(), // ✅ NEW
        "description": miscStudyModuleController.text,
        // "attachments": _getFilePaths(),
      } : null,
      "sportsGuard": premiumMiscType.value == "Sports Guard" ? {
        // "selection" field removed
        "description": miscSportsGuardController.text, // This is the "Color" field
        "attachments": _getFilePaths(miscSportsGuardAttachments),
      } : null,
      "tw": premiumMiscType.value == "TW" ? {
        "selection": miscTwSelection.value, // ✅ CHANGED
        "description": miscTwController.text,
        "attachments": _getFilePaths(miscTwAttachments),
      } : null,
      "nightGuard": premiumMiscType.value == "Night Guard" ? {
        "selection": miscNightGuardSelection.value, // ✅ CHANGED
        "description": miscNightGuardController.text,
        "attachments": _getFilePaths(miscNightGuardAttachments),
      } : null,
      "vacuumFormedStent": premiumMiscType.value == "Vacuum Formed Stent" ? { // ✅ NEW
        "description": miscVacuumStentController.text,
        "attachments": _getFilePaths(miscVacuumStentAttachments),
      } : null,
      "reEtch": premiumMiscType.value == "Re-etch" ? {
        "selection": miscReEtchSelection.value, // ✅ CHANGED
        "description": miscReEtchController.text,
        "attachments": _getFilePaths(miscReEtchAttachments),
      } : null,
    };
  }

  //Full Cast
  Map<String, dynamic>? _buildStandardMetalFreeData(){
    return {
      "singleUnitCrown": showFullCastSingleUnit.value
          ? {
        "enabled": true,
        "teeth": fullCastSingleUnitTeeth.toList(),
        "description": descriptionController.text,
        "shade" : shadeController.value,
        "attachments": _getFilePaths(selectedFiles),
      }
          : null,
      "bridge": showFullCastBridge.value
          ? {
        "enabled": true,
        "ponticDesign" : ponticDesign.value,
        "teeth": bridgeTeeth.toList(),
        "description": descriptionController.text,
        "attachments": _getFilePaths(selectedFiles),
      }
          : null,
      "postAndCore": showPostAndCore.value
          ? {
        "enabled": true,
        "teeth": postAndCoreTeeth.toList(),
        "instructions": descriptionController.text,
        "attachments": _getFilePaths(selectedFiles),
      }
          : null,
    };
  }

  // "METAL"
  Map<String, dynamic>? _buildMetalFreeData() {
    Map<String, dynamic>? emaxData;
    if (ponticDesign.value == 'Emax') {
      emaxData = {
        "type": emaxType.value, // "Single unit crown" or "Veneer"
        "singleUnitCrown": emaxType.value == 'Single unit crown'
            ? {
          "teeth": emaxTeeth.toList(),
          "shade2D" : shadeController.value,
          "shade3D": shadeController.value,
          "description": emaxInstructionsController.text,
          "attachments": _getFilePaths(emaxAttachments)
        }
            : null,
        "veneer": emaxType.value == 'Veneer'
            ? {
          "teeth": emaxVeneerTeeth.toList(),
          "shade2D" : shadeController.value,
          "shade3D": shadeController.value,
          "instructions": emaxVeneerInstructionsController.text,
          "attachments": _getFilePaths(emaxVeneerAttachments)
        }
            : null,
      };
    }

    Map<String, dynamic>? zirconiaData;
    if (ponticDesign.value == 'Zirconia') {
      zirconiaData = {
        "type": zirconiaType.value, // "Single unit crown", "Veneer", etc.
        "singleUnitCrown": zirconiaType.value == 'Single unit crown'
            ? {
          "teeth": zirconiaTeeth.toList(),
          "shade2D" : shadeController.value,
          "shade3D": shadeController.value,
          "instructions": zirconiaInstructionsController.text,
          "attachments": _getFilePaths(zirconiaAttachments)
        }
            : null,
        "veneer": zirconiaType.value == 'Veneer'
            ? {
          "teeth": zirconiaVeneerTeeth.toList(),
          "shade2D" : shadeController.value,
          "shade3D": shadeController.value,
          "instructions": zirconiaVeneerInstructionsController.text,
          "attachments": _getFilePaths(zirconiaVeneerAttachments)
        }
            : null,
        "marylandBridge": zirconiaType.value == 'Maryland bridge'
            ? {
          "teeth": zirconiaMarylandBridgeTeeth.toList(),
          "shade" : shadeController.value,
          "instructions": zirconiaMarylandBridgeInstructionsController.text,
          "attachments": _getFilePaths(zirconiaMarylandBridgeAttachments),
          "enabled": true,
          "ponticTeeth": marylandponticTeeth.value,
          "wingTeeth": marylandwingTeeth.value,
        }
            : null,
        "conventionalBridge": zirconiaType.value == 'Conventional Bridge'
            ? {
          "teeth": zirconiaConventionalBridgeTeeth.toList(),
          "shade" : shadeController.value,
          "description": descriptionController.text,
          "attachments":
          _getFilePaths(zirconiaConventionalBridgeAttachments)
        }
            : null,
      };
    }

    Map<String, dynamic>? compositeOnlayData;
    if (ponticDesign.value == 'Composite Onlay') {
      compositeOnlayData = {
        "teeth": compositeOnlayTeeth.toList(),
        "shade2D" : shadeController.value,
        "shade3D" : shadeController.value,
        // "ponticTeeth": marylandponticTeeth.value,
        "instructions": compositeOnlayInstructionsController.text,
        "attachments": _getFilePaths(compositeOnlayAttachments),
      };
    }

    return {
      "design": ponticDesign.value, // "Emax", "Zirconia", "Composite Onlay"
      "emax": emaxData,
      "zirconia": zirconiaData,
      "compositeOnlay": compositeOnlayData,
    };
  }

  //PFM
  Map<String, dynamic>? _buildPfmData() {
    return {
      "singleUnitCrown": showSingleUnitDropdown.value
          ? {
        "enabled": true,
        "teeth": singleUnitTeeth.toList(),
        "shade" : shadeController.value,
        "porcelainButtMargin": pfmSingleUnitPorcelainButtMargin.value,
        "instructions": descriptionController.text,
        "attachments": _getFilePaths(selectedFiles),
      } : null,
      "marylandBridge": showMarylandBridgeDropdown.value
          ? {
        "enabled": true,
        "ponticTeeth": marylandponticTeeth.value,
        "wingTeeth": marylandwingTeeth.value,
        "teeth" : singleUnitTeeth.toList(),
        "shade" : shadeController.value,
        "instructions": descriptionController.text,
        "attachments": _getFilePaths(selectedFiles),
      }
          : null,
      "conventionalBridge": showConventionalBridgeDropdown.value
          ? {
        "enabled": true,
        "ponticDesign": ponticDesign.value,
        "teeth": conventionalBridgeTeeth.toList(),
        "shade" : shadeController.value,
        "description": descriptionController.text,
        "attachments": _getFilePaths(selectedFiles),
      }
          : null,
    };
  }

  //Full Cast
  Map<String, dynamic>? _buildFullCastData() {
    return {
      "singleUnitCrown": showFullCastSingleUnit.value
          ? {
        "enabled": true,
        "teeth": fullCastSingleUnitTeeth.toList(),
        "description": descriptionController.text,
        "shade" : shadeController.value,
        "attachments": _getFilePaths(selectedFiles),
      }
          : null,
      "bridge": showFullCastBridge.value
          ? {
        "enabled": true,
        "ponticDesign" : ponticDesign.value,
        "teeth": bridgeTeeth.toList(),
        "description": descriptionController.text,
        "attachments": _getFilePaths(selectedFiles),
      }
          : null,
      "postAndCore": showPostAndCore.value
          ? {
        "enabled": true,
        "teeth": postAndCoreTeeth.toList(),
        "instructions": descriptionController.text,
        "attachments": _getFilePaths(selectedFiles),
      }
          : null,
    };
  }






  // ✅ =================================================================
  // ✅ UPDATED: Standard Denture JSON Builder (THE FIX)
  // ✅ =================================================================
  Map<String, dynamic>? _buildStandardDenturesData() {

    // 1. Determine which description controller is active
    TextEditingController activeDescController = dentureTryInDescController; // Default
    if (porcelainButtMargin.value == "Re-try In") {
      activeDescController = dentureReTryInDescController;
    } else if (porcelainButtMargin.value == "Finish") {
      activeDescController = dentureFinishDescController;
    }

    // 2. Build the construction object
    Map<String, dynamic>? constructionData = showDentureConstruction.value
        ? {
      "enabled": true,
      "biteBlock": {
        "upper": biteBlockUpper.value,
        "lower": biteBlockLower.value
      },
      "specialTray": {
        "upper": specialTrayUpper.value,
        "lower": specialTrayLower.value
      },
      "meshReinforcement": meshReinforcement.value,

      // ✅ THE FIX: Send booleans for stages, not objects
      "tryIn": porcelainButtMargin.value == "Try In",
      "reTryIn": porcelainButtMargin.value == "Re-try In",
      "finish": porcelainButtMargin.value == "Finish",

      // ✅ Send the data at the root of 'construction'
      "teethSelection": dentureTeeth.toList(),
      "description": descriptionController.text,
      "attachments": _getFilePaths(dentureAttachments),
      "shade": shadeController.value,
      "selectedOptions": porcelainButtMargin.value.isNotEmpty
          ? [porcelainButtMargin.value]
          : [],
    }
        : null;

    // 3. Build the 'other' object
    Map<String, dynamic>? otherData = showDentureOther.value
        ? {
      "enabled": true,
      "selectedOptions": dentureOtherSelections.toList(), // ["Reline", "Repair", ...]

      // ✅ Add data from the UI widgets as seen in the screen
      "teethSelection": dentureTeeth.toList(),
      "description": dentureTryInDescController.text, // Re-using 'tryIn' controller as per UI
      "attachments": _getFilePaths(dentureAttachments),
      "shade": shadeController.value,
    }
        : null;

    return {
      "construction": constructionData,
      "other": otherData,
    };
  }

  // ✅ =================================================================
  // ✅ UPDATED: Premium Denture JSON Builder (THE FIX)
  // ✅ =================================================================
  Map<String, dynamic>? _buildPremiumDenturesData() {

    // 1. Determine which premium description controller is active
    TextEditingController activeDescController = premiumDentureTryInMetalController;
    RxList<String> activeTeethList = premiumDentureTryInMetalTeeth;
    RxList<File> activeAttachmentList = premiumDentureTryInMetalAttachments;

    if (premiumDentureConstructionType.value == "Re-try In") {
      activeDescController = premiumDentureReTryInController;
      activeTeethList = premiumDentureReTryInTeeth;
      activeAttachmentList = premiumDentureReTryInAttachments;
    } else if (premiumDentureConstructionType.value == "Finish Acrylic") {
      activeDescController = premiumDentureFinishAcrylicController;
      activeTeethList = premiumDentureFinishAcrylicTeeth;
      activeAttachmentList = premiumDentureFinishAcrylicAttachments;
    } else if (premiumDentureConstructionType.value == "Finish Flexi") {
      activeDescController = premiumDentureFinishFlexiController;
      activeTeethList = premiumDentureFinishFlexiTeeth;
      activeAttachmentList = premiumDentureFinishFlexiAttachments;
    }

    // 2. Build the construction object
    Map<String, dynamic>? constructionData = showDentureConstruction.value
        ? {
      "enabled": true,
      "biteBlock": {
        "upper": biteBlockUpper.value,
        "lower": biteBlockLower.value
      },
      "specialTray": {
        "upper": specialTrayUpper.value,
        "lower": specialTrayLower.value
      },
      "meshReinforcement": meshReinforcement.value,
      "shade": shadeController.value,
      // ✅ THE FIX: Send the selected stage name
      "selectedStage": premiumDentureConstructionType.value,

      // ✅ Send the data for the *active* stage
      "teeth": activeTeethList.toList(),
      "description": activeDescController.text,
      "attachments": _getFilePaths(activeAttachmentList),
    }
        : null;

    // 3. Build the 'other' object
    Map<String, dynamic>? otherData = showDentureOther.value
        ? {
      "enabled": true,
      "selectedOptions": dentureOtherSelections.toList(), // ["Reline", "Repair", ...]

      // ✅ Add data from the UI widgets (re-using 'TryIn' variables as per UI)
      "teethSelection": premiumDentureTryInMetalTeeth.toList(),
      "shade": shadeController.value,
      "description": premiumDentureTryInMetalController.text,
      "attachments": _getFilePaths(premiumDentureTryInMetalAttachments),
    }
        : null;

    return {
      "type": dentureType.value, // "Denture Construction" or "Denture Other"
      "construction": constructionData,
      "other": otherData,
    };
  }

  @override
  void onClose() {
    patientIdController.dispose();
    ageController.dispose();
    scanNumberController.dispose();
    descriptionController.dispose();

    // Dispose Metal controllers
    emaxInstructionsController.dispose();
    zirconiaInstructionsController.dispose();
    compositeOnlayInstructionsController.dispose();

    // ✅ Dispose NEW Metal controllers
    emaxVeneerInstructionsController.dispose();
    zirconiaVeneerInstructionsController.dispose();
    zirconiaMarylandBridgeInstructionsController.dispose();
    zirconiaConventionalBridgeDescController.dispose();

    // ✅ Dispose NEW Premium Denture controllers
    premiumDentureTryInMetalController.dispose();
    premiumDentureReTryInController.dispose();
    premiumDentureFinishAcrylicController.dispose();
    premiumDentureFinishFlexiController.dispose();

    // ✅ Dispose NEW Premium Orthodontic controllers
    orthoFixedRetainerController.dispose();
    orthoEssixRetainerController.dispose();

    // ✅ Dispose NEW Premium Misc controllers
    miscStudyModuleController.dispose();
    miscSportsGuardController.dispose();
    miscTwController.dispose();
    miscNightGuardController.dispose();
    miscVacuumStentController.dispose(); // ✅ NEW
    miscReEtchController.dispose();


    // Dispose nested instruction controllers
    pfmSingleUnitInstructionsController.dispose();
    pfmMarylandInstructionsController.dispose();
    pfmConventionalBridgeDescController.dispose();
    fcSingleUnitInstructionsController.dispose();
    fcBridgeDescController.dispose();
    fcPostAndCoreInstructionsController.dispose();
    metalBridgeDescController.dispose();
    dentureTryInDescController.dispose();
    dentureReTryInDescController.dispose();
    dentureFinishDescController.dispose();

    super.onClose();
  }
}