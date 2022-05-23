import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intranet_movil/model/brithday.dart';
import 'package:intranet_movil/model/communique.dart';
import 'package:intranet_movil/model/publication.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/services/api_brithday.dart';
import 'package:intranet_movil/services/api_communique.dart';
import 'package:intranet_movil/services/api_publications.dart';
import 'package:intranet_movil/services/api_user.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/home/create_post.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:intranet_movil/widget/skeletons/list_view_publication.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:badges/badges.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  static const String _title = 'Inicio';
  late List<CommuniqueModel>? _communiqueModel = [];
  late List<BrithdayModel>? _brithdayModel = [];
  late List<UserModel>? _userlModel = [];
  late List<PublicationModel>? _publicationModel = [];
  late List<PublicationModel>? _publicationModelToLike = [];
  bool isLike = false;
  bool loadingComment = false;
  late String token = "";

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final prefs = await SharedPreferences.getInstance();
    String? _token = prefs.getString('token');
    if (_token != null || _token!.isNotEmpty) {
      token = _token;
    }
    _userlModel =
        (await ApiUserService().getUsers(_token.toString()))!.cast<UserModel>();
    _brithdayModel =
        (await ApiBrithdayService().getBrithday())!.cast<BrithdayModel>();
    _communiqueModel =
        (await ApiCommuniqueService().getCommunique())!.cast<CommuniqueModel>();
    _publicationModel =
        (await ApiPublicationService().getPublication(token.toString()))!
            .cast<PublicationModel>();
    _publicationModelToLike = _publicationModel;

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: _userlModel == null || _userlModel!.isEmpty
          ? const ListviewPublication()
          : SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Container(
                color: ColorIntranetConstants.backgroundColorDark,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 80,
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreatePostPage()),
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
                                      ApiIntranetConstans.baseUrl +
                                          _userlModel![0].photo),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.only(left: 24)),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              115, 92, 92, 92)),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: const Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text(
                                      "¿Qué estás pensando?",
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    Container(
                      padding: const EdgeInsets.only(top: 16),
                      color: Colors.white,
                      child: const Center(
                        child: Text(
                          "Cumpleaños del Mes",
                          style: TextStyle(
                            fontSize: 18.00,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    _brithdayModel == null || _brithdayModel!.isEmpty
                        ? const Padding(padding: EdgeInsets.zero)
                        : Container(
                            padding: const EdgeInsets.only(top: 16, bottom: 16),
                            color: Colors.white,
                            child: Row(
                              children: [
                                Expanded(
                                    child: SizedBox(
                                  width: double.infinity,
                                  height: 120,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.all(0),
                                    itemCount: _brithdayModel!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    width: 60,
                                                    height: 60,
                                                    child: CircleAvatar(
                                                      radius: 20,
                                                      backgroundImage: NetworkImage(
                                                          ApiIntranetConstans
                                                                  .baseUrl +
                                                              _brithdayModel![
                                                                      index]
                                                                  .photo
                                                                  .toString()),
                                                    ),
                                                  ),
                                                  const Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 4)),
                                                  SizedBox(
                                                    width: 120,
                                                    child: Center(
                                                      child: Text(
                                                          _brithdayModel![index]
                                                                  .name +
                                                              " " +
                                                              _brithdayModel![
                                                                      index]
                                                                  .lastname,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 12.00,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ),
                                                  ),
                                                  Center(
                                                      child: Text(
                                                          _brithdayModel![index]
                                                              .date,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      10.00),
                                                          textAlign: TextAlign
                                                              .center)),
                                                ],
                                              )),
                                        ],
                                      );
                                    },
                                  ),
                                )),
                              ],
                            ),
                          ),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    _communiqueModel == null || _communiqueModel!.isEmpty
                        ? const Padding(padding: EdgeInsets.zero)
                        : Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                CarouselSlider.builder(
                                  itemCount: _communiqueModel!.length,
                                  itemBuilder: (BuildContext context, int index,
                                          int pageViewIndex) =>
                                      FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: InkWell(
                                      child: CachedNetworkImage(
                                        imageUrl: ApiIntranetConstans.baseUrl +
                                            _communiqueModel![index].image,
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Image(
                                                image: AssetImage(
                                                    "lib/assets/lost_connection.png")),
                                      ),
                                      onDoubleTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) =>
                                                CachedNetworkImage(
                                                    imageUrl:
                                                        ApiIntranetConstans
                                                                .baseUrl +
                                                            _communiqueModel![
                                                                    index]
                                                                .image,
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Image(
                                                            image: AssetImage(
                                                                "lib/assets/lost_connection.png")))));
                                      },
                                    ),
                                  ),
                                  options: CarouselOptions(
                                    height: 350,
                                    autoPlay: true,
                                    enlargeCenterPage: true,
                                    viewportFraction: 0.9,
                                    aspectRatio: 2.0,
                                    initialPage: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    _publicationModel == null || _publicationModel!.isEmpty
                        ? const CircularProgressIndicator()
                        : Column(
                            children: [
                              ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(0),
                                itemCount: _publicationModel!.length,
                                itemBuilder: (context, index) {
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
                                                              _publicationModel![
                                                                      index]
                                                                  .photo),
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
                                                        _publicationModel![
                                                                index]
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
                                                            _publicationModel![
                                                                    index]
                                                                .created,
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
                                                  _publicationModel![index]
                                                      .contentPublication,
                                                  style: const TextStyle(
                                                    fontSize: 12.00,
                                                  ),
                                                  textAlign: TextAlign.justify,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        _publicationModel![index]
                                                        .photoPublication ==
                                                    "sin foto" ||
                                                _publicationModel![index]
                                                        .photoPublication ==
                                                    "no photo"
                                            ? const Padding(
                                                padding: EdgeInsets.zero)
                                            : SizedBox(
                                                width: double.infinity,
                                                child: InkWell(
                                                  child: CachedNetworkImage(
                                                    imageUrl: ApiIntranetConstans
                                                            .baseUrl +
                                                        _publicationModel![
                                                                index]
                                                            .photoPublication,
                                                    placeholder: (context,
                                                            url) =>
                                                        const CircularProgressIndicator(),
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
                                                                _publicationModel![
                                                                        index]
                                                                    .photoPublication,
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
                                },
                              ),
                            ],
                          ),
                  ],
                ),
              ),
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
    late List<Comments> commentList = [];
    setState(() {
      commentList =comments;
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
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8)),
                      Expanded(
                        child: TextFormField(
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
                            commentList.removeWhere((element) => element.userName == "sin datos");
                            commentList.add(Comments(id: 1, userName: _userlModel![0].fullname, photo: _userlModel![0].photo, content: _contentComments.text));
                          },
                          icon: const Icon(
                            Icons.send,
                            color: ColorIntranetConstants.primaryColorDark,
                          ))
                    ],
                  )),
                  const Padding(padding: EdgeInsets.only(top: 16)),
              commentList.length == 1 && commentList[0].content =="sin datos"
                  ? 
                    Column(
                      children:  [
                        const Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text(
                            "Sin comentarios",
                            style: TextStyle(
                                fontSize: 20),
                          ),
                        ),
                        SizedBox(
                            width: 200,
                            child: Lottie.asset(
                              "lib/assets/robot_blank_space.json",
                            ),
                          ),
                      ],
                    )
                  : Container(
                      child: Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          itemCount: commentList.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0, horizontal: 0.0),
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            ApiIntranetConstans.baseUrl +
                                                commentList[index]
                                                    .photo
                                                    .toString()), /*  backgroundImage: NetworkImage(ApiIntranetConstans.baseUrl + _directoryModel![index].photo.toString()), */
                                      ),
                                    )),
                                const Padding(
                                    padding: EdgeInsets.only(left: 16)),
                                Container(
                                  decoration: const BoxDecoration(
                                      color: ColorIntranetConstants
                                          .backgroundColorNormal,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          commentList[index].userName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 16.00,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(top: 8)),
                                        Text(commentList[index].content,
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
                    ),
            ],
          );
        });
  }
}
