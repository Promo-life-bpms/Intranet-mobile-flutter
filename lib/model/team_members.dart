import 'dart:convert';

List<TeamMembers> teamMembersFromJson(String str) =>
    List<TeamMembers>.from(
        json.decode(str).map((x) => TeamMembers.fromJson(x)));

String teamMembersToJson(List<TeamMembers> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TeamMembers {
  TeamMembers({
    required this.id,
    required this.fullname,
    required this.department,
  });

  int id;
  String fullname;
  int department;

  factory TeamMembers.fromJson(Map<String, dynamic> json) =>
      TeamMembers(
        id: json["id"],
        fullname: json["fullname"],
        department: json["department"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "department": department,
      };
}
