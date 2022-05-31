import 'package:flutter/material.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/home/create_post.dart';

class PublicationCard extends StatefulWidget {
  const PublicationCard({Key? key, required this.userData}) : super(key: key);

  final List<UserModel> userData;

  @override
  State<PublicationCard> createState() => _PublicationCardState();
}

class _PublicationCardState extends State<PublicationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 80,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreatePostPage()),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      ApiIntranetConstans.baseUrl + widget.userData[0].photo),
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 24)),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(115, 92, 92, 92)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      StringIntranetConstants.homeThink,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
