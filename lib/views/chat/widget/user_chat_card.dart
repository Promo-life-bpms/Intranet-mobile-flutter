import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/model/message.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/chat/modules/chat.dart';

class UserChatCard extends StatefulWidget {
  const UserChatCard({Key? key, required this.userData, required this.messageData, required this.userModelData}) : super(key: key);

  final List<DirectoryModel> userData;
  final List<MessageModel> messageData;
  final List<UserModel> userModelData;

  @override
  State<UserChatCard> createState() => _UserChatCardState();
}

class _UserChatCardState extends State<UserChatCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var userMessages = widget.messageData.where((i) => i.id == widget.userData[0].id).toList();

        if(userMessages.isEmpty){

        }else{
          Navigator.of(context)
                   .push(MaterialPageRoute(builder: (context) =>  ChatUserPage(messageModel: widget.messageData.where((i) => i.id == widget.userData[0].id).toList(), userData: widget.userModelData) ) );
        }

      },
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: 8.0),
              child: SizedBox(
                width: 50,
                height: 50,
                child: widget.userData[0].photo == "img/default_user.png"
                    ? Badge(
                        toAnimate: true,
                        position: BadgePosition.bottomEnd(),
                        badgeColor: widget.userData[0].onlineStatus == true?
                            Colors.green
                            :Colors.red,
                        child: const CircleAvatar(
                          backgroundColor:
                              ColorIntranetConstants.backgroundColorNormal,
                        ),
                      )
                    : Badge(
                        toAnimate: true,
                        position: BadgePosition.bottomEnd(),
                        badgeColor: widget.userData[0].onlineStatus == true?
                            Colors.green
                            :Colors.red,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              ApiIntranetConstans.baseUrl +
                                  widget.userData[0].photo.toString()),
                          backgroundColor:
                              ColorIntranetConstants.backgroundColorNormal,
                        ),
                      ),
              )),
              const Padding(padding: EdgeInsets.only(left: 20)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.userData[0].fullname,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 16.00,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 8)),
                Text(widget.userData[0].position,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12.00,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
