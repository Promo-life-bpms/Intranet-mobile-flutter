import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/model/message.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/views/chat/widget/user_chat_card.dart';

class UserChatBuilder extends StatefulWidget {
  const UserChatBuilder({Key? key, required this.directoryData, required this.messageData, required this.userModelData})
      : super(key: key);
  final List<DirectoryModel> directoryData;
  final List<MessageModel> messageData;
  final List<UserModel> userModelData;


  @override
  State<UserChatBuilder> createState() =>
      _UserChatBuilderState();
}

class _UserChatBuilderState extends State<UserChatBuilder> {
   @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 16, right: 16),
        itemCount: widget.directoryData.length,
        itemBuilder: (context, index) {
          return UserChatCard(userData: [
            DirectoryModel(
                id: widget.directoryData[index].id,
                fullname: widget.directoryData[index].fullname,
                email: widget.directoryData[index].email,
                photo: widget.directoryData[index].photo,
                department: widget.directoryData[index].department,
                position: widget.directoryData[index].position,
                onlineStatus: widget.directoryData[index].onlineStatus)
          ],messageData: widget.messageData,
          userModelData: widget.userModelData);
        },
      ),
    );
  }
}
