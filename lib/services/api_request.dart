import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:intranet_movil/model/request.dart';
import 'package:intranet_movil/utils/constants.dart';

class ApiRequestService {
  Future<List<RequestModel>?> getRequest(String data) async {
    try {
      var url = Uri.parse(ApiIntranetConstans.baseUrl + ApiIntranetConstans.getRequest+data);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<RequestModel> _model = requestModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
