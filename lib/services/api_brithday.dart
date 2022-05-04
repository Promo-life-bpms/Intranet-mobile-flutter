import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:intranet_movil/model/brithday.dart';
import 'package:intranet_movil/utils/constants.dart';

class ApiBrithdayService {
  Future<List<BrithdayModel>?> getBrithday() async {
    try {
      var url = Uri.parse(ApiIntranetConstans.baseUrl +
          ApiIntranetConstans.monthBirthdayEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<BrithdayModel> _model = brithdayModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
