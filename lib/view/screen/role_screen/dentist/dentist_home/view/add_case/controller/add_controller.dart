import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../../../../../service/api_client.dart';
import '../../../../../../../../service/api_url.dart';

class AddCaseController extends GetxController {
  /// ========= Text Controllers =========
  final patientIdController = TextEditingController();
  final ageController = TextEditingController();
  final scanNumberController = TextEditingController();

  /// ========= Observables =========
  var caseType = ''.obs;
  var gender = ''.obs;
  var tier = ''.obs;
  var standardType = ''.obs;
  var porcelainButtMargin = ''.obs;
  var crownType = ''.obs;
  var pfmOption = ''.obs;
  var fullCastOption = ''.obs;
  var bridgeType = ''.obs;
  var dentureType = ''.obs;
  var dentureConstructionOption = ''.obs;
  var isTypeSelect = "";
  var isLoading = false.obs;

  /// ========= Visibility Flags =========
  var showSingleUnitDropdown = false.obs;
  var showMarylandBridgeDropdown = false.obs;
  var showConventionalBridgeDropdown = false.obs;
  var showFullCastSingleUnit = false.obs;
  var showFullCastBridge = false.obs;
  var showBridge = false.obs;
  var showMetalBridge = false.obs;
  var showPostAndCore = false.obs;
  var showDentureConstruction = false.obs;
  var showDentureOther = false.obs;
  var biteBlockUpper = false.obs;
  var biteBlockLower = false.obs;
  var specialTrayUpper = false.obs;
  var specialTrayLower = false.obs;
  var meshReinforcement = false.obs;
  var tryInSelected = false.obs;
  var reTryInSelected = false.obs;
  var finishSelected = false.obs;

  /// ========= Teeth & Attachments =========
  var singleUnitTeeth = <String>[].obs;
  var singleUnitAttachments = <File>[].obs;

  var marylandPonticTeeth = <String>[].obs;
  var marylandWingTeeth = <String>[].obs;
  var marylandAttachments = <File>[].obs;

  /// ========= Conventional Bridge =========
  var conventionalBridgeTeeth = <String>[].obs;
  var conventionalBridgeAttachments = <File>[].obs;

  /// ========= Full Cast Single unit =========
  var fullCastSingleUnitTeeth = <String>[].obs;
  var fullCastSingleUnitAttachments = <File>[].obs;

  /// ========= Full Cast Post & Core =========
  var postAndCoreTeeth = <String>[].obs;
  var postAndCoreAttachments = <File>[].obs;

  /// ========= Full Cast Bridge =========
  var bridgeTeeth = <String>[].obs;
  var bridgeAttachments = <File>[].obs;

  /// ========= Full Cast Bridge =========
  var metalBridgeTeeth = <String>[].obs;
  var metalBridgeAttachments = <File>[].obs;

  /// ========= Teeth Selection =========
  var dentureTeeth = <String>[].obs;

  /// ========= File Attachments =========
  var dentureAttachments = <File>[].obs;

  /// ========= Multi-file Upload =========
  var selectedFiles = <File>[].obs;

  /// ========= Premium Section Observables =========
  var premiumType = ''.obs;
  var premiumCrownType = ''.obs;
  var premiumPFMOption = ''.obs;
  var premiumFullCastOption = ''.obs;
  var premiumDentureType = ''.obs;
  var premiumShowDentureConstruction = false.obs;
  var premiumShowDentureOther = false.obs;

  /// ========= Premium Teeth & Attachments =========
  var premiumSingleUnitTeeth = <String>[].obs;
  var premiumSingleUnitAttachments = <File>[].obs;

  var premiumMarylandPonticTeeth = <String>[].obs;
  var premiumMarylandWingTeeth = <String>[].obs;
  var premiumMarylandAttachments = <File>[].obs;

  var premiumConventionalBridgeTeeth = <String>[].obs;
  var premiumConventionalBridgeAttachments = <File>[].obs;

  var premiumFullCastSingleUnitTeeth = <String>[].obs;
  var premiumFullCastSingleUnitAttachments = <File>[].obs;

  var premiumBridgeTeeth = <String>[].obs;
  var premiumBridgeAttachments = <File>[].obs;

  var premiumMetalBridgeTeeth = <String>[].obs;
  var premiumMetalBridgeAttachments = <File>[].obs;

  var premiumPostAndCoreTeeth = <String>[].obs;
  var premiumPostAndCoreAttachments = <File>[].obs;

  /// ========= Premium Denture =========
  var premiumDentureTeeth = <String>[].obs;
  var premiumDentureAttachments = <File>[].obs;


  @override
  void onInit() {
    super.onInit();
    singleUnitTeeth.assignAll([]);
    marylandPonticTeeth.assignAll([]);
    marylandWingTeeth.assignAll([]);
    conventionalBridgeTeeth.assignAll([]);
    fullCastSingleUnitTeeth.assignAll([]);
    bridgeTeeth.assignAll([]);
    metalBridgeTeeth.assignAll([]);
    postAndCoreTeeth.assignAll([]);
  }

  /// ========= Dropdown Logic =========
  void onTierChange(String? val) {
    tier.value = val ?? '';
    standardType.value = '';
    crownType.value = '';
  }

  void onStandardTypeChange(String val) {
    standardType.value = val;
    crownType.value = '';
  }

  void onCrownTypeChange(String? val) {
    crownType.value = val ?? '';
    pfmOption.value = '';
    showSingleUnitDropdown.value = false;
    showMarylandBridgeDropdown.value = false;
    showConventionalBridgeDropdown.value = false;
  }

  /// ========= PFM Option =========
  void onPFMOptionChange(String? val) {
    pfmOption.value = val ?? '';
    showSingleUnitDropdown.value = pfmOption.value == "Single unit crown";
    showMarylandBridgeDropdown.value = pfmOption.value == "Maryland bridge";
    showConventionalBridgeDropdown.value = pfmOption.value == "Conventional Bridge";
  }

  /// ========= Full Cast =========
  void onFullCastChange(String? val) {
    fullCastOption.value = val ?? '';
    showFullCastSingleUnit.value = val == "Single unit crown";
    showFullCastBridge.value = val == "Bridge";
    showPostAndCore.value = val == "Post and Core";
  }

  void onDentureTypeChange(String? val) {
    dentureType.value = val ?? '';
    showDentureConstruction.value = val == "Denture Construction";
    showDentureOther.value = val == "Denture Other";
  }

  void onDentureConstructionChange(String? val) {
    dentureConstructionOption.value = val ?? '';
  }

  void onPremiumTypeChange(String? val) {
    premiumType.value = val ?? '';
    premiumCrownType.value = '';
  }

  void onPremiumCrownTypeChange(String? val) {
    premiumCrownType.value = val ?? '';
    premiumPFMOption.value = '';
    premiumFullCastOption.value = '';
  }

  void onPremiumPFMOptionChange(String? val) {
    premiumPFMOption.value = val ?? '';
    showSingleUnitDropdown.value = premiumPFMOption.value == "Single unit crown";
    showMarylandBridgeDropdown.value = premiumPFMOption.value == "Maryland bridge";
    showConventionalBridgeDropdown.value = premiumPFMOption.value == "Conventional Bridge";
  }

  void onPremiumFullCastOptionChange(String? val) {
    premiumFullCastOption.value = val ?? '';
  }

  void onPremiumDentureTypeChange(String? val) {
    premiumDentureType.value = val ?? '';
    premiumShowDentureConstruction.value = val == "Denture Construction";
    premiumShowDentureOther.value = val == "Denture Other";
  }


  /// ========= Pick multiple files =========
  Future<void> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null) {
      selectedFiles.clear();
      selectedFiles.addAll(result.paths.map((p) => File(p!)));
    }
  }

  /// ========= Pick Conventional Bridge Files =========
  // Future<void> pickConventionalBridgeFiles() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowMultiple: true,
  //     allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
  //   );
  //
  //   if (result != null) {
  //     conventionalBridgeAttachments.clear();
  //     conventionalBridgeAttachments.addAll(result.paths.map((p) => File(p!)));
  //   }
  // }

  /// ========= Snackbar =========
  void showMessage(String message, {bool isError = false}) {
    Get.snackbar(
      isError ? "Error" : "Success",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isError ? Colors.red : Colors.green,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    );
  }

  /// ========= Submit Case =========
  Future<void> submitCase() async {
    if (patientIdController.text.isEmpty) {
      showMessage("Please enter Patient ID", isError: true);
      return;
    }
    if (ageController.text.isEmpty) {
      showMessage("Please enter Age", isError: true);
      return;
    }

    Map<String, dynamic> body = {
      "case_type": caseType.value,
      "gender": gender.value,
      "age": int.tryParse(ageController.text.trim()) ?? 0,
      "patientID": patientIdController.text.trim(),
      "selectedTier": tier.value,
      "standard": [],
      "premium": [],
      // "standard_type": standardType.value,
      // "crown_type": crownType.value,
      // "pfm_option": pfmOption.value,
      // "full_cast_option": fullCastOption.value,
    };

    if (scanNumberController.text.trim().isNotEmpty) {
      body["scan_number"] = scanNumberController.text.trim();
    }

    /// ========== Standard JSON ==========
    (isTypeSelect == "Standard" ?
    body["standard"] = {
      "CrownBridge": {
        "pfm": {
          "singleUnitCrown": {
            "enabled": showSingleUnitDropdown.value,
            "teeth": singleUnitTeeth.toList(),
            "attachments": singleUnitAttachments.map((f) => f.path).toList()
          },
          "marylandBridge": {
            "enabled": showMarylandBridgeDropdown.value,
            "ponticTeeth": marylandPonticTeeth.toList(),
            "wingTeeth": marylandWingTeeth.toList(),
            "attachments": marylandAttachments.map((f) => f.path).toList()
          },
          "conventionalBridge": {
            "enabled": showConventionalBridgeDropdown.value,
            "teeth": conventionalBridgeTeeth.toList(),
            "attachments": conventionalBridgeAttachments.map((f) => f.path).toList()
          },
        },
        "fullCast": {
          "singleUnitCrown": {
            "enabled": showFullCastSingleUnit.value,
            "teeth": fullCastSingleUnitTeeth.toList(),
            "attachments": fullCastSingleUnitAttachments.map((f) => f.path).toList()
          },
          "bridge": {
            "enabled": showFullCastBridge.value,
            "teeth": bridgeTeeth.toList(),
            "attachments": bridgeAttachments.map((f) => f.path).toList()
          },
          "postAndCore": {
            "enabled": showPostAndCore.value,
            "teeth": postAndCoreTeeth.toList(),
            "attachments": postAndCoreAttachments.map((f) => f.path).toList()
          },
          "conventionalBridge": {
            "enabled": showConventionalBridgeDropdown.value,
            "teeth": conventionalBridgeTeeth.toList(),
            "attachments": conventionalBridgeAttachments.map((f) => f.path).toList()
          }
        },
        "metalFree": {
          "enabled": showMetalBridge.value,
          "teeth": metalBridgeTeeth.toList(),
          "attachments": metalBridgeAttachments.map((f) => f.path).toList()
        },
        "dentures": {
          "construction": {"enabled": false, "selectedOptions": [], "teethSelection": [], "attachments": []},
          "other": {"selectedOptions": [], "teethSelection": [], "attachments": []}
        }
      },
      "Dentures": {
        "construction": {
          "enabled": dentureType.value == "Denture Construction",
          "biteBlock": {"upper": biteBlockUpper.value, "lower": biteBlockLower.value},
          "specialTray": {"upper": specialTrayUpper.value, "lower": specialTrayLower.value},
          "meshReinforcement": meshReinforcement.value,
          "tryIn": tryInSelected.value,
          "reTryIn": reTryInSelected.value,
          "finish": finishSelected.value,
          "teethSelection": dentureTeeth.toList(),
          "attachments": dentureAttachments.map((f) => f.path).toList()
        },
        "other": {
          "enabled": dentureType.value == "Denture Other",
          "teethSelection": dentureTeeth.toList(),
          "attachments": dentureAttachments.map((f) => f.path).toList()
        }
      }
    }
    :
    body["premium"] = {
      "CrownBridge": {
        "pfm": {
          "singleUnitCrown": {
            "enabled": showSingleUnitDropdown.value,
            "teeth": premiumSingleUnitTeeth.toList(),
            "attachments": premiumSingleUnitAttachments.map((f) => f.path).toList()
          },
          "marylandBridge": {
            "enabled": showMarylandBridgeDropdown.value,
            "ponticTeeth": marylandPonticTeeth.toList(),
            "wingTeeth": marylandWingTeeth.toList(),
            "attachments": marylandAttachments.map((f) => f.path).toList()
          },
          "conventionalBridge": {
            "enabled": showConventionalBridgeDropdown.value,
            "teeth": conventionalBridgeTeeth.toList(),
            "attachments": conventionalBridgeAttachments.map((f) => f.path).toList()
          },
        },
        "fullCast": {
          "singleUnitCrown": {
            "enabled": showFullCastSingleUnit.value,
            "teeth": fullCastSingleUnitTeeth.toList(),
            "attachments": fullCastSingleUnitAttachments.map((f) => f.path).toList()
          },
          "bridge": {
            "enabled": showFullCastBridge.value,
            "teeth": bridgeTeeth.toList(),
            "attachments": bridgeAttachments.map((f) => f.path).toList()
          },
          "postAndCore": {
            "enabled": showPostAndCore.value,
            "teeth": postAndCoreTeeth.toList(),
            "attachments": postAndCoreAttachments.map((f) => f.path).toList()
          },
          "conventionalBridge": {
            "enabled": showConventionalBridgeDropdown.value,
            "teeth": conventionalBridgeTeeth.toList(),
            "attachments": conventionalBridgeAttachments.map((f) => f.path).toList()
          }
        },
        "metalFree": {
          // "enabled": showMetalBridge.value,
          "teeth": metalBridgeTeeth.toList(),
          "attachments": metalBridgeAttachments.map((f) => f.path).toList()
        },
        // "dentures": {
        //   "construction": {"selectedOptions": [], "teethSelection": [], "attachments": []},
        //   "other": {"selectedOptions": [], "teethSelection": [], "attachments": []}
        // }
      },
      "Dentures": {
        "construction": {
          "enabled": dentureType.value == "Denture Construction",
          "biteBlock": {"upper": biteBlockUpper.value, "lower": biteBlockLower.value},
          "specialTray": {"upper": specialTrayUpper.value, "lower": specialTrayLower.value},
          "meshReinforcement": meshReinforcement.value,
          "tryIn": tryInSelected.value,
          "reTryIn": reTryInSelected.value,
          "finish": finishSelected.value,
          "teethSelection": dentureTeeth.toList(),
          "attachments": dentureAttachments.map((f) => f.path).toList()
        },
        "other": {
          "enabled": dentureType.value == "Denture Other",
          "teethSelection": dentureTeeth.toList(),
          "attachments": dentureAttachments.map((f) => f.path).toList()
        }
      }
    });

    isLoading.value = true;

    try {
      dynamic response;

      if (selectedFiles.isNotEmpty) {
        List<MultipartBody> multipart = [];
        for (var file in selectedFiles) {
          multipart.add(MultipartBody("attachments", file));
        }

        response = await ApiClient.postMultipartData(
          ApiUrl.createCaseUrl,
          {"data": jsonEncode(body)},
          multipartBody: multipart,
        );
      } else {
        response = await ApiClient.postData(ApiUrl.createCaseUrl, jsonEncode(body));
      }

      isLoading.value = false;

      Map<String, dynamic> jsonResponse = {};
      if (response.body != null && response.body.isNotEmpty) {
        if (response.body is String) {
          jsonResponse = jsonDecode(response.body);
        } else if (response.body is Map) {
          jsonResponse = response.body;
        }
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        showMessage(jsonResponse['message']?.toString() ?? "Case created successfully!");

        // Clear form
        patientIdController.clear();
        ageController.clear();
        scanNumberController.clear();
        gender.value = '';
        tier.value = '';
        standardType.value = '';
        crownType.value = '';
        pfmOption.value = '';
        fullCastOption.value = '';
        caseType.value = '';
        singleUnitTeeth.clear();
        singleUnitAttachments.clear();
        marylandPonticTeeth.clear();
        marylandWingTeeth.clear();
        marylandAttachments.clear();
        conventionalBridgeTeeth.clear();
        conventionalBridgeAttachments.clear();
        postAndCoreTeeth.clear();
        postAndCoreAttachments.clear();
        selectedFiles.clear();
      } else {
        showMessage(jsonResponse['message']?.toString() ?? "Failed to create case", isError: true);
      }
    } catch (e) {
      isLoading.value = false;
      showMessage("An error occurred. Please try again.", isError: true);
      print("Submit Case Error: $e");
    }
  }

  @override
  void onClose() {
    patientIdController.dispose();
    ageController.dispose();
    scanNumberController.dispose();
    super.onClose();
  }
}
