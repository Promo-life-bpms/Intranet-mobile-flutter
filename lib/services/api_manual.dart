import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:intranet_movil/model/manual.dart';
import 'package:intranet_movil/utils/constants.dart';


class ApiManualService {
  Future<List<ManualModel>?> getManual() async {
    try {
      var url = Uri.parse(ApiIntranetConstans.baseUrl + ApiIntranetConstans.manualEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<ManualModel> _model = manualModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
