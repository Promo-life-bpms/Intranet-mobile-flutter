  
import 'package:intranet_movil/utils/constants.dart';
import 'package:http/http.dart' as http;

Future postConversation(String token, String receiverID, String message) async {
    String url =
        ApiIntranetConstans.baseUrl + ApiIntranetConstans.postConversation;
    final response = await http.post(Uri.parse(url), body: {
      'token': token,
      'receiverID': receiverID,
      'message': message,
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