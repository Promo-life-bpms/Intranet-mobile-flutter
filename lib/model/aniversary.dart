import 'dart:convert';

List<AniversaryModel> aniversaryModelFromJson(String str) =>
    List<AniversaryModel>.from(
        json.decode(str).map((x) => AniversaryModel.fromJson(x)));

String aniversaryModelToJson(List<AniversaryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AniversaryModel {
  AniversaryModel({
    required this.id,
    required this.name,
    required this.lastname,
    required this.photo,
    required this.date,
  });

  int id;
  String name;
  String lastname;
  String photo;
  String date;

  factory AniversaryModel.fromJson(Map<String, dynamic> json) =>
      AniversaryModel(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        photo: json["photo"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "photo": photo,
        "date": date,
      };
}
