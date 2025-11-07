class CaseModel {
  bool? success;
  List<CaseData>? data;
  Pagination? pagination;

  CaseModel({this.success, this.data, this.pagination});

  factory CaseModel.fromJson(Map<String, dynamic> json) => CaseModel(
    success: json['success'],
    data: (json['data'] as List?)
        ?.map((e) => CaseData.fromJson(e))
        .toList(),
    pagination: json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data?.map((e) => e.toJson()).toList(),
    'pagination': pagination?.toJson(),
  };
}

class CaseData {
  String? id;
  dynamic dentist;
  Standard? standard;
  Premium? premium;
  AdminApproval? adminApproval;
  String? status;
  String? createdAt;
  List<GlobalAttachment>? globalAttachments;
  String? caseType;
  String? gender;
  int? age;
  String? patientID;
  String? selectedTier;
  String? description;
  bool? isArchived;

  CaseData({
    this.id,
    this.dentist,
    this.standard,
    this.premium,
    this.adminApproval,
    this.status,
    this.createdAt,
    this.globalAttachments,
    this.caseType,
    this.gender,
    this.age,
    this.patientID,
    this.selectedTier,
    this.description,
    this.isArchived,
  });

  factory CaseData.fromJson(Map<String, dynamic> json) => CaseData(
    id: json['_id'],
    dentist: json['dentist'],
    standard: json['standard'] != null
        ? Standard.fromJson(json['standard'])
        : null,
    premium:
    json['premium'] != null ? Premium.fromJson(json['premium']) : null,
    adminApproval: json['adminApproval'] != null
        ? AdminApproval.fromJson(json['adminApproval'])
        : null,
    status: json['status'],
    createdAt: json['createdAt'],
    globalAttachments: (json['globalAttachments'] as List?)
        ?.map((e) => GlobalAttachment.fromJson(e))
        .toList(),
    caseType: json['caseType'],
    gender: json['gender'],
    age: json['age'],
    patientID: json['patientID'],
    selectedTier: json['selectedTier'],
    description: json['description'],
    isArchived: json['isArchived'],
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'dentist': dentist,
    'standard': standard?.toJson(),
    'premium': premium?.toJson(),
    'adminApproval': adminApproval?.toJson(),
    'status': status,
    'createdAt': createdAt,
    'globalAttachments':
    globalAttachments?.map((e) => e.toJson()).toList(),
    'caseType': caseType,
    'gender': gender,
    'age': age,
    'patientID': patientID,
    'selectedTier': selectedTier,
    'description': description,
    'isArchived': isArchived,
  };
}

class Standard {
  Map<String, dynamic>? crownBridge;
  Map<String, dynamic>? dentures;
  dynamic misc;

  Standard({this.crownBridge, this.dentures, this.misc});

  factory Standard.fromJson(Map<String, dynamic> json) => Standard(
    crownBridge: json['CrownBridge'],
    dentures: json['Dentures'],
    misc: json['Misc'],
  );

  Map<String, dynamic> toJson() => {
    'CrownBridge': crownBridge,
    'Dentures': dentures,
    'Misc': misc,
  };
}

class Premium {
  Map<String, dynamic>? crownBridge;
  Map<String, dynamic>? dentures;
  Map<String, dynamic>? implants;
  Map<String, dynamic>? orthodontic;
  Map<String, dynamic>? misc;

  Premium({
    this.crownBridge,
    this.dentures,
    this.implants,
    this.orthodontic,
    this.misc,
  });

  factory Premium.fromJson(Map<String, dynamic> json) => Premium(
    crownBridge: json['CrownBridge'],
    dentures: json['dentures'],
    implants: json['implants'],
    orthodontic: json['orthodontic'],
    misc: json['misc'],
  );

  Map<String, dynamic> toJson() => {
    'CrownBridge': crownBridge,
    'dentures': dentures,
    'implants': implants,
    'orthodontic': orthodontic,
    'misc': misc,
  };
}

class AdminApproval {
  String? status;
  String? approvedAt;

  AdminApproval({this.status, this.approvedAt});

  factory AdminApproval.fromJson(Map<String, dynamic> json) => AdminApproval(
    status: json['status'],
    approvedAt: json['approvedAt'],
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'approvedAt': approvedAt,
  };
}

class GlobalAttachment {
  String? fileUrl;
  String? fileName;
  String? uploadedAt;
  String? id;

  GlobalAttachment({this.fileUrl, this.fileName, this.uploadedAt, this.id});

  factory GlobalAttachment.fromJson(Map<String, dynamic> json) =>
      GlobalAttachment(
        fileUrl: json['fileUrl'],
        fileName: json['fileName'],
        uploadedAt: json['uploadedAt'],
        id: json['_id'],
      );

  Map<String, dynamic> toJson() => {
    'fileUrl': fileUrl,
    'fileName': fileName,
    'uploadedAt': uploadedAt,
    '_id': id,
  };
}

class ClinicId {
  String? id;
  String? name;
  String? email;

  ClinicId({this.id, this.name, this.email});

  factory ClinicId.fromJson(Map<String, dynamic> json) => ClinicId(
    id: json['_id'],
    name: json['name'],
    email: json['email'],
  );

  Map<String, dynamic> toJson() => {'_id': id, 'name': name, 'email': email};
}

class Pagination {
  int? currentPage;
  int? totalPages;
  int? totalItems;
  int? itemsPerPage;

  Pagination({this.currentPage, this.totalPages, this.totalItems, this.itemsPerPage});

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    currentPage: json['currentPage'],
    totalPages: json['totalPages'],
    totalItems: json['totalItems'],
    itemsPerPage: json['itemsPerPage'],
  );

  Map<String, dynamic> toJson() => {
    'currentPage': currentPage,
    'totalPages': totalPages,
    'totalItems': totalItems,
    'itemsPerPage': itemsPerPage,
  };
}
