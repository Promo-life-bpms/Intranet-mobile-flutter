import 'package:flutter/material.dart';
import 'package:intranet_movil/model/message.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/chat/modules/chat.dart';

class MessageChatCard extends StatefulWidget {
  const MessageChatCard({Key? key, required this.messageData, required this.userData}) : super(key: key);

  final List<MessageModel> messageData;
  final List<UserModel> userData;

  @override
  State<MessageChatCard> createState() => _MessageChatCardState();
}

class _MessageChatCardState extends State<MessageChatCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       
        Navigator.of(context)
                   .push(MaterialPageRoute(builder: (context) =>  ChatUserPage(messageModel: widget.messageData, userData: widget.userData)));
       
      },
      child: widget.messageData[0].conversation.last.created=="no data"?
          const Padding(padding: EdgeInsets.zero)
          :
        Row(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: 16.0),
              child: SizedBox(
                width: 50,
                height: 50,
                child: widget.messageData[0].photo == "img/default_user.png"?
                      const CircleAvatar(
                          backgroundColor:
                              ColorIntranetConstants.backgroundColorNormal,
                        )
                    : CircleAvatar(
                          backgroundImage: NetworkImage(
                              ApiIntranetConstans.baseUrl +
                                  widget.messageData[0].photo.toString()),
                          backgroundColor:
                              ColorIntranetConstants.backgroundColorNormal,
                        ),
              )),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.messageData[0].fullname,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 16.00,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.messageData[0].conversation.last.message,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12.00,
                        )),
                    Text(widget.messageData[0].conversation.last.created,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12.00,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
