import 'package:flutter/material.dart';
import 'package:intranet_movil/model/message_chat.dart';

class Message extends StatefulWidget {
  const Message({Key? key, required this.messageData, required this.userID}) : super(key: key);

  final List<MessageChatModel> messageData;
  final int userID;

  @override
  State<Message> createState() => _MessageChatState();
}

class _MessageChatState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return widget.messageData[0].message =="no data"?
        const Padding(padding: EdgeInsets.zero)
        :
        Column(
          children: [
            Text(widget.messageData[0].message)
          ],
        );
     
    
  }
}
