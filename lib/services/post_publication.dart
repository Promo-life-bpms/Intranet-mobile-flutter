  
import 'package:intranet_movil/utils/constants.dart';
import 'package:http/http.dart' as http;

Future postPublication(String token, String data, String photo) async {
    String url =
        ApiIntranetConstans.baseUrl + ApiIntranetConstans.postPublication;
    final response = await http.post(Uri.parse(url), body: {
      'token': token,
      'contentPublication': data,
      'photo':photo,
    }, headers: {
      'Accept': 'application/json',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("PUBLICACION STATUS");
      
      return true;
    }
    if (response.statusCode == 422) {
      return false;
    }

    return false;
  }