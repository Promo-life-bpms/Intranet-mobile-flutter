import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:intranet_movil/model/birthday.dart';
import 'package:intranet_movil/utils/constants.dart';

class ApiBrithdayService {
  Future<List<BirthdayModel>?> getBrithday() async {
    try {
      var url = Uri.parse(ApiIntranetConstans.baseUrl +
          ApiIntranetConstans.monthBirthdayEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<BirthdayModel> _model = brithdayModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
