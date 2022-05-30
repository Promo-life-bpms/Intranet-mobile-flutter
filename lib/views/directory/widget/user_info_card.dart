// This is a Custom TextField Widget
import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/widget/alerts/user_card_alert_dialog.dart';

class UserInfoCard extends StatefulWidget {
  const UserInfoCard({Key? key, required this.userData}) : super(key: key);

  final List<DirectoryModel> userData;

  @override
  State<UserInfoCard> createState() => _UserInfoCardCardState();
}

class _UserInfoCardCardState extends State<UserInfoCard> {
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
          UserCardAlertDialog.showFullDialog(
              context,
              widget.userData[0].fullname.toString(),
              widget.userData[0].email,
              ApiIntranetConstans.baseUrl + widget.userData[0].photo,
              widget.userData[0].department,
              widget.userData[0].position);
        },
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 24.0),
                child: SizedBox(
                    width: 50,
                    height: 50,
                    child: widget.userData[0].photo == "img/default_user.png"
                        ? const CircleAvatar(
                            backgroundColor:
                                ColorIntranetConstants.backgroundColorNormal,
                          )
                        : /* ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(48), // Image radius
                              child: Image.network(
                                ApiIntranetConstans.baseUrl +
                                    widget.userData[0].photo.toString(),
                                fit: BoxFit.cover,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return const CircleAvatar(
                                    backgroundColor: ColorIntranetConstants
                                        .backgroundColorNormal,
                                  );
                                },
                              ),
                            ),
                          ) */

                     CircleAvatar(
                      backgroundImage: NetworkImage(ApiIntranetConstans.baseUrl +
                        widget.userData[0].photo.toString()),
                        backgroundColor: ColorIntranetConstants.backgroundColorNormal,
                        
                      ) 
                    )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.userData[0].fullname,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16.00,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 8)),
                Text(widget.userData[0].position,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12.00,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
