import 'dart:convert';

List<ApprovedRequestModel> approveRequestModelFromJson(String str) =>
    List<ApprovedRequestModel>.from(json.decode(str).map((x) => ApprovedRequestModel.fromJson(x)));

String approveRequestModelToJson(List<ApprovedRequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApprovedRequestModel {
  ApprovedRequestModel({
    required this.id,
    required this.employeeID,
    required this.fullname,
    required this.typeRequest, 
    required this.revealName,
    required this.payment,
    required this.start,
    required this.end,
    required this.reason,
    required this.directManagerId,
    required this.directManagerStatus,
    required this.humanResourcesStatus, 
    required this.visible,  
    required this.days, 
    });

  int id;
  int employeeID;
  String fullname;
  String typeRequest;
  String revealName;
  String payment;
  String start;
  String end;
  String reason;
  int directManagerId;
  String directManagerStatus;
  String humanResourcesStatus;
  int visible; 
  String days; 

  factory ApprovedRequestModel.fromJson(Map<String, dynamic> json) => ApprovedRequestModel(
        id: json["id"],
        employeeID: json["employeeID"],
        fullname: json["fullname"],
        typeRequest: json["typeRequest"],
        revealName: json["revealName"],
        payment: json["payment"],
        start: json["start"],
        end: json["end"],
        reason: json["reason"],
        directManagerId: json["directManagerId"],
        directManagerStatus: json["directManagerStatus"],
        humanResourcesStatus: json["humanResourcesStatus"],
        visible: json["visible"], 
        days: json["days"],  
       );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employeeID": employeeID,
        "fullname": fullname, 
        "typeRequest": typeRequest,
        "revealName":revealName,
        "payment": payment,
        "start": start,
        "end": end,
        "reason": reason,
        "directManagerId": directManagerId,
        "directManagerStatus": directManagerStatus,
        "humanResourcesStatus": humanResourcesStatus,
        "visible": visible, 
        "days": days, 
        };
}
