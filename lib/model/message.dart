import 'dart:convert';

List<MessageModel> messageModelFromJson(String str) =>
    List<MessageModel>.from(json.decode(str).map((x) => MessageModel.fromJson(x)));

String messageModelToJson(List<MessageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageModel {
  MessageModel({
    required this.id,
    required this.fullname,
    required this.email,
    required this.photo,
    required this.department,
    required this.position,
    required this.conversation,
    required this.createdAt
  });

  int id;
  String fullname;
  String email;
  String photo;
  String department;
  String position;
  String conversation;
  String createdAt;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json["id"],
        fullname: json["fullname"],
        email: json["email"],
        photo: json["photo"],
        department: json["department"],
        position: json["position"],
        conversation: json["conversation"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "email": email,
        "photo": photo,
        "department": department,
        "position": position,
        "conversation":conversation,
        "createdAt":createdAt,
      };

}

