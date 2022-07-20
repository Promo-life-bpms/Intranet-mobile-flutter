import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:intranet_movil/model/team_members.dart';
import 'package:intranet_movil/utils/constants.dart';


class ApiTeamMembers {
  Future<List<TeamMembers>?> getTeamMembers(String data) async {
    try {
      var url = Uri.parse(ApiIntranetConstans.baseUrl + ApiIntranetConstans.getTeamMembers+data);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<TeamMembers> _model = teamMembersFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
