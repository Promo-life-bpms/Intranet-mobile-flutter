import 'package:flutter/material.dart';
import 'package:intranet_movil/model/conversation.dart';
import 'package:intranet_movil/services/post_conversation.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/chat/chat_page.dart';
import 'package:intranet_movil/views/chat/widget/my_message.dart';
import 'package:intranet_movil/views/chat/widget/other_message.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ChatUserPage extends StatefulWidget {
  const ChatUserPage(
      {Key? key, required this.conversationUserID, required this.userID, required this.conversationUserName })
      : super(key: key);

  final int conversationUserID;
  final int userID;
  final String conversationUserName;

  @override
  _ChatUserPageState createState() => _ChatUserPageState();
}

class _ChatUserPageState extends State<ChatUserPage> {
  late String token = "";
  final _formKey = GlobalKey<FormState>();
  final message = TextEditingController();
  late List<ConversationModel> _conversationModel = [];


  final ScrollController _scrollController =  ScrollController();

  @override
  void initState() {
    super.initState();
     _getData();
        
  }

  Stream<List<ConversationModel>> _chat() async* {

    while(true){
      
      await Future<void>.delayed(const Duration(seconds: 3));
      List<ConversationModel> chatStream =[ConversationModel(id: 1, transmitterID: 1, receiverID: 1, message: "message", created: "created")];
      yield chatStream;
    }

  }



   _getData() async {
    final prefs = await SharedPreferences.getInstance();
    String? _token = prefs.getString('token');
    if (_token != null || _token!.isNotEmpty) {
      token = _token;

      postUserMessages(token, widget.conversationUserID.toString());
    }

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  Future postUserMessages(String token, String conversationUserID) async {
    String url =
        ApiIntranetConstans.baseUrl + ApiIntranetConstans.postUserMessages;

    final response = await http.post(Uri.parse(url), body: {
      'token': token,
      'conversationUserID': conversationUserID,
    }, headers: {
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      List<ConversationModel> _model = conversationModelFromJson(response.body);
      _conversationModel = _model;

      setState(() {
        _scrollController.animateTo(
            _scrollController.position.viewportDimension +_scrollController.position.viewportDimension,
            curve: Curves.linear,
            duration: const Duration(milliseconds: 400),
          );
      });
      

      return _model;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ChatPage()))),
          title: Text(widget.conversationUserName),
        ),
        body: Padding(
        padding: const EdgeInsets.all(30),
        child: StreamBuilder(
          stream: _chat(),
          builder: (context, AsyncSnapshot<List<ConversationModel>> snapshot) {
         
            if (snapshot.hasData) {
              _conversationModel.add(ConversationModel(id: snapshot.data!.last.id, transmitterID: snapshot.data!.last.transmitterID, receiverID: snapshot.data!.last.receiverID, message: snapshot.data!.last.message, created: snapshot.data!.last.created));
       
              return ListView.builder(
                itemCount: _conversationModel.length,
                itemBuilder: (context, index) {
                      //Primero validamos si es de tipo emisor o receptor
                      return _conversationModel[index].transmitterID.toInt() == widget.userID ? 
                          MyMessageItem(
                              conversation: _conversationModel[index].message, 
                              created: _conversationModel[index].created,)
                          : 
                          OtherMessageItem(
                              conversation: _conversationModel[index].message,
                              created: _conversationModel[index].created,);
                    },
              );
            }
            return const LinearProgressIndicator();
          },
        ),
      ),/* Column(
          children: [
            _conversationModel.length == 1 &&
                    _conversationModel[0].created == "no data"
                ? Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: Text(StringIntranetConstants.emptyChat+ widget.conversationUserName, 
                        textAlign: TextAlign.center,style: const TextStyle(fontSize: 14, height: 1.5),),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                    controller: _scrollController,
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    itemCount: _conversationModel.length,
                    itemBuilder: (context, index) {
                      //Primero validamos si es de tipo emisor o receptor
                      return _conversationModel[index].transmitterID.toInt() == widget.userID ? 
                          MyMessageItem(
                              conversation: _conversationModel[index].message, 
                              created: _conversationModel[index].created,)
                          : 
                          OtherMessageItem(
                              conversation: _conversationModel[index].message,
                              created: _conversationModel[index].created,);
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
                        setState(() {
                          final now = DateTime.now();
                          postConversation(token, widget.conversationUserID.toString(), message.text);

                          _conversationModel.add(ConversationModel(
                              id: widget.userID,
                              transmitterID: widget.userID,
                              receiverID: widget.conversationUserID,
                              message: message.text,
                              created: "${now.hour}:${now.minute }"));

                          message.clear();

                             _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent ,
                              curve: Curves.easeOut,
                              duration: const Duration(milliseconds: 300),
                            );
                        
                         
                        });
                      } else {
                        _formKey.currentState!.validate();
                      }
                    },
                    icon: const Icon(Icons.send))
              ],
            )
          ],
        ) */);
  }
}
