import 'package:flutter/material.dart';
import 'package:intranet_movil/model/publication.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/widget/containers/publications.dart';

class PublicationBuilder extends StatefulWidget {
  const PublicationBuilder(
      {Key? key,
      required this.publicationData,
      required this.userData,
      required this.isLike,
      required this.token})
      : super(key: key);
  final List<PublicationModel> publicationData;
  final List<UserModel> userData;
  final bool isLike;
  final String token;

  @override
  State<PublicationBuilder> createState() => _PublicationBuilderState();
}

class _PublicationBuilderState extends State<PublicationBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          itemCount: widget.publicationData.length,
          itemBuilder: (context, index) {
            return PublicationContainer(publicationData: [
              PublicationModel(
                  id: widget.publicationData[index].id,
                  photo: widget.publicationData[index].photo,
                  userName: widget.publicationData[index].userName,
                  created: widget.publicationData[index].created,
                  contentPublication:
                      widget.publicationData[index].contentPublication,
                  photoPublication:
                      widget.publicationData[index].photoPublication,
                  likes: widget.publicationData[index].likes,
                  isLike: widget.isLike,
                  comments: widget.publicationData[index].comments)
            ], publicationToLikeData: [
              PublicationModel(
                  id: widget.publicationData[index].id,
                  photo: widget.publicationData[index].photo,
                  userName: widget.publicationData[index].userName,
                  created: widget.publicationData[index].created,
                  contentPublication:
                      widget.publicationData[index].contentPublication,
                  photoPublication:
                      widget.publicationData[index].photoPublication,
                  likes: widget.publicationData[index].likes,
                  isLike: widget.isLike,
                  comments: widget.publicationData[index].comments)
            ], token: widget.token, userlModelData: widget.userData);
          },
        ),
      ],
    );
  }
}
