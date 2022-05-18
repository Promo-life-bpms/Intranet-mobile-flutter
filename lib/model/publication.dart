import 'dart:convert';

List<PublicationModel> publicationModelFromJson(String str) =>
    List<PublicationModel>.from(
        json.decode(str).map((x) => PublicationModel.fromJson(x)));

String publicationModelToJson(List<PublicationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PublicationModel {
  PublicationModel({
    required this.id,
    required this.photo,
    required this.userName,
    required this.created,
    required this.contentPublication,
    required this.photoPublication,
    required this.likes,
 
  });

  int id;
  String photo;
  String userName;
  String created;
  String contentPublication;
  String photoPublication;
  int likes;
 
  factory PublicationModel.fromJson(Map<String, dynamic> json) =>
      PublicationModel(
        id: json["id"],
        photo: json["photo"],
        userName: json["userName"],
        created: json["created"],
        contentPublication: json["contentPublication"],
        photoPublication: json["photoPublication"],
        likes: json["likes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photo": photo,
        "userName": userName,
        "created": created,
        "contentPublication": contentPublication,
        "photoPublication": photoPublication,
        "likes": likes,
      };
}
