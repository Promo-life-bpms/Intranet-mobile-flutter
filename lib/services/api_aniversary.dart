import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:intranet_movil/model/aniversary.dart';
import 'package:intranet_movil/utils/constants.dart';

class ApiAniversaryService {
  Future<List<AniversaryModel>?> getAniversary() async {
    try {
      var url = Uri.parse(ApiIntranetConstans.baseUrl +
          ApiIntranetConstans.monthAniversaryEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<AniversaryModel> _model = aniversaryModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
