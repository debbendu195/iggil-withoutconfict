class AboutModel {
  final String? id;
  final String? aboutUs;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AboutModel({
    this.id,
    this.aboutUs,
    this.createdAt,
    this.updatedAt,
  });

  factory AboutModel.fromJson(Map<String, dynamic> json) {
    return AboutModel(
      id: json['_id'],
      aboutUs: json['aboutUs'] ?? json['content'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'aboutUs': aboutUs,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}