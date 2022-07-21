import 'dart:convert';

List<DirectoryModel> directoryModelFromJson(String str) =>
    List<DirectoryModel>.from(json.decode(str).map((x) => DirectoryModel.fromJson(x)));

String directoryModelToJson(List<DirectoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class DirectoryModel {
  DirectoryModel({
      required this.id,
      required this.fullname,
      required this.email,
      required this.photo, 
      required this.department,
      required this.position,
      required this.onlineStatus,
      required this.data
  });

  int id;
  String fullname;
  String email;
  String photo; 
  String department;
  String position;
  bool onlineStatus;
  List<Data> data;

  factory DirectoryModel.fromJson(Map<String, dynamic> json) => DirectoryModel(
        id: json["id"],
        fullname: json["fullname"],
        email: json["email"],
        photo: json["photo"], 
        department: json["department"],
        position: json["position"],
        onlineStatus: json["onlineStatus"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),

      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "email": email,
        "photo": photo, 
        "department": department,
        "position": position,
        "onlineStatus":onlineStatus,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
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