import 'dart:convert';

List<EmployeeProfileModel> employeeProfileModelFromJson(String str) =>
    List<EmployeeProfileModel>.from(json.decode(str).map((x) => EmployeeProfileModel.fromJson(x)));

String employeeProfileModelToJson(List<EmployeeProfileModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeProfileModel {
  EmployeeProfileModel({
    required this.id,
    required this.fullname,
    required this.email,
    required this.photo,
    required this.department,
    required this.position,
  });

  int id;
  String fullname;
  String email;
  String photo;
  String department;
  String position;

  factory EmployeeProfileModel.fromJson(Map<String, dynamic> json) => EmployeeProfileModel(
        id: json["id"],
        fullname: json["fullname"],
        email: json["email"],
        photo: json["photo"],
        department: json["department"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "email": email,
        "photo": photo,
        "department": department,
        "position": position,
      };
}


