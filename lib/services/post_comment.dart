import 'package:intranet_movil/utils/constants.dart';
import 'package:http/http.dart' as http;

Future postComment(String token, String publicationID, String content) async {
    String url = ApiIntranetConstans.baseUrl + ApiIntranetConstans.postComment;
    final response = await http.post(Uri.parse(url), body: {
      'token': token,
      'publicationID': publicationID,
      'content': content,
    }, headers: {
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      return true;
    }
    if (response.statusCode == 422) {
      return false;
    }

    return false;
  }