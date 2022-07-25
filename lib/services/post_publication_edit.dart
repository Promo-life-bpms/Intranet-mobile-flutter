import 'package:intranet_movil/utils/constants.dart';
import 'package:http/http.dart' as http;

Future postPublicationEdit(String token, String publicationID, String contentPublication ) async {
  String url =
      ApiIntranetConstans.baseUrl + ApiIntranetConstans.postEditPublication;
  final response = await http.post(Uri.parse(url), body: {
    'token': token,
    'publicationID': publicationID,
    'contentPublication':contentPublication
  }, headers: {
    'Accept': 'application/json',
  });
  print("REQUEST STATUS");
  print(response.statusCode);

  print(response.body);
  if (response.statusCode == 200) {
    return true;
  }
  if (response.statusCode == 500) {
    return false;
  }
}
