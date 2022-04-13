/* import 'dart:async';
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
  */

import 'package:flutter/material.dart';
import 'package:intranet_movil/model/manual.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/services/api_manual.dart';
import 'package:intranet_movil/services/api_service.dart';


class ManualPage extends StatefulWidget {
  const ManualPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ManualPage> {
  late List<ManualModel>? _manualModel = [];
  
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _manualModel = (await ApiManualService().getManual())!.cast<ManualModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: _manualModel == null || _manualModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _manualModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_manualModel![index].id.toString()),
                          Text(_manualModel![index].name),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_manualModel![index].name),
                          Text(_manualModel![index].name),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
