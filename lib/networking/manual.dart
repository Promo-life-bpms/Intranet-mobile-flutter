import 'dart:convert';
import 'package:intranet_movil/model/manual.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> fetchManual() async {
  final response =
      await http.get(Uri.parse('https://intranet.kaths.com.mx/api/manuals'));

  if (response.statusCode == 200) {
  /*   print(response.body); */
    final parsed = json.decode(response.body);
  /*   print(parsed); */
    return parsed; 
    
  } else {
    throw Exception('Failed to load manual');
  }
}  
