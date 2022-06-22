import 'package:flutter/material.dart';
import 'package:intranet_movil/model/message.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/views/chat/widget/messages/message_chat_card.dart';

class MessageChatBuilder extends StatefulWidget {
  const MessageChatBuilder({Key? key, required this.messageData, required this.userData})
      : super(key: key);
  final List<MessageModel> messageData;
  final List<UserModel> userData;

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
          userData: [UserModel(id: widget.userData[0].id, fullname: widget.userData[0].fullname, email: widget.userData[0].email, photo: widget.userData[0].photo, department: widget.userData[0].department, position:widget.userData[0]. position, daysAvailables: widget.userData[0].daysAvailables, expiration: widget.userData[0].expiration)] );
        },
      ),
    );
  }
}
