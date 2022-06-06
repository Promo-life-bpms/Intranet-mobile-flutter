import 'package:flutter/material.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:intranet_movil/views/request/widget/successful_alert_dialog.dart';
import 'package:intranet_movil/views/request/widget/wrong_alert_dialog.dart';


 Future postRequest(
      String token,
      String typeRequest,
      String payment,
      String start,
      String daysToSend,
      String reason,
      String daysAvailables,
      BuildContext context) async {
    String url =
        ApiIntranetConstans.baseUrl + ApiIntranetConstans.postRequestEndpoint;
    final response = await http.post(Uri.parse(url), body: {
      'token': token,
      'typeRequest': typeRequest,
      'payment': payment,
      'start': start,
      'days': daysToSend,
      'reason': reason,
      'daysAvailables': daysAvailables,
    }, headers: {
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      SuccessfulAlertDialog.showAlertDialog(context);
     
      return true;
    }

    if (response.statusCode == 500) {
      WrongAlertDialog.showAlertDialog(context);
      return false;
    }
    return false;
  }