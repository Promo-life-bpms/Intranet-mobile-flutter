import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Expiration commentFromJson(String str) => Expiration.fromJson(json.decode(str));

String commentToJson(Expiration data) => json.encode(data.toJson());



class UserModel {
  UserModel({
    required this.id,
    required this.fullname,
    required this.email,
    required this.photo,
    required this.department,
    required this.position,
    required this.daysAvailables,
    required this.expiration,
  });

  int id;
  String fullname;
  String email;
  String photo;
  String department;
  String position;
  int daysAvailables;
  List<Expiration> expiration;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        fullname: json["fullname"],
        email: json["email"],
        photo: json["photo"],
        department: json["department"],
        position: json["position"],
        daysAvailables: json["daysAvailables"],
        expiration: List<Expiration>.from(json["expiration"].map((x) => Expiration.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "email": email,
        "photo": photo,
        "department": department,
        "position": position,
        "daysAvailables":daysAvailables, 
        "expiration":List<dynamic>.from(expiration.map((x) => x.toJson())),
      };
}

class Expiration {
    String daysAvailables;
    String cutoffDate;

    Expiration({
        required this.daysAvailables,
        required this.cutoffDate,
    });

    factory Expiration.fromJson(Map<String, dynamic> json) => Expiration(
        daysAvailables: json["daysAvailables"],
        cutoffDate: json["cutoffDate"],
    );

    Map<String, dynamic> toJson() => {
        "daysAvailables": daysAvailables,
        "cutoffDate": cutoffDate,
   };
}
