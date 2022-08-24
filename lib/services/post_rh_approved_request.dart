import 'package:flutter/material.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:http/http.dart' as http;

 Future postRhApprovedRequest(String requestID, String responseRequest, BuildContext context) async {
    String url = ApiIntranetConstans.baseUrl + ApiIntranetConstans.postRhRequest;
    final response = await http.post(Uri.parse(url), body: {
      'requestID': requestID,
      'responseRequest': responseRequest,
    }, headers: {
      'Accept': 'application/json',
    });
    
    if (response.statusCode == 200) {
        ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(
          content: Text("Solicitud actualizada correctamente")));
     
      return true;
    }

    if (response.statusCode == 500) {
       ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(
          content: Text("Ocurrio un error durante la actualización")));
      return false;
    }
    return false;
  }
