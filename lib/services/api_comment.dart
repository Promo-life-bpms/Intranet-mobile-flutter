import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:intranet_movil/model/comment.dart';

import 'package:intranet_movil/utils/constants.dart';

class ApiCommentService {
  Future<List<CommentModel>?> getComment(String data) async {
    try {
      var url = Uri.parse(
          ApiIntranetConstans.baseUrl + ApiIntranetConstans.getComment+data);
          print(url);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<CommentModel> _model = commentModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
