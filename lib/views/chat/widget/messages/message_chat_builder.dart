import 'package:flutter/material.dart';
import 'package:intranet_movil/model/message.dart';
import 'package:intranet_movil/views/chat/widget/messages/message_chat_card.dart';

class MessageChatBuilder extends StatefulWidget {
  const MessageChatBuilder({Key? key, required this.messageData, required this.userID})
      : super(key: key);
  final List<MessageModel> messageData;
  final int userID;

  @override
  State<MessageChatBuilder> createState() =>
      _MessageChatBuilderState();
}

class _MessageChatBuilderState extends State<MessageChatBuilder> {
   @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 8, right: 16),
        itemCount: widget.messageData.length,
        itemBuilder: (context, index) {
          return MessageChatCard(messageData: [MessageModel(id: widget.messageData[index].id, fullname: widget.messageData[index].fullname, email: widget.messageData[index].email, photo: widget.messageData[index].photo, department: widget.messageData[index].department, position: widget.messageData[index].position, conversation: widget.messageData[index].conversation)],
          userID: widget.userID ,
          conversationUserID: widget.messageData[index].id);
        },
      ),
    );
  }
}
