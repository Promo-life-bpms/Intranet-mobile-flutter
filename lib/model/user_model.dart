import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.id,
    required this.fullname,
    required this.email,
    required this.photo,
    required this.department,
    required this.position,
    required this.daysAvailables,
  });

  int id;
  String fullname;
  String email;
  String photo;
  String department;
  String position;
  int daysAvailables;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        fullname: json["fullname"],
        email: json["email"],
        photo: json["photo"],
        department: json["department"],
        position: json["position"],
        daysAvailables: json["daysAvailables"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "email": email,
        "photo": photo,
        "department": department,
        "position": position,
        "daysAvailables":daysAvailables, 
      };
}


