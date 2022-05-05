import 'dart:convert';

List<BrithdayModel> brithdayModelFromJson(String str) =>
    List<BrithdayModel>.from(
        json.decode(str).map((x) => BrithdayModel.fromJson(x)));

String brithdayModelToJson(List<BrithdayModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BrithdayModel {
  BrithdayModel({
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

  factory BrithdayModel.fromJson(Map<String, dynamic> json) => BrithdayModel(
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
