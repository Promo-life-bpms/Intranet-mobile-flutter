import 'dart:convert';

List<CommentModel> commentModelFromJson(String str) =>
    List<CommentModel>.from(
        json.decode(str).map((x) => CommentModel.fromJson(x)));

String commentModelToJson(List<CommentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentModel {
  CommentModel({
    required this.id,
/*     required this.photo, */
  /*   required this.userName, */
    required this.content,
  });

  int id;
 /*  String photo;
  String userName; */
  String content;

 
  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      CommentModel(
        id: json["id"],
  /*       photo: json["photo"],
        userName: json["userName"], */
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
 /*        "photo": photo,
        "userName": userName, */
        "created": content,
      };
}
