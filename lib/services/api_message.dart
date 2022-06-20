import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:intranet_movil/model/message.dart';
import 'package:intranet_movil/utils/constants.dart';

class ApiMessageService {
  Future<List<MessageModel>?> getMessages(String data) async {
    try {
      var url = Uri.parse(
          ApiIntranetConstans.baseUrl + ApiIntranetConstans.getUserMessages+data);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<MessageModel> _model = messageModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
