import 'package:intranet_movil/utils/constants.dart';
import 'package:http/http.dart' as http;

Future postPublicationDelete(String token, String publciationID) async {
  String url =
  
   ApiIntranetConstans.baseUrl + ApiIntranetConstans.postDeletePublication;
  final response = await http.post(Uri.parse(url), body: {
    'token': token,
    'publciationID': publciationID
  }, headers: {
    'Accept': 'application/json',
  });

  print("statussssssss");
  print(response.body);
  if (response.statusCode == 200) {
    return true;
  }
  if (response.statusCode == 500) {
    return false;
  }
}
