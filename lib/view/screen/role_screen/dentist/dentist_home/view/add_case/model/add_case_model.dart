import 'dart:convert';

// Helper function to parse the JSON string
CaseListResponseModel caseListResponseModelFromJson(String str) =>
    CaseListResponseModel.fromJson(json.decode(str));

// Helper function to encode the model to a JSON string
String caseListResponseModelToJson(CaseListResponseModel data) =>
    json.encode(data.toJson());

class CaseListResponseModel {
  final bool? success;
  final List<CaseData>? data;
  final Pagination? pagination;

  CaseListResponseModel({
    this.success,
    this.data,
    this.pagination,
  });

  factory CaseListResponseModel.fromJson(Map<String, dynamic> json) =>
      CaseListResponseModel(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<CaseData>.from(
            json["data"]!.map((x) => CaseData.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class CaseData {
  final StandardData? standard;
  final PremiumData? premium;
  final AdminApproval? adminApproval;
  final String? id;
  final String? caseType;
  final String? gender;
  final int? age;
  final String? patientID;
  final String? selectedTier;
  final String? description;
  final String? status;
  final bool? isArchived;
  final List<GlobalAttachment>? globalAttachments;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final ClinicId? clinicId; // ✅ JSON data onujayi eta object
  final String? createdBy;
  final dynamic assignedTo;

  CaseData({
    this.standard,
    this.premium,
    this.adminApproval,
    this.id,
    this.caseType,
    this.gender,
    this.age,
    this.patientID,
    this.selectedTier,
    this.description,
    this.status,
    this.isArchived,
    this.globalAttachments,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.clinicId,
    this.createdBy,
    this.assignedTo,
  });

  factory CaseData.fromJson(Map<String, dynamic> json) => CaseData(
    standard: json["standard"] == null
        ? null
        : StandardData.fromJson(json["standard"]),
    premium: json["premium"] == null
        ? null
        : PremiumData.fromJson(json["premium"]),
    adminApproval: json["adminApproval"] == null
        ? null
        : AdminApproval.fromJson(json["adminApproval"]),
    id: json["_id"],
    caseType: json["caseType"],
    gender: json["gender"],
    age: json["age"],
    patientID: json["patientID"],
    selectedTier: json["selectedTier"],
    description: json["description"],
    status: json["status"],
    isArchived: json["isArchived"],
    globalAttachments: json["globalAttachments"] == null
        ? []
        : List<GlobalAttachment>.from(json["globalAttachments"]!
        .map((x) => GlobalAttachment.fromJson(x))),
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    clinicId: json["clinicId"] == null || json["clinicId"] is! Map // ✅ Fix
        ? null
        : ClinicId.fromJson(json["clinicId"]),
    createdBy: json["createdBy"],
    assignedTo: json["assignedTo"],
  );

  Map<String, dynamic> toJson() => {
    "standard": standard?.toJson(),
    "premium": premium?.toJson(),
    "adminApproval": adminApproval?.toJson(),
    "_id": id,
    "caseType": caseType,
    "gender": gender,
    "age": age,
    "patientID": patientID,
    "selectedTier": selectedTier,
    "description": description,
    "status": status,
    "isArchived": isArchived,
    "globalAttachments": globalAttachments == null
        ? []
        : List<dynamic>.from(globalAttachments!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "clinicId": clinicId?.toJson(),
    "createdBy": createdBy,
    "assignedTo": assignedTo,
  };
}

class AdminApproval {
  final String? status;
  final DateTime? approvedAt;

  AdminApproval({
    this.status,
    this.approvedAt,
  });

  factory AdminApproval.fromJson(Map<String, dynamic> json) => AdminApproval(
    status: json["status"],
    approvedAt: json["approvedAt"] == null
        ? null
        : DateTime.parse(json["approvedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "approvedAt": approvedAt?.toIso8601String(),
  };
}

class ClinicId {
  final String? id;
  final String? name;
  final String? email;

  ClinicId({
    this.id,
    this.name,
    this.email,
  });

  factory ClinicId.fromJson(Map<String, dynamic> json) => ClinicId(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
  };
}

class GlobalAttachment {
  final String? fileUrl;
  final String? fileName;
  final DateTime? uploadedAt;
  final String? id;

  GlobalAttachment({
    this.fileUrl,
    this.fileName,
    this.uploadedAt,
    this.id,
  });

  factory GlobalAttachment.fromJson(Map<String, dynamic> json) =>
      GlobalAttachment(
        fileUrl: json["fileUrl"],
        fileName: json["fileName"],
        uploadedAt: json["uploadedAt"] == null
            ? null
            : DateTime.parse(json["uploadedAt"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
    "fileUrl": fileUrl,
    "fileName": fileName,
    "uploadedAt": uploadedAt?.toIso8601String(),
    "_id": id,
  };
}

class PremiumData {
  final PremiumCrownBridge? crownBridge;
  final PremiumDentures? dentures;
  final Implants? implants;
  final Orthodontic? orthodontic;
  final PremiumMisc? misc;

  PremiumData({
    this.crownBridge,
    this.dentures,
    this.implants,
    this.orthodontic,
    this.misc,
  });

  factory PremiumData.fromJson(Map<String, dynamic> json) => PremiumData(
    crownBridge: json["crownBridge"] == null
        ? null
        : PremiumCrownBridge.fromJson(json["crownBridge"]),
    dentures: json["dentures"] == null
        ? null
        : PremiumDentures.fromJson(json["dentures"]),
    implants: json["implants"] == null
        ? null
        : Implants.fromJson(json["implants"]),
    orthodontic: json["orthodontic"] == null
        ? null
        : Orthodontic.fromJson(json["orthodontic"]),
    misc: json["misc"] == null ? null : PremiumMisc.fromJson(json["misc"]),
  );

  Map<String, dynamic> toJson() => {
    "crownBridge": crownBridge?.toJson(),
    "dentures": dentures?.toJson(),
    "implants": implants?.toJson(),
    "orthodontic": orthodontic?.toJson(),
    "misc": misc?.toJson(),
  };
}

class PremiumCrownBridge {
  final Emax? emax;
  final Zirconia? zirconia;
  final MetalFree? metalFree;

  PremiumCrownBridge({
    this.emax,
    this.zirconia,
    this.metalFree,
  });

  factory PremiumCrownBridge.fromJson(Map<String, dynamic> json) =>
      PremiumCrownBridge(
        emax: json["emax"] == null ? null : Emax.fromJson(json["emax"]),
        zirconia: json["zirconia"] == null
            ? null
            : Zirconia.fromJson(json["zirconia"]),
        metalFree: json["metalFree"] == null
            ? null
            : MetalFree.fromJson(json["metalFree"]),
      );

  Map<String, dynamic> toJson() => {
    "emax": emax?.toJson(),
    "zirconia": zirconia?.toJson(),
    "metalFree": metalFree?.toJson(),
  };
}

class Emax {
  final List<dynamic>? teeth;
  final List<dynamic>? attachments;

  Emax({
    this.teeth,
    this.attachments,
  });

  factory Emax.fromJson(Map<String, dynamic> json) => Emax(
    teeth: json["teeth"] == null
        ? []
        : List<dynamic>.from(json["teeth"]!.map((x) => x)),
    attachments: json["attachments"] == null
        ? []
        : List<dynamic>.from(json["attachments"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "teeth": teeth == null ? [] : List<dynamic>.from(teeth!.map((x) => x)),
    "attachments": attachments == null
        ? []
        : List<dynamic>.from(attachments!.map((x) => x)),
  };
}

class MetalFree {
  final List<dynamic>? teeth;
  final List<dynamic>? attachments;

  MetalFree({
    this.teeth,
    this.attachments,
  });

  factory MetalFree.fromJson(Map<String, dynamic> json) => MetalFree(
    teeth: json["teeth"] == null
        ? []
        : List<dynamic>.from(json["teeth"]!.map((x) => x)),
    attachments: json["attachments"] == null
        ? []
        : List<dynamic>.from(json["attachments"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "teeth": teeth == null ? [] : List<dynamic>.from(teeth!.map((x) => x)),
    "attachments": attachments == null
        ? []
        : List<dynamic>.from(attachments!.map((x) => x)),
  };
}

class Zirconia {
  final List<dynamic>? teeth;
  final List<dynamic>? attachments;

  Zirconia({
    this.teeth,
    this.attachments,
  });

  factory Zirconia.fromJson(Map<String, dynamic> json) => Zirconia(
    teeth: json["teeth"] == null
        ? []
        : List<dynamic>.from(json["teeth"]!.map((x) => x)),
    attachments: json["attachments"] == null
        ? []
        : List<dynamic>.from(json["attachments"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "teeth": teeth == null ? [] : List<dynamic>.from(teeth!.map((x) => x)),
    "attachments": attachments == null
        ? []
        : List<dynamic>.from(attachments!.map((x) => x)),
  };
}

class PremiumDentures {
  final Construction? construction;
  final Other? other;

  PremiumDentures({
    this.construction,
    this.other,
  });

  factory PremiumDentures.fromJson(Map<String, dynamic> json) =>
      PremiumDentures(
        construction: json["construction"] == null
            ? null
            : Construction.fromJson(json["construction"]),
        other: json["other"] == null ? null : Other.fromJson(json["other"]),
      );

  Map<String, dynamic> toJson() => {
    "construction": construction?.toJson(),
    "other": other?.toJson(),
  };
}

class Construction {
  final List<dynamic>? selectedOptions;
  final List<dynamic>? teethSelection;
  final List<dynamic>? attachments;

  Construction({
    this.selectedOptions,
    this.teethSelection,
    this.attachments,
  });

  factory Construction.fromJson(Map<String, dynamic> json) => Construction(
    selectedOptions: json["selectedOptions"] == null
        ? []
        : List<dynamic>.from(json["selectedOptions"]!.map((x) => x)),
    teethSelection: json["teethSelection"] == null
        ? []
        : List<dynamic>.from(json["teethSelection"]!.map((x) => x)),
    attachments: json["attachments"] == null
        ? []
        : List<dynamic>.from(json["attachments"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "selectedOptions": selectedOptions == null
        ? []
        : List<dynamic>.from(selectedOptions!.map((x) => x)),
    "teethSelection": teethSelection == null
        ? []
        : List<dynamic>.from(teethSelection!.map((x) => x)),
    "attachments": attachments == null
        ? []
        : List<dynamic>.from(attachments!.map((x) => x)),
  };
}

class Other {
  final bool? enabled;
  final List<dynamic>? teethSelection;
  final List<dynamic>? attachments;
  final List<dynamic>? selectedOptions;

  Other({
    this.enabled,
    this.teethSelection,
    this.attachments,
    this.selectedOptions,
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
    enabled: json["enabled"],
    teethSelection: json["teethSelection"] == null
        ? []
        : List<dynamic>.from(json["teethSelection"]!.map((x) => x)),
    attachments: json["attachments"] == null
        ? []
        : List<dynamic>.from(json["attachments"]!.map((x) => x)),
    selectedOptions: json["selectedOptions"] == null
        ? []
        : List<dynamic>.from(json["selectedOptions"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "enabled": enabled,
    "teethSelection": teethSelection == null
        ? []
        : List<dynamic>.from(teethSelection!.map((x) => x)),
    "attachments": attachments == null
        ? []
        : List<dynamic>.from(attachments!.map((x) => x)),
    "selectedOptions": selectedOptions == null
        ? []
        : List<dynamic>.from(selectedOptions!.map((x) => x)),
  };
}

class Implants {
  final List<dynamic>? attachments;

  Implants({
    this.attachments,
  });

  factory Implants.fromJson(Map<String, dynamic> json) => Implants(
    attachments: json["attachments"] == null
        ? []
        : List<dynamic>.from(json["attachments"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "attachments": attachments == null
        ? []
        : List<dynamic>.from(attachments!.map((x) => x)),
  };
}

class PremiumMisc {
  final StudyModels? studyModels;
  final List<dynamic>? attachments;

  PremiumMisc({
    this.studyModels,
    this.attachments,
  });

  factory PremiumMisc.fromJson(Map<String, dynamic> json) => PremiumMisc(
    studyModels: json["studyModels"] == null
        ? null
        : StudyModels.fromJson(json["studyModels"]),
    attachments: json["attachments"] == null
        ? []
        : List<dynamic>.from(json["attachments"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "studyModels": studyModels?.toJson(),
    "attachments": attachments == null
        ? []
        : List<dynamic>.from(attachments!.map((x) => x)),
  };
}

class StudyModels {
  final List<dynamic>? selectedTeeth;

  StudyModels({
    this.selectedTeeth,
  });

  factory StudyModels.fromJson(Map<String, dynamic> json) => StudyModels(
    selectedTeeth: json["selectedTeeth"] == null
        ? []
        : List<dynamic>.from(json["selectedTeeth"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "selectedTeeth": selectedTeeth == null
        ? []
        : List<dynamic>.from(selectedTeeth!.map((x) => x)),
  };
}

class Orthodontic {
  final List<dynamic>? attachments;

  Orthodontic({
    this.attachments,
  });

  factory Orthodontic.fromJson(Map<String, dynamic> json) => Orthodontic(
    attachments: json["attachments"] == null
        ? []
        : List<dynamic>.from(json["attachments"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "attachments": attachments == null
        ? []
        : List<dynamic>.from(attachments!.map((x) => x)),
  };
}

class StandardData {
  final StandardCrownBridge? crownBridge;
  final StandardDentures? dentures;
  final dynamic misc;

  StandardData({
    this.crownBridge,
    this.dentures,
    this.misc,
  });

  factory StandardData.fromJson(Map<String, dynamic> json) => StandardData(
    crownBridge: json["CrownBridge"] == null
        ? null
        : StandardCrownBridge.fromJson(json["CrownBridge"]),
    dentures: json["Dentures"] == null
        ? null
        : StandardDentures.fromJson(json["Dentures"]),
    misc: json["Misc"],
  );

  Map<String, dynamic> toJson() => {
    "CrownBridge": crownBridge?.toJson(),
    "Dentures": dentures?.toJson(),
    "Misc": misc,
  };
}

class StandardCrownBridge {
  final Pfm? pfm;
  final FullCast? fullCast;
  final MetalFree? metalFree;
  final StandardCrownBridgeDentures? dentures;

  StandardCrownBridge({
    this.pfm,
    this.fullCast,
    this.metalFree,
    this.dentures,
  });

  factory StandardCrownBridge.fromJson(Map<String, dynamic> json) =>
      StandardCrownBridge(
        pfm: json["pfm"] == null ? null : Pfm.fromJson(json["pfm"]),
        fullCast: json["fullCast"] == null
            ? null
            : FullCast.fromJson(json["fullCast"]),
        metalFree: json["metalFree"] == null
            ? null
            : MetalFree.fromJson(json["metalFree"]),
        dentures: json["dentures"] == null
            ? null
            : StandardCrownBridgeDentures.fromJson(json["dentures"]),
      );

  Map<String, dynamic> toJson() => {
    "pfm": pfm?.toJson(),
    "fullCast": fullCast?.toJson(),
    "metalFree": metalFree?.toJson(),
    "dentures": dentures?.toJson(),
  };
}

class StandardCrownBridgeDentures {
  final Construction? construction;
  final Other? other;

  StandardCrownBridgeDentures({
    this.construction,
    this.other,
  });

  factory StandardCrownBridgeDentures.fromJson(Map<String, dynamic> json) =>
      StandardCrownBridgeDentures(
        construction: json["construction"] == null
            ? null
            : Construction.fromJson(json["construction"]),
        other: json["other"] == null ? null : Other.fromJson(json["other"]),
      );

  Map<String, dynamic> toJson() => {
    "construction": construction?.toJson(),
    "other": other?.toJson(),
  };
}

class FullCast {
  final Bridge? singleUnitCrown;
  final Bridge? bridge;
  final Bridge? postAndCore;
  final Bridge? conventionalBridge;

  FullCast({
    this.singleUnitCrown,
    this.bridge,
    this.postAndCore,
    this.conventionalBridge,
  });

  factory FullCast.fromJson(Map<String, dynamic> json) => FullCast(
    singleUnitCrown: json["singleUnitCrown"] == null
        ? null
        : Bridge.fromJson(json["singleUnitCrown"]),
    bridge: json["bridge"] == null ? null : Bridge.fromJson(json["bridge"]),
    postAndCore: json["postAndCore"] == null
        ? null
        : Bridge.fromJson(json["postAndCore"]),
    conventionalBridge: json["conventionalBridge"] == null
        ? null
        : Bridge.fromJson(json["conventionalBridge"]),
  );

  Map<String, dynamic> toJson() => {
    "singleUnitCrown": singleUnitCrown?.toJson(),
    "bridge": bridge?.toJson(),
    "postAndCore": postAndCore?.toJson(),
    "conventionalBridge": conventionalBridge?.toJson(),
  };
}

class Bridge {
  final bool? enabled;
  final List<String>? teeth;
  final List<dynamic>? attachments;

  Bridge({
    this.enabled,
    this.teeth,
    this.attachments,
  });

  factory Bridge.fromJson(Map<String, dynamic> json) => Bridge(
    enabled: json["enabled"],
    teeth: json["teeth"] == null
        ? []
        : List<String>.from(json["teeth"]!.map((x) => x)),
    attachments: json["attachments"] == null
        ? []
        : List<dynamic>.from(json["attachments"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "enabled": enabled,
    "teeth": teeth == null ? [] : List<dynamic>.from(teeth!.map((x) => x)),
    "attachments": attachments == null
        ? []
        : List<dynamic>.from(attachments!.map((x) => x)),
  };
}

class Pfm {
  final Bridge? singleUnitCrown;
  final MarylandBridge? marylandBridge;
  final Bridge? conventionalBridge;

  Pfm({
    this.singleUnitCrown,
    this.marylandBridge,
    this.conventionalBridge,
  });

  factory Pfm.fromJson(Map<String, dynamic> json) => Pfm(
    singleUnitCrown: json["singleUnitCrown"] == null
        ? null
        : Bridge.fromJson(json["singleUnitCrown"]),
    marylandBridge: json["marylandBridge"] == null
        ? null
        : MarylandBridge.fromJson(json["marylandBridge"]),
    conventionalBridge: json["conventionalBridge"] == null
        ? null
        : Bridge.fromJson(json["conventionalBridge"]),
  );

  Map<String, dynamic> toJson() => {
    "singleUnitCrown": singleUnitCrown?.toJson(),
    "marylandBridge": marylandBridge?.toJson(),
    "conventionalBridge": conventionalBridge?.toJson(),
  };
}

class MarylandBridge {
  final bool? enabled;
  final List<dynamic>? ponticTeeth;
  final List<dynamic>? wingTeeth;
  final List<dynamic>? attachments;

  MarylandBridge({
    this.enabled,
    this.ponticTeeth,
    this.wingTeeth,
    this.attachments,
  });

  factory MarylandBridge.fromJson(Map<String, dynamic> json) => MarylandBridge(
    enabled: json["enabled"],
    ponticTeeth: json["ponticTeeth"] == null
        ? []
        : List<dynamic>.from(json["ponticTeeth"]!.map((x) => x)),
    wingTeeth: json["wingTeeth"] == null
        ? []
        : List<dynamic>.from(json["wingTeeth"]!.map((x) => x)),
    attachments: json["attachments"] == null
        ? []
        : List<dynamic>.from(json["attachments"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "enabled": enabled,
    "ponticTeeth": ponticTeeth == null
        ? []
        : List<dynamic>.from(ponticTeeth!.map((x) => x)),
    "wingTeeth": wingTeeth == null
        ? []
        : List<dynamic>.from(wingTeeth!.map((x) => x)),
    "attachments": attachments == null
        ? []
        : List<dynamic>.from(attachments!.map((x) => x)),
  };
}

class StandardDentures {
  final StandardDenturesConstruction? construction;
  final Other? other;

  StandardDentures({
    this.construction,
    this.other,
  });

  factory StandardDentures.fromJson(Map<String, dynamic> json) =>
      StandardDentures(
        construction: json["construction"] == null
            ? null
            : StandardDenturesConstruction.fromJson(json["construction"]),
        other: json["other"] == null ? null : Other.fromJson(json["other"]),
      );

  Map<String, dynamic> toJson() => {
    "construction": construction?.toJson(),
    "other": other?.toJson(),
  };
}

class StandardDenturesConstruction {
  final BiteBlock? biteBlock;
  final SpecialTray? specialTray;
  final bool? enabled;
  final List<dynamic>? selectedOptions;
  final bool? meshReinforcement;
  final bool? tryIn;
  final bool? reTryIn;
  final bool? finish;
  final List<dynamic>? teethSelection;
  final List<dynamic>? attachments;

  StandardDenturesConstruction({
    this.biteBlock,
    this.specialTray,
    this.enabled,
    this.selectedOptions,
    this.meshReinforcement,
    this.tryIn,
    this.reTryIn,
    this.finish,
    this.teethSelection,
    this.attachments,
  });

  factory StandardDenturesConstruction.fromJson(Map<String, dynamic> json) =>
      StandardDenturesConstruction(
        biteBlock: json["biteBlock"] == null
            ? null
            : BiteBlock.fromJson(json["biteBlock"]),
        specialTray: json["specialTray"] == null
            ? null
            : SpecialTray.fromJson(json["specialTray"]),
        enabled: json["enabled"],
        selectedOptions: json["selectedOptions"] == null
            ? []
            : List<dynamic>.from(json["selectedOptions"]!.map((x) => x)),
        meshReinforcement: json["meshReinforcement"],
        tryIn: json["tryIn"],
        reTryIn: json["reTryIn"],
        finish: json["finish"],
        teethSelection: json["teethSelection"] == null
            ? []
            : List<dynamic>.from(json["teethSelection"]!.map((x) => x)),
        attachments: json["attachments"] == null
            ? []
            : List<dynamic>.from(json["attachments"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "biteBlock": biteBlock?.toJson(),
    "specialTray": specialTray?.toJson(),
    "enabled": enabled,
    "selectedOptions": selectedOptions == null
        ? []
        : List<dynamic>.from(selectedOptions!.map((x) => x)),
    "meshReinforcement": meshReinforcement,
    "tryIn": tryIn,
    "reTryIn": reTryIn,
    "finish": finish,
    "teethSelection": teethSelection == null
        ? []
        : List<dynamic>.from(teethSelection!.map((x) => x)),
    "attachments": attachments == null
        ? []
        : List<dynamic>.from(attachments!.map((x) => x)),
  };
}

class BiteBlock {
  final bool? upper;
  final bool? lower;

  BiteBlock({
    this.upper,
    this.lower,
  });

  factory BiteBlock.fromJson(Map<String, dynamic> json) => BiteBlock(
    upper: json["upper"],
    lower: json["lower"],
  );

  Map<String, dynamic> toJson() => {
    "upper": upper,
    "lower": lower,
  };
}

class SpecialTray {
  final bool? upper;
  final bool? lower;

  SpecialTray({
    this.upper,
    this.lower,
  });

  factory SpecialTray.fromJson(Map<String, dynamic> json) => SpecialTray(
    upper: json["upper"],
    lower: json["lower"],
  );

  Map<String, dynamic> toJson() => {
    "upper": upper,
    "lower": lower,
  };
}

class Pagination {
  final int? currentPage;
  final int? totalPages;
  final int? totalItems;
  final int? itemsPerPage;

  Pagination({
    this.currentPage,
    this.totalPages,
    this.totalItems,
    this.itemsPerPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    currentPage: json["currentPage"],
    totalPages: json["totalPages"],
    totalItems: json["totalItems"],
    itemsPerPage: json["itemsPerPage"],
  );

  Map<String, dynamic> toJson() => {
    "currentPage": currentPage,
    "totalPages": totalPages,
    "totalItems": totalItems,
    "itemsPerPage": itemsPerPage,
  };
}
