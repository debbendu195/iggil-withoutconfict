class CaseModel {
  bool? success;
  List<CaseData>? data;
  Pagination? pagination;

  CaseModel({this.success, this.data, this.pagination});

  factory CaseModel.fromJson(Map<String, dynamic> json) => CaseModel(
    success: json['success'],
    data: (json['data'] as List?)?.map((e) => CaseData.fromJson(e)).toList(),
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
  CaseType? caseType;
  Standard? standard;
  Premium? premium;
  AdminApproval? adminApproval;
  String? id;
  String? patientID;
  String? selectedTier;
  ClinicId? clinicId;
  String? status;
  String? assignedTo;
  bool? isArchived;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  int? v;

  CaseData({
    this.caseType,
    this.standard,
    this.premium,
    this.adminApproval,
    this.id,
    this.patientID,
    this.selectedTier,
    this.clinicId,
    this.status,
    this.assignedTo,
    this.isArchived,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CaseData.fromJson(Map<String, dynamic> json) => CaseData(
    caseType: json['caseType'] != null
        ? CaseType.fromJson(json['caseType'])
        : null,
    standard:
    json['standard'] != null ? Standard.fromJson(json['standard']) : null,
    premium:
    json['premium'] != null ? Premium.fromJson(json['premium']) : null,
    adminApproval: json['adminApproval'] != null
        ? AdminApproval.fromJson(json['adminApproval'])
        : null,
    id: json['_id'],
    patientID: json['patientID'],
    selectedTier: json['selectedTier'],
    clinicId: json['clinicId'] != null
        ? ClinicId.fromJson(json['clinicId'])
        : null,
    status: json['status'],
    assignedTo: json['assignedTo'],
    isArchived: json['isArchived'],
    createdBy: json['createdBy'],
    createdAt: json['createdAt'],
    updatedAt: json['updatedAt'],
    v: json['__v'],
  );

  Map<String, dynamic> toJson() => {
    'caseType': caseType?.toJson(),
    'standard': standard?.toJson(),
    'premium': premium?.toJson(),
    'adminApproval': adminApproval?.toJson(),
    '_id': id,
    'patientID': patientID,
    'selectedTier': selectedTier,
    'clinicId': clinicId?.toJson(),
    'status': status,
    'assignedTo': assignedTo,
    'isArchived': isArchived,
    'createdBy': createdBy,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    '__v': v,
  };
}

class CaseType {
  List<dynamic>? enumList;

  CaseType({this.enumList});

  factory CaseType.fromJson(Map<String, dynamic> json) =>
      CaseType(enumList: json['enum'] ?? []);

  Map<String, dynamic> toJson() => {'enum': enumList};
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
    crownBridge: json['crownBridge'],
    dentures: json['dentures'],
    implants: json['implants'],
    orthodontic: json['orthodontic'],
    misc: json['misc'],
  );

  Map<String, dynamic> toJson() => {
    'crownBridge': crownBridge,
    'dentures': dentures,
    'implants': implants,
    'orthodontic': orthodontic,
    'misc': misc,
  };
}

class AdminApproval {
  String? status;

  AdminApproval({this.status});

  factory AdminApproval.fromJson(Map<String, dynamic> json) =>
      AdminApproval(status: json['status']);

  Map<String, dynamic> toJson() => {'status': status};
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

  Map<String, dynamic> toJson() =>
      {'_id': id, 'name': name, 'email': email};
}

class Pagination {
  int? currentPage;
  int? totalPages;
  int? totalItems;
  int? itemsPerPage;

  Pagination(
      {this.currentPage, this.totalPages, this.totalItems, this.itemsPerPage});

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
