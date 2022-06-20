import 'package:flutter/material.dart';
import 'package:intranet_movil/model/message.dart';
import 'package:intranet_movil/utils/constants.dart';

class MessageChatCard extends StatefulWidget {
  const MessageChatCard({Key? key, required this.messageData}) : super(key: key);

  final List<MessageModel> messageData;

  @override
  State<MessageChatCard> createState() => _MessageChatCardState();
}

class _MessageChatCardState extends State<MessageChatCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          
        },
        child: Row(
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
                  Text(widget.messageData[0].conversation.last.message,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12.00,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
