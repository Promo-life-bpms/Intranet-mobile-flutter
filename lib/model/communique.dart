import 'dart:convert';

List<CommuniqueModel> communiqueModelFromJson(String str) =>
    List<CommuniqueModel>.from(json.decode(str).map((x) => CommuniqueModel.fromJson(x)));

String communiqueModelToJson(List<CommuniqueModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommuniqueModel {
  CommuniqueModel({
      required this.id,
      required this.title,
      required this.image,
      required this.description, 
  });

  int id;
  String title;
  String image;
  String description;

  factory CommuniqueModel.fromJson(Map<String, dynamic> json) => CommuniqueModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        description: json["description"], 
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "description": description,
      };
}

