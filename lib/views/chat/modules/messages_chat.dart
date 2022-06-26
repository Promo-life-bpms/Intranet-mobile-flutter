import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intranet_movil/model/message.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/services/api_message.dart';
import 'package:intranet_movil/services/api_user.dart';
import 'package:intranet_movil/views/chat/widget/messages/message_chat_builder.dart';
import 'package:intranet_movil/widget/skeletons/list_view_company.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessagesChatPage extends StatefulWidget {
  const MessagesChatPage({Key? key}) : super(key: key);

  @override
  _MessagesChatPageState createState() => _MessagesChatPageState();
}

class _MessagesChatPageState extends State<MessagesChatPage> {

  late List<MessageModel>? _messageModel = [];
  late List<MessageModel> _messageModel2 = [];
  late List<UserModel>? _userlModel = [];
  late String token = "";
  
  @override
  void initState() {
    super.initState();
    _getData();
    }

  Stream<List<MessageModel>> _conversationStream() async* {
    while (true) {
      await Future<void>.delayed(const Duration(seconds: 5));
      
      _getData2(token);
       print("NEW DATA "+_messageModel2.length.toString());
      print("OLD DATA "+_messageModel!.length.toString());
      yield _messageModel2;
    }
  }

  void _getData() async {

    final prefs = await SharedPreferences.getInstance();
    String? _token = prefs.getString('token');
    //Asigna el token a una variable para posteriormente enviarlo en la solicitud
    if (_token != null || _token!.isNotEmpty) {
      token = _token;

      _messageModel = (await ApiMessageService().getMessages(_token.toString()))!.cast<MessageModel>();
      _userlModel = (await ApiUserService().getUsers(_token.toString()))!.cast<UserModel>();
      Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    }
    
  }

   _getData2(token) async {
   
   if(token!=null || token !=""){
      _messageModel2 = (await ApiMessageService().getMessages(token.toString()))!.cast<MessageModel>();
        Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
   }else{
      final prefs = await SharedPreferences.getInstance();
      String? _token = prefs.getString('token');
      _messageModel2 = (await ApiMessageService().getMessages(_token.toString()))!.cast<MessageModel>();
      Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
   }
    
  }

  @override
  Widget build(BuildContext context) {
    return _messageModel == null || _messageModel!.isEmpty
        ? const ListviewCompanyPage()
        : Column(
            children: [

              StreamBuilder(
              stream: _conversationStream(),
              builder:
                  (context, AsyncSnapshot<List<MessageModel>> snapshot) {
                /* Validación del status cada 5 seg */
                /*  print(snapshot.connectionState); */

                if (snapshot.hasData) {
                  print("SNAPSHOT DATA " + snapshot.data!.length.toString()); 
                    if (_messageModel2.length > _messageModel!.length) {
                      _messageModel =_messageModel2;
                      
                    }else if(_messageModel2.length == _messageModel!.length){
                       _messageModel =_messageModel2; 
                    }
                  }
              
                  return MessageChatBuilder(messageData: _messageModel!.reversed.toList(), userID: _userlModel![0].id)  ;      

                }
                /* return const Center(
                  child: CircularProgressIndicator(),
                ); */
              )
              
            ],
          );
  }
}
