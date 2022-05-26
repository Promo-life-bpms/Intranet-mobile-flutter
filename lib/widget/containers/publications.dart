// This is a Custom TextField Widget
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intranet_movil/model/publication.dart';
import 'package:intranet_movil/utils/constants.dart';

class PublicationContainer extends StatefulWidget {
  const PublicationContainer({Key? key,required this.publicationData})
      : super(key: key);

  final List<PublicationModel> publicationData;

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
                                          padding: const EdgeInsets.only(
                                              left: 16,
                                              top: 16,
                                              bottom: 0,
                                              right: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 40,
                                                    height: 40,
                                                    child: CircleAvatar(
                                                      backgroundImage: NetworkImage(
                                                          ApiIntranetConstans
                                                                  .baseUrl + 
                                                                  widget.publicationData[0].photo
                                                              ),
                                                    ),
                                                  ),
                                                  const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 16)),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        widget.publicationData[0]
                                                            .userName,
                                                        style: const TextStyle(
                                                          fontSize: 12.00,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 0,
                                                                top: 4),
                                                        child: Text(
                                                            widget.publicationData[0].created,
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        10.00),
                                                            textAlign:
                                                                TextAlign.left),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 0,
                                                    top: 10,
                                                    bottom: 10),
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
                                        widget.publicationData[0].photoPublication ==
                                                    "sin foto" ||
                                                widget.publicationData[0].photoPublication ==
                                                    "no photo"
                                            ? const Padding(
                                                padding: EdgeInsets.zero)
                                            : SizedBox(
                                                width: double.infinity,
                                                child: InkWell(
                                                  child: CachedNetworkImage(
                                                    imageUrl: ApiIntranetConstans
                                                            .baseUrl +
                                                        widget.publicationData[0].photoPublication,
                                                    placeholder: (context,
                                                            url) =>
                                                        const Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Image(
                                                            image: AssetImage(
                                                                "lib/assets/lost_connection.png")),
                                                  ),
                                                  onDoubleTap: () {
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                        builder: (context) => CachedNetworkImage(
                                                            imageUrl: ApiIntranetConstans
                                                                    .baseUrl +
                                                                widget.publicationData[0].photoPublication,
                                                            errorWidget: (context,
                                                                    url,
                                                                    error) =>
                                                                const Image(
                                                                    image: AssetImage(
                                                                        "lib/assets/lost_connection.png")))));
                                                  },
                                                ),
                                              ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12, left: 16, right: 16),
                                            child: Container(
                                              height: 2,
                                              color: ColorIntranetConstants
                                                  .backgroundColorDark,
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      if (_publicationModelToLike![
                                                                  index]
                                                              .isLike ==
                                                          false) {
                                                        _publicationModelToLike![
                                                                    index]
                                                                .likes =
                                                            _publicationModelToLike![
                                                                        index]
                                                                    .likes +
                                                                1;
                                                        _publicationModelToLike![
                                                                index]
                                                            .isLike = true;
                                                        postLike(
                                                            token,
                                                            _publicationModel![
                                                                    index]
                                                                .id
                                                                .toString());
                                                      } else {
                                                        _publicationModelToLike![
                                                                    index]
                                                                .likes =
                                                            _publicationModelToLike![
                                                                        index]
                                                                    .likes -
                                                                1;
                                                        _publicationModelToLike![
                                                                index]
                                                            .isLike = false;
                                                        postUnlike(
                                                            token,
                                                            _publicationModel![
                                                                    index]
                                                                .id
                                                                .toString());
                                                      }
                                                    });
                                                  },
                                                  child: _publicationModelToLike![
                                                                      index]
                                                                  .likes ==
                                                              _publicationModel![
                                                                      index]
                                                                  .likes &&
                                                          _publicationModelToLike![
                                                                      index]
                                                                  .isLike ==
                                                              false
                                                      ? Row(
                                                          children: [
                                                            Badge(
                                                                toAnimate: true,
                                                                position:
                                                                    BadgePosition
                                                                        .bottomEnd(),
                                                                badgeContent:
                                                                    Text(
                                                                  _publicationModel![
                                                                          index]
                                                                      .likes
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                child:
                                                                    const Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  color: ColorIntranetConstants
                                                                      .redLight,
                                                                  size: 24,
                                                                )),
                                                            const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 12),
                                                              child: Text(
                                                                  "Me gusta"),
                                                            )
                                                          ],
                                                        )
                                                      : Row(
                                                          children: [
                                                            Badge(
                                                                toAnimate: true,
                                                                position:
                                                                    BadgePosition
                                                                        .bottomEnd(),
                                                                badgeContent:
                                                                    Text(
                                                                  _publicationModel![
                                                                          index]
                                                                      .likes
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                child:
                                                                    const Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  color: Colors
                                                                      .red,
                                                                  size: 24,
                                                                )),
                                                            const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 12),
                                                              child: Text(
                                                                "Me gusta",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red),
                                                              ),
                                                            )
                                                          ],
                                                        )),
                                              Padding(
                                                padding: EdgeInsets.zero,
                                                child: InkWell(
                                                    onTap: () {
                                                      _settingModalBottomSheet(
                                                          context,
                                                          _publicationModel![
                                                                  index]
                                                              .comments);
                                                    },
                                                    child: Row(
                                                      children: const [
                                                        Icon(
                                                          Icons.mode_comment,
                                                          color: ColorIntranetConstants
                                                              .primaryColorNormal,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 8),
                                                          child:
                                                              Text("Comentar"),
                                                        )
                                                      ],
                                                    )),
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 64)),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 8,
                                          color: ColorIntranetConstants
                                              .backgroundColorDark,
                                        )
                                      ],
                                    ),
                                  );
  }
}

