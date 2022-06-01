/* 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intranet_movil/model/publication.dart';

void _settingModalBottomSheet(context, List<Comments> comments) {
    final _formKey = GlobalKey<FormState>();
    final _contentComments = TextEditingController();
    late List<Comments> _publicationComment = [];
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
        GlobalKey<RefreshIndicatorState>();

    setState(() {
      _publicationComment = comments;
    });
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
                              postComment(
                                  token.toString(),
                                  comments[0].id.toString(),
                                  _contentComments.text);
                              _publicationComment.add(Comments(
                                  id: 1,
                                  userName: _userlModel![0].fullname,
                                  photo: _userlModel![0].photo,
                                  content: _contentComments.text));

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
 */