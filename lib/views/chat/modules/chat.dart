import 'package:flutter/material.dart';
import 'package:intranet_movil/model/conversation.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/chat/widget/my_message.dart';
import 'package:intranet_movil/views/chat/widget/other_message.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ChatUserPage extends StatefulWidget {
  const ChatUserPage({Key? key, required this.conversationUserID, required this.userID})
      : super(key: key);

  final int conversationUserID;
  final int userID ;

  @override
  _ChatUserPageState createState() => _ChatUserPageState();
}

class _ChatUserPageState extends State<ChatUserPage> {
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
  
    final response = await http.post(Uri.parse(url), body: {
      'token': token,
      'conversationUserID': conversationUserID,
    }, headers: {
      'Accept': 'application/json',
    });
    
    if (response.statusCode == 200) {
      List<ConversationModel> _model = conversationModelFromJson(response.body);
      _conversationModel = _model;

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
                return  _conversationModel[index].transmitterID.toInt() == widget.userID 
                    ?  MyMessageItem(conversation: _conversationModel[index].message)
                    :  OtherMessageItem(conversation: _conversationModel[index].message);
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
