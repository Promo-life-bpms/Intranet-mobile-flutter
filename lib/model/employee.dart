import 'dart:convert';

List<MonthEmployeeModel> monthEmployeeModelFromJson(String str) =>
    List<MonthEmployeeModel>.from(
        json.decode(str).map((x) => MonthEmployeeModel.fromJson(x)));

String monthEmployeeModelToJson(List<MonthEmployeeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MonthEmployeeModel {
  MonthEmployeeModel({
    required this.id,
    required this.name,
    required this.position,
    required this.star,
    required this.photo,
  });

  int id;
  String name;
  String position;
  String star;
  String photo;

  factory MonthEmployeeModel.fromJson(Map<String, dynamic> json) =>
      MonthEmployeeModel(
        id: json["id"],
        name: json["name"],
        position: json["position"],
        star: json["star"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "star": star,
        "photo": photo,
      };
}
