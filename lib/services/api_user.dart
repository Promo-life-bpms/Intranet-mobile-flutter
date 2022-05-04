import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/model/user_model.dart';


class ApiUserService {
  Future<List<UserModel>?> getUsers(String data) async {
    try {
      var url = Uri.parse(ApiIntranetConstans.baseUrl + ApiIntranetConstans.getUser+data);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
