  
import 'package:intranet_movil/utils/constants.dart';
import 'package:http/http.dart' as http;

Future postPublication(String token, String data) async {
    String url =
        ApiIntranetConstans.baseUrl + ApiIntranetConstans.postPublication;
    final response = await http.post(Uri.parse(url), body: {
      'token': token,
      'contentPublication': data,
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