import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:intranet_movil/model/communique.dart';
import 'package:intranet_movil/utils/constants.dart';


class ApiCommuniqueService {
  Future<List<CommuniqueModel>?> getCommunique() async {
    try {
      var url = Uri.parse(ApiIntranetConstans.baseUrl + ApiIntranetConstans.communicateEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<CommuniqueModel> _model = communiqueModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
