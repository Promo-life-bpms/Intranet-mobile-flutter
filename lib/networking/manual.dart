import 'dart:convert';
import 'package:intranet_movil/model/manual.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> fetchManual() async {
  final response =
      await http.get(Uri.parse('https://intranet.kaths.com.mx/api/manuals'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Post>((json) => Post.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load manual');
  }
}  
