  import 'dart:convert';

  List<Post> postFromJson(String str) =>
      List<Post>.from(json.decode(str).map((x) => Post.fromMap(x)));

  class Post {
    Post({
      required this.id,
      required this.name,
      required this.file,
      required this.img,
      required this.created_at,
      required this.updated_at,
    
    });

    int id;
    String name;
    String file;
    String img;
    String created_at;
    String updated_at;
    
    factory Post.fromMap(Map<String, dynamic> json) => Post(
          id: json["id"],
          name: json["name"],
          file: json["file"],
          img: json["img"],
          created_at: json["created_at"],
          updated_at: json["updated_at"],
        );
  } 
  

