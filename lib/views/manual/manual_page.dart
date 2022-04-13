import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intranet_movil/model/manual.dart';
/* import 'package:intranet_movil/networking/manual.dart'; */
import 'package:http/http.dart' as http;

Future<List<Post>> getManuals() async{
  final response =
      await http.get(Uri.parse('https://intranet.kaths.com.mx/api/manuals'));

    if (response.statusCode == 200) {
 
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Post>((json) => Post.fromMap(json)).toList();

    } else {
      throw Exception('Failed to load manual');
    }
  }
void main() => runApp(ManualPage());

class ManualPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ManualPage> {
  late Future<List<Post>> futurePost ;

  @override
  void initState() {
    super.initState();
    futurePost = getManuals();
  
  /*   log('data: $futurePost'); */
   /*  print(futurePost); */
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: FutureBuilder(
          future: futurePost,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              print(snapshot);
              return Text("Hola");
            }else if(snapshot.hasError){
              print(snapshot.error);
              return Text("Adios");
            }

            return const Center(
              child:  CircularProgressIndicator(),
            );
          } ,
        ),
      ),
    );
  }
}
 