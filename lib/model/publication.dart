import 'dart:convert';

List<PublicationModel> publicationModelFromJson(String str) =>
    List<PublicationModel>.from(
        json.decode(str).map((x) => PublicationModel.fromJson(x)));

String publicationModelToJson(List<PublicationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Comments commentFromJson(String str) => Comments.fromJson(json.decode(str));

String commentToJson(Comments data) => json.encode(data.toJson());


PhotoPublication photoPublicationFromJson(String str) => PhotoPublication.fromJson(json.decode(str));

String photoPublicationToJson(PhotoPublication data) => json.encode(data.toJson());


class PublicationModel {
  PublicationModel({
    required this.id,
    required this.userId,
    required this.photo,
    required this.userName,
    required this.created,
    required this.contentPublication,
    required this.photoPublication,
    required this.likes,
    required this.isLike,
    required this.comments,
  });

  int id;
  int userId;
  String photo;
  String userName;
  String created;
  String contentPublication;
  List<PhotoPublication>photoPublication;
  int likes;
  bool isLike;
  List<Comments> comments;
 
  factory PublicationModel.fromJson(Map<String, dynamic> json) =>
      PublicationModel(
        id: json["id"],
        userId: json["userId"],
        photo: json["photo"],
        userName: json["userName"],
        created: json["created"],
        contentPublication: json["contentPublication"],   
        photoPublication: List<PhotoPublication>.from(json["photoPublication"].map((x) => PhotoPublication.fromJson(x))),
        likes: json["likes"],
        isLike: json["isLike"],
        comments: List<Comments>.from(json["comments"].map((x) => Comments.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId":userId,
        "photo": photo,
        "userName": userName,
        "created": created,
        "contentPublication": contentPublication,
        "photoPublication": List<dynamic>.from(photoPublication.map((x) => x.toJson())),
        "likes": likes,
        "isLike":isLike,
        "comments":List<dynamic>.from(comments.map((x) => x.toJson())),
      };
}


class PhotoPublication {
    String typeFile;
    String resource;

    PhotoPublication({
        required this.typeFile,
        required this.resource,
    });

    factory PhotoPublication.fromJson(Map<String, dynamic> json) => PhotoPublication(
        typeFile: json["typeFile"],
        resource: json["resource"],
    );

    Map<String, dynamic> toJson() => {
        "typeFile": typeFile,
        "content": resource ,
   };
}


class Comments {
    int id;
    String userName;
    String photo;
    String content;

    Comments({
        required this.id,
        required this.userName,
        required this.photo,
        required this.content,
    });

    factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        id: json["id"],
        userName: json["userName"],
        photo: json["photo"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "photo": photo,
        "content": content ,
   };
}