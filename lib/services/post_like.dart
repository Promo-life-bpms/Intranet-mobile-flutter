import 'package:intranet_movil/utils/constants.dart';
import 'package:http/http.dart' as http;

  Future postLike(String token, String publicationID) async {
    String url = ApiIntranetConstans.baseUrl + ApiIntranetConstans.postLike;
    final response = await http.post(Uri.parse(url), body: {
      'token': token,
      'publicationID': publicationID,
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