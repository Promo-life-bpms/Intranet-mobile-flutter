import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:intranet_movil/model/employee.dart';
import 'package:intranet_movil/utils/constants.dart';

class ApiMonthEmployeeService {
  Future<List<MonthEmployeeModel>?> getMonthEmployee() async {
    try {
      var url = Uri.parse(ApiIntranetConstans.baseUrl +
          ApiIntranetConstans.monthEmployeeEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<MonthEmployeeModel> _model =
            monthEmployeeModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
