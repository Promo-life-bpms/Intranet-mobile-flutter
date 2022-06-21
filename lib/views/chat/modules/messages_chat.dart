import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intranet_movil/model/message.dart';
import 'package:intranet_movil/services/api_message.dart';
import 'package:intranet_movil/views/chat/widget/message_chat_builder.dart';
import 'package:intranet_movil/widget/skeletons/list_view_company.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessagesChatPage extends StatefulWidget {
  const MessagesChatPage({Key? key}) : super(key: key);

  @override
  _MessagesChatPageState createState() => _MessagesChatPageState();
}

class _MessagesChatPageState extends State<MessagesChatPage> {

  late List<MessageModel>? _messageModel = [];


  @override
  void initState() {
    super.initState();
    _getData();
    }

  void _getData() async {

    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
     _messageModel = (await ApiMessageService().getMessages(token.toString()))!.cast<MessageModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }
 


  @override
  Widget build(BuildContext context) {
    return _messageModel == null || _messageModel!.isEmpty
        ? const ListviewCompanyPage()
        : Column(
            children: [
                MessageChatBuilder(messageData: _messageModel!.reversed.toList())        
            ],
          );
  }
}
