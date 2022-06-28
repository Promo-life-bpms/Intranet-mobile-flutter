import 'package:flutter/material.dart';
import 'package:intranet_movil/model/message.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/chat/modules/chat.dart';

class MessageChatCard extends StatefulWidget {
  const MessageChatCard({Key? key,required this.messageData , required this.userID, required this.conversationUserID, required this.conversationUserName}) : super(key: key);
  final List<MessageModel> messageData;
  final int userID;
  final int conversationUserID;
  final String conversationUserName;


  @override
  State<MessageChatCard> createState() => _MessageChatCardState();
}

class _MessageChatCardState extends State<MessageChatCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatUserPage(
          conversationUserID: widget.conversationUserID, 
          userID: widget.userID, 
          conversationUserName: widget.conversationUserName)),
      );
      },
      child: widget.messageData[0].conversation=="no data" || (widget.conversationUserID == widget.userID)?
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
                    Flexible(
                      child: Text(widget.messageData[0].conversation,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12.00,
                          )),
                    ),
                    Flexible(
                      child: Text(widget.messageData[0].time,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12.00,
                          )),
                    ),
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
