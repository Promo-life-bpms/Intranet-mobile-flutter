import 'dart:convert';

List<RequestModel> requestModelFromJson(String str) =>
    List<RequestModel>.from(json.decode(str).map((x) => RequestModel.fromJson(x)));

String requestModelToJson(List<RequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestModel {
  RequestModel({
    required this.id,
    required this.employeeID,
    required this.typeRequest, 
    required this.payment,
    required this.start,
    required this.end,
    required this.directManagerId,
    required this.directManagerStatus,
    required this.humanResourcesStatus, 
    required this.visible,  
    required this.days, 
    });

  int id;
  int employeeID;
  String typeRequest;
  String payment;
  String start;
  String end;
  int directManagerId;
  String directManagerStatus;
  String humanResourcesStatus;
  int visible; 
  String days; 


  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        id: json["id"],
        employeeID: json["employeeID"],
        typeRequest: json["typeRequest"],
        payment: json["payment"],
        start: json["start"],
        end: json["end"],
        directManagerId: json["directManagerId"],
        directManagerStatus: json["directManagerStatus"],
        humanResourcesStatus: json["humanResourcesStatus"],
        visible: json["visible"], 
        days: json["days"],  
       );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employeeID": employeeID,
        "typeRequest": typeRequest,
        "payment": payment,
        "start": start,
        "end": end,
        "directManagerId": directManagerId,
        "directManagerStatus": directManagerStatus,
        "humanResourcesStatus": humanResourcesStatus,
        "visible": visible, 
        "days": days, 
        };
}
