import 'dart:convert';

List<ManualModel> manualModelFromJson(String str) =>
    List<ManualModel>.from(json.decode(str).map((x) => ManualModel.fromJson(x)));

String manualModelToJson(List<ManualModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ManualModel {
  ManualModel({
      required this.id,
      required this.name,
      required this.file,
      /* required this.img, */
  });

  int id;
  String name;
  String file;
   /*  String img; */

  factory ManualModel.fromJson(Map<String, dynamic> json) => ManualModel(
         id: json["id"],
          name: json["name"],
          file: json["file"],
         /*  img: json["img"], */
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "file": file,
      };
}

