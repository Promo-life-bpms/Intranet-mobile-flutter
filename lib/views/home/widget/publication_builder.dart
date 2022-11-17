import 'package:flutter/material.dart';
import 'package:intranet_movil/model/publication.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/views/home/widget/publication.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class PublicationBuilder extends StatefulWidget {
  const PublicationBuilder(
      {Key? key,
      required this.publicationData,
      required this.publicationToLikeData,
      required this.userData,
      required this.isLike,
      required this.token,
      required this.mainContext})
      : super(key: key);
  final List<PublicationModel> publicationData;
  final List<PublicationModel> publicationToLikeData;
  final List<UserModel> userData;
  final bool isLike;
  final String token;
  final BuildContext mainContext;
  @override
  State<PublicationBuilder> createState() => _PublicationBuilderState();
}

class _PublicationBuilderState extends State<PublicationBuilder> {
  final ScrollController _controller = ScrollController();

  bool _isLoading = false;
  int range = 4;

  Future incrementData() async {
    setState(() {
      _isLoading = true;
    });
    if (range <= widget.publicationData.length) {
      setState(() {
        range = range + range;
      });
    } else {
      setState(() {
        range = widget.publicationData.length;
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LazyLoadScrollView(
          isLoading: _isLoading,
          scrollOffset: 0,
          onEndOfPage: () => incrementData(),
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            itemCount: widget.publicationData.getRange(0, range).length,
            itemBuilder: (context, index) {
              return PublicationContainer(
                publicationData: [
                  PublicationModel(
                    id: widget.publicationData[index].id,
                    userId: widget.publicationData[index].userId,
                    photo: widget.publicationData[index].photo,
                    userName: widget.publicationData[index].userName,
                    created: widget.publicationData[index].created,
                    contentPublication:
                        widget.publicationData[index].contentPublication,
                    photoPublication:
                        widget.publicationData[index].photoPublication,
                    likes: widget.publicationData[index].likes,
                    isLike: widget.publicationData[index].isLike,
                    comments: widget.publicationData[index].comments,
                  )
                ],
                publicationToLikeData: [
                  PublicationModel(
                      id: widget.publicationToLikeData[index].id,
                      userId: widget.publicationToLikeData[index].userId,
                      photo: widget.publicationToLikeData[index].photo,
                      userName: widget.publicationToLikeData[index].userName,
                      created: widget.publicationToLikeData[index].created,
                      contentPublication: widget
                          .publicationToLikeData[index].contentPublication,
                      photoPublication:
                          widget.publicationToLikeData[index].photoPublication,
                      likes: widget.publicationToLikeData[index].likes,
                      isLike: widget.publicationToLikeData[index].isLike,
                      comments: widget.publicationToLikeData[index].comments)
                ],
                token: widget.token,
                userlModelData: widget.userData,
                mainContext: widget.mainContext,
                contentPublication: '',
              );
            },
          ),
        ),
      ],
    );
  }
}
