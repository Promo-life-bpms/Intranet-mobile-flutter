// This is a Custom TextField Widget
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intranet_movil/model/publication.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:http/http.dart' as http;

class PublicationContainer extends StatefulWidget {
  const PublicationContainer(
      {Key? key,
      required this.publicationData,
      required this.publicationToLikeData,
      required this.token,
      required this.userlModelData})
      : super(key: key);

  final List<PublicationModel> publicationData;
  final List<PublicationModel> publicationToLikeData;
  final String token;
  final List<UserModel> userlModelData;

  @override
  State<PublicationContainer> createState() => _PublicationContainerState();
}

class _PublicationContainerState extends State<PublicationContainer> {
  late List<PublicationModel> publicationToLikeData = widget.publicationData;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 16, top: 16, bottom: 0, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            ApiIntranetConstans.baseUrl +
                                widget.publicationData[0].photo),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 16)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.publicationData[0].userName,
                          style: const TextStyle(
                            fontSize: 12.00,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0, top: 4),
                          child: Text(widget.publicationData[0].created,
                              style: const TextStyle(fontSize: 10.00),
                              textAlign: TextAlign.left),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
                  child: Text(
                    widget.publicationData[0].contentPublication,
                    style: const TextStyle(
                      fontSize: 12.00,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
          widget.publicationData[0].photoPublication == "sin foto" ||
                  widget.publicationData[0].photoPublication == "no photo"
              ? const Padding(padding: EdgeInsets.zero)
              : SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    child: CachedNetworkImage(
                      imageUrl: ApiIntranetConstans.baseUrl +
                          widget.publicationData[0].photoPublication,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Image(
                          image: AssetImage("lib/assets/lost_connection.png")),
                    ),
                    onDoubleTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CachedNetworkImage(
                              imageUrl: ApiIntranetConstans.baseUrl +
                                  widget.publicationData[0].photoPublication,
                              errorWidget: (context, url, error) => const Image(
                                  image: AssetImage(
                                      "lib/assets/lost_connection.png")))));
                    },
                  ),
                ),
          Padding(
              padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
              child: Container(
                height: 2,
                color: ColorIntranetConstants.backgroundColorDark,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        if (widget.publicationToLikeData[0].isLike == false) {
                          widget.publicationToLikeData[0].likes =
                              widget.publicationToLikeData[0].likes + 1;
                          widget.publicationToLikeData[0].isLike = true;
                          postLike(widget.token.toString(),
                              widget.publicationToLikeData[0].id.toString());
                        } else {
                          widget.publicationToLikeData[0].likes =
                              widget.publicationToLikeData[0].likes - 1;
                          widget.publicationToLikeData[0].isLike = false;
                          postUnlike(widget.token.toString(),
                              widget.publicationToLikeData[0].id.toString());
                        }
                      });
                    },
                    child: widget.publicationToLikeData[0].likes ==
                                widget.publicationData[0].likes &&
                            widget.publicationToLikeData[0].isLike == false
                        ? Row(
                            children: [
                              Badge(
                                  toAnimate: true,
                                  position: BadgePosition.bottomEnd(),
                                  badgeContent: Text(
                                    widget.publicationData[0].likes.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  child: const Icon(
                                    Icons.favorite,
                                    color: ColorIntranetConstants.redLight,
                                    size: 24,
                                  )),
                              const Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Text("Me gusta"),
                              )
                            ],
                          )
                        : Row(
                            children: [
                              Badge(
                                  toAnimate: true,
                                  position: BadgePosition.bottomEnd(),
                                  badgeContent: Text(
                                    widget.publicationData[0].likes.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 24,
                                  )),
                              const Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Text(
                                  "Me gusta",
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            ],
                          )),
                Padding(
                  padding: EdgeInsets.zero,
                  child: InkWell(
                      onTap: () {
                        _settingModalBottomSheet(
                            context, widget.publicationData[0].comments);
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.mode_comment,
                            color: ColorIntranetConstants.primaryColorNormal,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text("Comentar"),
                          )
                        ],
                      )),
                ),
                const Padding(padding: EdgeInsets.only(right: 64)),
              ],
            ),
          ),
          Container(
            height: 8,
            color: ColorIntranetConstants.backgroundColorDark,
          )
        ],
      ),
    );
  }

  Future postLike(String token, String publicationID) async {
    String url = ApiIntranetConstans.baseUrl + ApiIntranetConstans.postLike;
    final response = await http.post(Uri.parse(url), body: {
      'token': token,
      'publicationID': publicationID,
    }, headers: {
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      return true;
    }
    if (response.statusCode == 422) {
      return false;
    }

    return false;
  }

  Future postUnlike(String token, String publicationID) async {
    String url = ApiIntranetConstans.baseUrl + ApiIntranetConstans.postUnlike;
    final response = await http.post(Uri.parse(url), body: {
      'token': token,
      'publicationID': publicationID,
    }, headers: {
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      return true;
    }
    if (response.statusCode == 422) {
      return false;
    }

    return false;
  }

  _settingModalBottomSheet(context, List<Comments> comments) {
    final _formKey = GlobalKey<FormState>();
    final _contentComments = TextEditingController();
    late List<Comments> _publicationComment = comments;

    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0))),
        context: context,
        builder: (BuildContext bc) {
          return Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 16)),
              Form(
                  key: _formKey,
                  child: Row(
                    children: [
                      const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 8)),
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Este campo no puede estar vacío';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            contentPadding: const EdgeInsets.all(15.0),
                            hintText: 'Comentar',
                          ),
                          maxLines: 1,
                          controller: _contentComments,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 8)),
                      IconButton(
                          onPressed: () {
                            if (_contentComments.text.isNotEmpty) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content:
                                    Text(StringIntranetConstants.publicationPostCommentSuccesful),
                              ));
                              postComment(
                                  widget.token.toString(),
                                  comments[0].id.toString(),
                                  _contentComments.text);
                              setState(() {
                                _publicationComment.add(Comments(
                                    id: 1,
                                    userName: widget.userlModelData[0].fullname,
                                    photo: widget.userlModelData[0].photo,
                                    content: _contentComments.text));
                              });

                              _contentComments.clear();

                              FocusManager.instance.primaryFocus?.unfocus();
                            } else {
                              _formKey.currentState!.validate();
                            }
                          },
                          icon: const Icon(
                            Icons.send,
                            color: ColorIntranetConstants.primaryColorDark,
                          ))
                    ],
                  )),
              const Padding(padding: EdgeInsets.only(top: 16)),
              Expanded(
                child: ListView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  itemCount: _publicationComment.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: _publicationComment[index].content ==
                              "sin datos"
                          ? []
                          : [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 0.0),
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          ApiIntranetConstans.baseUrl +
                                              _publicationComment[index]
                                                  .photo
                                                  .toString()), /*  backgroundImage: NetworkImage(ApiIntranetConstans.baseUrl + _directoryModel![index].photo.toString()), */
                                    ),
                                  )),
                              const Padding(padding: EdgeInsets.only(left: 16)),
                              Container(
                                decoration: const BoxDecoration(
                                    color: ColorIntranetConstants
                                        .backgroundColorNormal,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _publicationComment[index].userName,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16.00,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(top: 8)),
                                      Text(_publicationComment[index].content,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 12.00,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                    );
                  },
                ),
              ),
            ],
          );
        });
  }

  Future postComment(String token, String publicationID, String content) async {
    String url = ApiIntranetConstans.baseUrl + ApiIntranetConstans.postComment;
    final response = await http.post(Uri.parse(url), body: {
      'token': token,
      'publicationID': publicationID,
      'content': content,
    }, headers: {
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      return true;
    }
    if (response.statusCode == 422) {
      return false;
    }

    return false;
  }
}
