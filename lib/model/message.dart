import 'dart:convert';

List<MessageModel> messageModelFromJson(String str) =>
    List<MessageModel>.from(json.decode(str).map((x) => MessageModel.fromJson(x)));

String messageModelToJson(List<MessageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Conversation commentFromJson(String str) => Conversation.fromJson(json.decode(str));

String commentToJson(Conversation data) => json.encode(data.toJson());

class MessageModel {
  MessageModel({
    required this.id,
    required this.fullname,
    required this.email,
    required this.photo,
    required this.department,
    required this.position,
    required this.conversation,
  });

  int id;
  String fullname;
  String email;
  String photo;
  String department;
  String position;
  List<Conversation> conversation;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json["id"],
        fullname: json["fullname"],
        email: json["email"],
        photo: json["photo"],
        department: json["department"],
        position: json["position"],
        conversation: List<Conversation>.from(json["conversation"].map((x) => Conversation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "email": email,
        "photo": photo,
        "department": department,
        "position": position,
        "conversation":List<dynamic>.from(conversation.map((x) => x.toJson())),
      };
}

class Conversation {
    int id;
    int transmitterID;
    int receiverID;
    String message;

    Conversation({
        required this.id,
        required this.transmitterID,
        required this.receiverID,
        required this.message,
    });

    factory Conversation.fromJson(Map<String, dynamic> json) => Conversation(
        id: json["id"],
        transmitterID: json["transmitterID"],
        receiverID: json["receiverID"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "transmitterID": transmitterID,
        "receiverID": receiverID,
        "message": message,
   };
}
