import 'package:flutter/material.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CreatePostPage> {
  late String token = "";
 
  final _formKey = GlobalKey<FormState>();
  final _contentPublication = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final prefs = await SharedPreferences.getInstance();
    String? _token = prefs.getString('token');
    if (_token != null || _token!.isNotEmpty) {
      token = _token;
    }
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crear publicación'),
        ),
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '¿Qué estas pensando?',
                    ),
                    maxLines: 4,
                    controller: _contentPublication,
                  ),
                  ElevatedButton(
                      onPressed: () => {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(token.toString()),
                            )),
                            postPublication(
                                token,
                                _contentPublication.text.toString()),
                          },
                      child: Text("Publicar")),
                ],
              ),
            )));
  }

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
}