import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:intranet_movil/model/publication.dart';

import 'package:intranet_movil/utils/constants.dart';

class ApiPublicationService {
  Future<List<PublicationModel>?> getPublication(String data) async {
    try {
      var url = Uri.parse(
          ApiIntranetConstans.baseUrl + ApiIntranetConstans.getPublication+data);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<PublicationModel> _model = publicationModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
