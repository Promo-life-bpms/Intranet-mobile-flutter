import 'dart:convert';

List<ConversationModel> conversationModelFromJson(String str) =>
    List<ConversationModel>.from(
        json.decode(str).map((x) => ConversationModel.fromJson(x)));

String conversationModelToJson(List<ConversationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConversationModel {
  ConversationModel({
     required this.id,
        required this.transmitterID,
        required this.receiverID,
        required this.message,
        required this.created,
  });

  int id;
  int transmitterID;
  int receiverID;
  String message;
  String created;

  factory ConversationModel.fromJson(Map<String, dynamic> json) => ConversationModel(
      id: json["id"],
      transmitterID: json["transmitterID"],
      receiverID: json["receiverID"],
      message: json["message"],
      created: json["created"],
    );

  Map<String, dynamic> toJson() => {
      "id": id,
      "transmitterID": transmitterID,
      "receiverID": receiverID,
      "message": message,
      "created_at":created,
    };
}
