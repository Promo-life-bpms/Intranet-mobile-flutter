import 'package:intranet_movil/utils/constants.dart';
import 'package:http/http.dart' as http;

Future postRequestDelete(String token, String requestID) async {
  String url =
      ApiIntranetConstans.baseUrl + ApiIntranetConstans.postRequestDelete;
  final response = await http.post(Uri.parse(url), body: {
    'token': token,
    'requestID': requestID
  }, headers: {
    'Accept': 'application/json',
  });
  if (response.statusCode == 200) {
    return true;
  }
  if (response.statusCode == 500) {
    return false;
  }
}