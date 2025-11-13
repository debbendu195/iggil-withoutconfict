// 📁 case_details_model.dart

class CaseDetailsModel {
  bool? success;
  CaseDetailsData? data;

  CaseDetailsModel({this.success, this.data});

  factory CaseDetailsModel.fromJson(Map<String, dynamic> json) {
    return CaseDetailsModel(
      success: json['success'],
      data: json['data'] != null ? CaseDetailsData.fromJson(json['data']) : null,
    );
  }
}

class CaseDetailsData {
  String? id;
  String? caseType;
  String? caseNumber;
  String? gender;
  int? age;
  String? patientID;
  String? selectedTier;
  String? description;
  String? status;
  bool? isArchived;
  DateTime? createdAt;
  DateTime? updatedAt;
  AdminApproval? adminApproval;
  TierData? standard;
  TierData? premium;
  List<GlobalAttachment>? globalAttachments;
  int? v;

  CaseDetailsData({
    this.id,
    this.caseType,
    this.caseNumber,
    this.gender,
    this.age,
    this.patientID,
    this.selectedTier,
    this.description,
    this.status,
    this.isArchived,
    this.createdAt,
    this.updatedAt,
    this.adminApproval,
    this.standard,
    this.premium,
    this.globalAttachments,
    this.v,
  });

  factory CaseDetailsData.fromJson(Map<String, dynamic> json) {
    return CaseDetailsData(
      id: json['_id'],
      caseType: json['caseType'],
      caseNumber: json['caseNumber'],
      gender: json['gender'],
      age: json['age'],
      patientID: json['patientID'],
      selectedTier: json['selectedTier'],
      description: json['description'],
      status: json['status'],
      isArchived: json['isArchived'],
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt']) : null,
      adminApproval: json['adminApproval'] != null
          ? AdminApproval.fromJson(json['adminApproval'])
          : null,
      standard: json['standard'] != null ? TierData.fromJson(json['standard']) : null,
      premium: json['premium'] != null ? TierData.fromJson(json['premium']) : null,
      globalAttachments: json['globalAttachments'] != null
          ? List<GlobalAttachment>.from(
          json['globalAttachments'].map((x) => GlobalAttachment.fromJson(x)))
          : [],
      v: json['__v'],
    );
  }
}

class AdminApproval {
  String? status;
  String? approvedAt;

  AdminApproval({this.status, this.approvedAt});

  factory AdminApproval.fromJson(Map<String, dynamic> json) {
    return AdminApproval(
      status: json['status'],
      approvedAt: json['approvedAt'],
    );
  }
}

class TierData {
  CrownBridge? crownBridge;
  Dentures? dentures;
  dynamic misc;

  TierData({this.crownBridge, this.dentures, this.misc});

  factory TierData.fromJson(Map<String, dynamic> json) {
    return TierData(
      crownBridge: json['CrownBridge'] != null
          ? CrownBridge.fromJson(json['CrownBridge'])
          : null,
      dentures:
      json['Dentures'] != null ? Dentures.fromJson(json['Dentures']) : null,
      misc: json['Misc'],
    );
  }
}

class CrownBridge {
  PFM? pfm;
  FullCast? fullCast;
  MetalFree? metalFree;
  CrownBridgeDentures? dentures;

  CrownBridge({this.pfm, this.fullCast, this.metalFree, this.dentures});

  factory CrownBridge.fromJson(Map<String, dynamic> json) {
    return CrownBridge(
      pfm: json['pfm'] != null ? PFM.fromJson(json['pfm']) : null,
      fullCast:
      json['fullCast'] != null ? FullCast.fromJson(json['fullCast']) : null,
      metalFree: json['metalFree'] != null
          ? MetalFree.fromJson(json['metalFree'])
          : null,
      dentures: json['dentures'] != null
          ? CrownBridgeDentures.fromJson(json['dentures'])
          : null,
    );
  }
}

class PFM {
  SingleUnitCrown? singleUnitCrown;
  MarylandBridge? marylandBridge;
  ConventionalBridge? conventionalBridge;

  PFM({this.singleUnitCrown, this.marylandBridge, this.conventionalBridge});

  factory PFM.fromJson(Map<String, dynamic> json) {
    return PFM(
      singleUnitCrown: json['singleUnitCrown'] != null
          ? SingleUnitCrown.fromJson(json['singleUnitCrown'])
          : null,
      marylandBridge: json['marylandBridge'] != null
          ? MarylandBridge.fromJson(json['marylandBridge'])
          : null,
      conventionalBridge: json['conventionalBridge'] != null
          ? ConventionalBridge.fromJson(json['conventionalBridge'])
          : null,
    );
  }
}

class SingleUnitCrown {
  bool? enabled;
  String? porcelainButtMargin;
  List<String>? teeth;
  List<String>? shade;
  List<dynamic>? attachments;

  SingleUnitCrown(
      {this.enabled,
        this.porcelainButtMargin,
        this.teeth,
        this.shade,
        this.attachments});

  factory SingleUnitCrown.fromJson(Map<String, dynamic> json) {
    return SingleUnitCrown(
      enabled: json['enabled'],
      porcelainButtMargin: json['porcelainButtMargin'],
      teeth: json['teeth'] != null ? List<String>.from(json['teeth']) : null,
      shade: json['shade'] != null ? List<String>.from(json['shade']) : null,
      attachments: json['attachments'] != null
          ? List<dynamic>.from(json['attachments'])
          : null,
    );
  }
}

class MarylandBridge {
  bool? enabled;
  List<String>? teeth;
  List<String>? ponticTeeth;
  List<String>? wingTeeth;
  List<String>? shade;
  List<dynamic>? attachments;

  MarylandBridge(
      {this.enabled,
        this.teeth,
        this.ponticTeeth,
        this.wingTeeth,
        this.shade,
        this.attachments});

  factory MarylandBridge.fromJson(Map<String, dynamic> json) {
    return MarylandBridge(
      enabled: json['enabled'],
      teeth: json['teeth'] != null ? List<String>.from(json['teeth']) : null,
      ponticTeeth: json['ponticTeeth'] != null
          ? List<String>.from(json['ponticTeeth'])
          : null,
      wingTeeth: json['wingTeeth'] != null
          ? List<String>.from(json['wingTeeth'])
          : null,
      shade: json['shade'] != null ? List<String>.from(json['shade']) : null,
      attachments: json['attachments'] != null
          ? List<dynamic>.from(json['attachments'])
          : null,
    );
  }
}

class ConventionalBridge {
  bool? enabled;
  List<String>? teeth;
  List<String>? shade;
  List<String>? ponticTeeth;
  List<dynamic>? attachments;

  ConventionalBridge(
      {this.enabled, this.teeth, this.shade, this.ponticTeeth, this.attachments});

  factory ConventionalBridge.fromJson(Map<String, dynamic> json) {
    return ConventionalBridge(
      enabled: json['enabled'],
      teeth: json['teeth'] != null ? List<String>.from(json['teeth']) : null,
      shade: json['shade'] != null ? List<String>.from(json['shade']) : null,
      ponticTeeth: json['ponticTeeth'] != null
          ? List<String>.from(json['ponticTeeth'])
          : null,
      attachments: json['attachments'] != null
          ? List<dynamic>.from(json['attachments'])
          : null,
    );
  }
}

class FullCast {
  FullCastItem? singleUnitCrown;
  FullCastItem? bridge;
  FullCastItem? postAndCore;
  ConventionalBridge? conventionalBridge;

  FullCast(
      {this.singleUnitCrown, this.bridge, this.postAndCore, this.conventionalBridge});

  factory FullCast.fromJson(Map<String, dynamic> json) {
    return FullCast(
      singleUnitCrown: json['singleUnitCrown'] != null
          ? FullCastItem.fromJson(json['singleUnitCrown'])
          : null,
      bridge:
      json['bridge'] != null ? FullCastItem.fromJson(json['bridge']) : null,
      postAndCore: json['postAndCore'] != null
          ? FullCastItem.fromJson(json['postAndCore'])
          : null,
      conventionalBridge: json['conventionalBridge'] != null
          ? ConventionalBridge.fromJson(json['conventionalBridge'])
          : null,
    );
  }
}

class FullCastItem {
  bool? enabled;
  List<String>? teeth;
  List<dynamic>? attachments;

  FullCastItem({this.enabled, this.teeth, this.attachments});

  factory FullCastItem.fromJson(Map<String, dynamic> json) {
    return FullCastItem(
      enabled: json['enabled'],
      teeth: json['teeth'] != null ? List<String>.from(json['teeth']) : null,
      attachments: json['attachments'] != null
          ? List<dynamic>.from(json['attachments'])
          : null,
    );
  }
}

class MetalFree {
  bool? enabled;
  List<String>? compositeType;
  List<String>? teeth;
  List<dynamic>? attachments;

  MetalFree({this.enabled, this.compositeType, this.teeth, this.attachments});

  factory MetalFree.fromJson(Map<String, dynamic> json) {
    return MetalFree(
      enabled: json['enabled'],
      compositeType: json['compositeType'] != null
          ? List<String>.from(json['compositeType'])
          : null,
      teeth: json['teeth'] != null ? List<String>.from(json['teeth']) : null,
      attachments: json['attachments'] != null
          ? List<dynamic>.from(json['attachments'])
          : null,
    );
  }
}

class CrownBridgeDentures {
  DenturesItem? construction;
  DenturesItem? other;

  CrownBridgeDentures({this.construction, this.other});

  factory CrownBridgeDentures.fromJson(Map<String, dynamic> json) {
    return CrownBridgeDentures(
      construction: json['construction'] != null
          ? DenturesItem.fromJson(json['construction'])
          : null,
      other: json['other'] != null ? DenturesItem.fromJson(json['other']) : null,
    );
  }
}

class Dentures {
  DenturesConstruction? construction;
  DenturesItem? other;

  Dentures({this.construction, this.other});

  factory Dentures.fromJson(Map<String, dynamic> json) {
    return Dentures(
      construction: json['construction'] != null
          ? DenturesConstruction.fromJson(json['construction'])
          : null,
      other: json['other'] != null ? DenturesItem.fromJson(json['other']) : null,
    );
  }
}

class DenturesConstruction {
  BiteBlock? biteBlock;
  SpecialTray? specialTray;
  bool? enabled;
  List<String>? selectedOptions;
  bool? meshReinforcement;
  bool? tryIn;
  bool? reTryIn;
  bool? finish;
  List<String>? teethSelection;
  List<String>? shade;
  List<dynamic>? attachments;

  DenturesConstruction({
    this.biteBlock,
    this.specialTray,
    this.enabled,
    this.selectedOptions,
    this.meshReinforcement,
    this.tryIn,
    this.reTryIn,
    this.finish,
    this.teethSelection,
    this.shade,
    this.attachments,
  });

  factory DenturesConstruction.fromJson(Map<String, dynamic> json) {
    return DenturesConstruction(
      biteBlock: json['biteBlock'] != null
          ? BiteBlock.fromJson(json['biteBlock'])
          : null,
      specialTray: json['specialTray'] != null
          ? SpecialTray.fromJson(json['specialTray'])
          : null,
      enabled: json['enabled'],
      selectedOptions: json['selectedOptions'] != null
          ? List<String>.from(json['selectedOptions'])
          : null,
      meshReinforcement: json['meshReinforcement'],
      tryIn: json['tryIn'],
      reTryIn: json['reTryIn'],
      finish: json['finish'],
      teethSelection: json['teethSelection'] != null
          ? List<String>.from(json['teethSelection'])
          : null,
      shade: json['shade'] != null ? List<String>.from(json['shade']) : null,
      attachments: json['attachments'] != null
          ? List<dynamic>.from(json['attachments'])
          : null,
    );
  }
}

class DenturesItem {
  bool? enabled;
  List<String>? selectedOptions;
  List<String>? teethSelection;
  List<String>? shade;
  List<dynamic>? attachments;

  DenturesItem(
      {this.enabled,
        this.selectedOptions,
        this.teethSelection,
        this.shade,
        this.attachments});

  factory DenturesItem.fromJson(Map<String, dynamic> json) {
    return DenturesItem(
      enabled: json['enabled'],
      selectedOptions: json['selectedOptions'] != null
          ? List<String>.from(json['selectedOptions'])
          : null,
      teethSelection: json['teethSelection'] != null
          ? List<String>.from(json['teethSelection'])
          : null,
      shade: json['shade'] != null ? List<String>.from(json['shade']) : null,
      attachments: json['attachments'] != null
          ? List<dynamic>.from(json['attachments'])
          : null,
    );
  }
}

class BiteBlock {
  bool? upper;
  bool? lower;

  BiteBlock({this.upper, this.lower});

  factory BiteBlock.fromJson(Map<String, dynamic> json) {
    return BiteBlock(
      upper: json['upper'],
      lower: json['lower'],
    );
  }
}

class SpecialTray {
  bool? upper;
  bool? lower;

  SpecialTray({this.upper, this.lower});

  factory SpecialTray.fromJson(Map<String, dynamic> json) {
    return SpecialTray(
      upper: json['upper'],
      lower: json['lower'],
    );
  }
}

class GlobalAttachment {
  String? fileUrl;
  String? fileName;
  String? uploadedAt;
  String? id;

  GlobalAttachment({this.fileUrl, this.fileName, this.uploadedAt, this.id});

  factory GlobalAttachment.fromJson(Map<String, dynamic> json) {
    return GlobalAttachment(
      fileUrl: json['fileUrl'],
      fileName: json['fileName'],
      uploadedAt: json['uploadedAt'],
      id: json['_id'],
    );
  }
}

// ==================== Helper Functions ====================

/// Get current tier data based on selectedTier
TierData? getCurrentTierData(CaseDetailsData? caseData) {
  if (caseData == null) return null;

  if (caseData.selectedTier?.toLowerCase() == 'premium') {
    return caseData.premium;
  }
  return caseData.standard;
}

/// Get all teeth from all enabled sections
List<String> getAllTeeth(CaseDetailsData? caseData) {
  List<String> allTeeth = [];

  final tierData = getCurrentTierData(caseData);
  if (tierData == null) return allTeeth;

  // CrownBridge -> PFM
  if (tierData.crownBridge?.pfm?.singleUnitCrown?.enabled == true) {
    allTeeth.addAll(tierData.crownBridge?.pfm?.singleUnitCrown?.teeth ?? []);
  }
  if (tierData.crownBridge?.pfm?.marylandBridge?.enabled == true) {
    allTeeth.addAll(tierData.crownBridge?.pfm?.marylandBridge?.teeth ?? []);
  }
  if (tierData.crownBridge?.pfm?.conventionalBridge?.enabled == true) {
    allTeeth.addAll(tierData.crownBridge?.pfm?.conventionalBridge?.teeth ?? []);
  }

  // CrownBridge -> FullCast
  if (tierData.crownBridge?.fullCast?.singleUnitCrown?.enabled == true) {
    allTeeth.addAll(tierData.crownBridge?.fullCast?.singleUnitCrown?.teeth ?? []);
  }
  if (tierData.crownBridge?.fullCast?.bridge?.enabled == true) {
    allTeeth.addAll(tierData.crownBridge?.fullCast?.bridge?.teeth ?? []);
  }
  if (tierData.crownBridge?.fullCast?.postAndCore?.enabled == true) {
    allTeeth.addAll(tierData.crownBridge?.fullCast?.postAndCore?.teeth ?? []);
  }
  if (tierData.crownBridge?.fullCast?.conventionalBridge?.enabled == true) {
    allTeeth.addAll(tierData.crownBridge?.fullCast?.conventionalBridge?.teeth ?? []);
  }

  // CrownBridge -> MetalFree
  if (tierData.crownBridge?.metalFree?.enabled == true) {
    allTeeth.addAll(tierData.crownBridge?.metalFree?.teeth ?? []);
  }

  // CrownBridge -> Dentures
  if (tierData.crownBridge?.dentures?.construction?.enabled == true) {
    allTeeth.addAll(tierData.crownBridge?.dentures?.construction?.teethSelection ?? []);
  }
  if (tierData.crownBridge?.dentures?.other?.enabled == true) {
    allTeeth.addAll(tierData.crownBridge?.dentures?.other?.teethSelection ?? []);
  }

  // Dentures
  if (tierData.dentures?.construction?.enabled == true) {
    allTeeth.addAll(tierData.dentures?.construction?.teethSelection ?? []);
  }
  if (tierData.dentures?.other?.enabled == true) {
    allTeeth.addAll(tierData.dentures?.other?.teethSelection ?? []);
  }

  return allTeeth;
}

/// Get all shades from all enabled sections
List<String> getAllShades(CaseDetailsData? caseData) {
  List<String> allShades = [];

  final tierData = getCurrentTierData(caseData);
  if (tierData == null) return allShades;

  // CrownBridge -> PFM
  if (tierData.crownBridge?.pfm?.singleUnitCrown?.enabled == true) {
    allShades.addAll(tierData.crownBridge?.pfm?.singleUnitCrown?.shade ?? []);
  }
  if (tierData.crownBridge?.pfm?.marylandBridge?.enabled == true) {
    allShades.addAll(tierData.crownBridge?.pfm?.marylandBridge?.shade ?? []);
  }
  if (tierData.crownBridge?.pfm?.conventionalBridge?.enabled == true) {
    allShades.addAll(tierData.crownBridge?.pfm?.conventionalBridge?.shade ?? []);
  }

  // CrownBridge -> Dentures
  if (tierData.crownBridge?.dentures?.construction?.enabled == true) {
    allShades.addAll(tierData.crownBridge?.dentures?.construction?.shade ?? []);
  }
  if (tierData.crownBridge?.dentures?.other?.enabled == true) {
    allShades.addAll(tierData.crownBridge?.dentures?.other?.shade ?? []);
  }

  // Dentures
  if (tierData.dentures?.construction?.enabled == true) {
    allShades.addAll(tierData.dentures?.construction?.shade ?? []);
  }
  if (tierData.dentures?.other?.enabled == true) {
    allShades.addAll(tierData.dentures?.other?.shade ?? []);
  }

  return allShades;
}

/// Get porcelain butt margin value
String getPorcelainButtMargin(CaseDetailsData? caseData) {
  final tierData = getCurrentTierData(caseData);
  if (tierData == null) return "";

  // Check PFM -> singleUnitCrown
  if (tierData.crownBridge?.pfm?.singleUnitCrown?.enabled == true) {
    return tierData.crownBridge?.pfm?.singleUnitCrown?.porcelainButtMargin ?? "";
  }

  return "";
}

/// Get enabled Crown Bridge section name
String getEnabledCrownBridgeSection(CaseDetailsData? caseData) {
  final tierData = getCurrentTierData(caseData);
  if (tierData?.crownBridge == null) return "";

  // Check PFM sections
  if (tierData?.crownBridge?.pfm?.singleUnitCrown != null) {
    return "PFM";
  }
  if (tierData?.crownBridge?.pfm?.marylandBridge != null) {
    return "PFM";
  }
  if (tierData?.crownBridge?.pfm?.conventionalBridge!= null) {
    return "PFM";
  }

  // Check FullCast sections
  if (tierData?.crownBridge?.fullCast?.singleUnitCrown != null) {
    return "Full Cast - Single Unit Crown";
  }
  if (tierData?.crownBridge?.fullCast?.bridge != null) {
    return "Full Cast - Bridge";
  }
  if (tierData?.crownBridge?.fullCast?.postAndCore != null) {
    return "Full Cast - Post and Core";
  }
  if (tierData?.crownBridge?.fullCast?.conventionalBridge != null) {
    return "Full Cast - Conventional Bridge";
  }

  // Check MetalFree
  if (tierData?.crownBridge?.metalFree != null) {
    return "Metal Free";
  }

  // Check Dentures inside CrownBridge
  if (tierData?.crownBridge?.dentures?.construction != null) {
    return "Dentures - Construction";
  }
  if (tierData?.crownBridge?.dentures?.other != null) {
    return "Dentures - Other";
  }

  return "";
}

/// Get enabled Dentures section name
String getEnabledDenturesSection(CaseDetailsData? caseData) {
  final tierData = getCurrentTierData(caseData);
  if (tierData?.dentures == null) return "";

  if (tierData?.dentures?.construction?.enabled == true) {
    return "Construction";
  }
  if (tierData?.dentures?.other?.enabled == true) {
    return "Other";
  }

  return "";
}

/// Check if CrownBridge has any enabled section
bool hasCrownBridge(CaseDetailsData? caseData) {
  return getEnabledCrownBridgeSection(caseData).isNotEmpty;
}

/// Check if Dentures has any enabled section
bool hasDentures(CaseDetailsData? caseData) {
  return getEnabledDenturesSection(caseData).isNotEmpty;
}

/// Check if Misc exists
bool hasMisc(CaseDetailsData? caseData) {
  final tierData = getCurrentTierData(caseData);
  return tierData?.misc != null;
}

/// Get main category (CrownBridge/Dentures/Misc)
String getMainCategory(CaseDetailsData? caseData) {
  if (hasCrownBridge(caseData)) {
    return "Crown Bridge";
  }
  if (hasDentures(caseData)) {
    return "Dentures";
  }
  if (hasMisc(caseData)) {
    return "Misc";
  }
  return "";
}

/// Get PFM type (if enabled)
String getPFMType(CaseDetailsData? caseData) {
  final tierData = getCurrentTierData(caseData);
  if (tierData?.crownBridge?.pfm == null) return "";

  if (tierData?.crownBridge?.pfm?.singleUnitCrown != null) {
    return "Single Unit Crown";
  }
  if (tierData?.crownBridge?.pfm?.marylandBridge != null) {
    return "Maryland Bridge";
  }
  if (tierData?.crownBridge?.pfm?.conventionalBridge != null) {
    return "Conventional Bridge";
  }

  return "";
}