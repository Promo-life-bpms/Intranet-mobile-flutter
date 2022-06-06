import 'dart:convert';

List<BirthdayModel> brithdayModelFromJson(String str) =>
    List<BirthdayModel>.from(
        json.decode(str).map((x) => BirthdayModel.fromJson(x)));

String brithdayModelToJson(List<BirthdayModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BirthdayModel {
  BirthdayModel({
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

  factory BirthdayModel.fromJson(Map<String, dynamic> json) => BirthdayModel(
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
