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
  Premium? premium;
  List<GlobalAttachment>? globalAttachments;

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
    this.premium,
    this.globalAttachments,
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
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      adminApproval: json['adminApproval'] != null
          ? AdminApproval.fromJson(json['adminApproval'])
          : null,
      premium:
      json['premium'] != null ? Premium.fromJson(json['premium']) : null,
      globalAttachments: json['globalAttachments'] != null
          ? List<GlobalAttachment>.from(json['globalAttachments']
          .map((x) => GlobalAttachment.fromJson(x)))
          : [],
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

class Premium {
  CrownBridge? crownBridge;
  Dentures? dentures;

  Premium({this.crownBridge, this.dentures});

  factory Premium.fromJson(Map<String, dynamic> json) {
    return Premium(
      crownBridge: json['CrownBridge'] != null
          ? CrownBridge.fromJson(json['CrownBridge'])
          : null,
      dentures: json['dentures'] != null
          ? Dentures.fromJson(json['dentures'])
          : null,
    );
  }
}

class CrownBridge {
  Map<String, dynamic>? pfm;
  Map<String, dynamic>? fullCast;
  Map<String, dynamic>? metalFree;

  CrownBridge({this.pfm, this.fullCast, this.metalFree});

  factory CrownBridge.fromJson(Map<String, dynamic> json) {
    return CrownBridge(
      pfm: json['pfm'],
      fullCast: json['fullCast'],
      metalFree: json['metalFree'],
    );
  }
}

class Dentures {
  Map<String, dynamic>? construction;
  Map<String, dynamic>? other;

  Dentures({this.construction, this.other});

  factory Dentures.fromJson(Map<String, dynamic> json) {
    return Dentures(
      construction: json['construction'],
      other: json['other'],
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
