import 'dart:convert';

TermsModel termsModelFromJson(String str) =>
    TermsModel.fromJson(json.decode(str));

String termsModelToJson(TermsModel data) => json.encode(data.toJson());

class TermsModel {
  final String? id;
  final String? description;
  final List<String>? image;
  final int? v;

  TermsModel({
    this.id,
    this.description,
    this.image,
    this.v,
  });

  TermsModel copyWith({
    String? id,
    String? description,
    List<String>? image,
    int? v,
  }) =>
      TermsModel(
        id: id ?? this.id,
        description: description ?? this.description,
        image: image ?? this.image,
        v: v ?? this.v,
      );

  factory TermsModel.fromJson(Map<String, dynamic> json) => TermsModel(
    id: json["_id"],
    description: json["description"],
    image: json["image"] == null
        ? []
        : List<String>.from(json["image"].map((x) => x)),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "description": description,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    "__v": v,
  };
}
