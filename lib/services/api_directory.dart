import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/utils/constants.dart';


class ApiDirectoryService {
  Future<List<DirectoryModel>?> getDirectory() async {
    try {
      var url = Uri.parse(ApiIntranetConstans.baseUrl + ApiIntranetConstans.directoryEndponit);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<DirectoryModel> _model = directoryModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}