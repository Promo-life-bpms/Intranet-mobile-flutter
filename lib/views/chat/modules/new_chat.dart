import 'package:flutter/material.dart';
import 'package:intranet_movil/model/conversation.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NewChatUserPage extends StatefulWidget {
  const NewChatUserPage({Key? key, required this.conversationUserID, required this.userID})
      : super(key: key);

  final int conversationUserID;
  final int userID ;

  @override
  _NewChatUserPageState createState() => _NewChatUserPageState();
}

class _NewChatUserPageState extends State<NewChatUserPage> {
  late String token = "";
  final _formKey = GlobalKey<FormState>();
  final message = TextEditingController();
  late List<ConversationModel> _conversationModel = [];

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

      postUserMessages(token, widget.conversationUserID.toString());
    }

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

Future postUserMessages(String token, String conversationUserID) async {
    String url = ApiIntranetConstans.baseUrl + ApiIntranetConstans.postUserMessages;
    print(url);
    final response = await http.post(Uri.parse(url), body: {
      'token': token,
      'conversationUserID': conversationUserID,
    }, headers: {
      'Accept': 'application/json',
    });
    
    print("STATUS CODE");
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      List<ConversationModel> _model = conversationModelFromJson(response.body);
      _conversationModel = _model;

      print(_model);
      return _model;
    }
   
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Prueba"),
        ),
        body: 
        Column(
          children: [
            Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              itemCount: _conversationModel.length,
              itemBuilder: (context, index) {
                return  _conversationModel[index]
                            .transmitterID.toInt() == widget.userID
                       
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                color:
                                    ColorIntranetConstants.primaryColorNormal,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Text(_conversationModel[index].message, style: const TextStyle(color:Colors.white)))
                        ],
                      )
                    :  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                              decoration: const BoxDecoration(
                                color:
                                    ColorIntranetConstants.backgroundColorDark,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Text(_conversationModel[index].message, style: const TextStyle(color:Colors.black)))
                      ],
                    );
              },
            )),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLength: 250,
                      maxLines: 1,
                      decoration: InputDecoration(
                          counterText: "",
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          hintText: 'Escribir mensaje',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16)),
                      validator: (value) => value!.isEmpty
                          ? 'Este campo no puede estar vacio'
                          : null,
                      controller: message,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (message.text.isNotEmpty) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      } else {
                        _formKey.currentState!.validate();
                      }
                    },
                    icon: const Icon(Icons.send))
              ],
            )
           
          ],
        ));
  }
}
