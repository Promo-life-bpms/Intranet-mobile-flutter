import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:intranet_movil/model/approve_request.dart';
import 'package:intranet_movil/utils/constants.dart';

class ApiRhRequestService {
  Future<List<ApprovedRequestModel>?> getRhRequest() async {
    try {
      var url = Uri.parse(ApiIntranetConstans.baseUrl + ApiIntranetConstans.getRhRequest);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<ApprovedRequestModel> _model = approveRequestModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
