import 'dart:convert';

List<DirectoryModel> directoryModelFromJson(String str) =>
    List<DirectoryModel>.from(json.decode(str).map((x) => DirectoryModel.fromJson(x)));

String directoryModelToJson(List<DirectoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DirectoryModel {
  DirectoryModel({
      required this.id,
      required this.name,
      required this.lastname,
     /*  required this.photo, */
      required this.department,
      required this.position,
     /*  required this.data,  */
  });

  int id;
  String name;
  String lastname;
 /*  String photo; */
  String department;
  String position;
  /* Data data; */ 

  factory DirectoryModel.fromJson(Map<String, dynamic> json) => DirectoryModel(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
       /*  photo: json["photo"], */
        department: json["department"],
        position: json["position"],
      /*   data: Data.fromJson(json["data"]), */ 
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
       /*  "photo": photo, */
        "department": department,
        "position": position,
    /*     "data": data.toJson(),  */
      };
}


class Data{
  Data({
    required this.type,
    required this.data,
    required this.company,
  });

  String type;
  String data;
  String company;

 factory Data.fromJson(Map<String, dynamic> json) => Data(
        type: json["type"],
        data: json["data"],
        company: json["company"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "data": data,
        "company": company,
      };
}