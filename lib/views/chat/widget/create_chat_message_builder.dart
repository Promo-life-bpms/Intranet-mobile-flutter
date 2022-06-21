import 'package:flutter/material.dart';
import 'package:intranet_movil/model/message.dart';
import 'package:intranet_movil/model/message_chat.dart';
import 'package:intranet_movil/views/chat/widget/create_chat_message.dart';

class MessageBuilder extends StatefulWidget {
  const MessageBuilder({Key? key, required this.messageData, required this.userID})
      : super(key: key);
  final List<Conversation> messageData;
  final int userID;

  @override
  State<MessageBuilder> createState() =>
      _MessageBuilderState();
}

class _MessageBuilderState extends State<MessageBuilder> {


   @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 8, right: 16),
      itemCount: widget.messageData.length,
      itemBuilder: (context, index) {
        return Message(messageData: [MessageChatModel(widget.messageData[index].id, widget.messageData[index].transmitterID,widget.messageData[index].receiverID, widget.messageData[index].message, widget.messageData[index].created)], userID: widget.userID );
      },
    );
  }
}
