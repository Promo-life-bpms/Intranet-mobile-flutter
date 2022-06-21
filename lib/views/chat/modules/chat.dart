import 'package:flutter/material.dart';
import 'package:intranet_movil/model/message.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatUserPage extends StatefulWidget {
  const ChatUserPage({Key? key, required this.messageModel, required this.userData})
      : super(key: key);

  final List<MessageModel> messageModel;
  final List<UserModel> userData;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatUserPage> {
  late String token = "";
  final _formKey = GlobalKey<FormState>();
  final message = TextEditingController();

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.messageModel[0].fullname),
        ),
        body: 
        Column(
          children: [
            Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              itemCount: widget.messageModel[0].conversation.length,
              itemBuilder: (context, index) {
                return  widget.messageModel[0].conversation[index]
                            .transmitterID == widget.userData[0].id
                       
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
                              child: Text(widget.messageModel[0]
                                  .conversation[index].message, style: const TextStyle(color:Colors.white)))
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
                              child: Text(widget.messageModel[0]
                                  .conversation[index].message, style: const TextStyle(color:Colors.black)))
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
