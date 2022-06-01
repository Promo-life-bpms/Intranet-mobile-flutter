import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:intranet_movil/model/employee_profile.dart';
import 'package:intranet_movil/utils/constants.dart';

class ApiEmployeeProfileService {
  Future<List<EmployeeProfileModel>?> getEmployeeProfile(String data) async {
    try {
      var url = Uri.parse(ApiIntranetConstans.baseUrl + ApiIntranetConstans.getEmployeeProfile+data);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<EmployeeProfileModel> _model = employeeProfileModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
