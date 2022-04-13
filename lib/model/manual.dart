import 'dart:convert';

List<ManualModel> manualModelFromJson(String str) =>
    List<ManualModel>.from(json.decode(str).map((x) => ManualModel.fromJson(x)));

String userModelToJson(List<ManualModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ManualModel {
  ManualModel({
      required this.id,
      required this.name,
      required this.file,
      /* required this.img, */
      required this.created_at,
      required this.updated_at,
  });

  int id;
  String name;
  String file;
   /*  String img; */
  String created_at;
  String updated_at;

  factory ManualModel.fromJson(Map<String, dynamic> json) => ManualModel(
         id: json["id"],
          name: json["name"],
          file: json["file"],
         /*  img: json["img"], */
          created_at: json["created_at"],
          updated_at: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "file": file,
        "created_at": updated_at,
        "updated_at": updated_at,
      };
}

