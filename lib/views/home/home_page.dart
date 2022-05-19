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
          ? ListviewPublication()
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
                                              padding: EdgeInsets.all(8),
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
                                      child: Image(
                                        image: NetworkImage(
                                            ApiIntranetConstans.baseUrl +
                                                _communiqueModel![index].image),
                                      ),
                                      onDoubleTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => Image(
                                                    image: NetworkImage(
                                                        ApiIntranetConstans
                                                                .baseUrl +
                                                            _communiqueModel![
                                                                    index]
                                                                .image))));
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
                                                  child: const Image(
                                                    /* image: NetworkImage(
                                                        ApiIntranetConstans
                                                                .baseUrl +
                                                            _publicationModel![
                                                                    index]
                                                                .photoPublication), */
                                                    image: NetworkImage(
                                                        "https://www.blogdelfotografo.com/wp-content/uploads/2020/04/fotografo-paisajes.jpg"),
                                                  ),
                                                  onDoubleTap: () {
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                        builder: (context) => Image(
                                                            image: NetworkImage(
                                                                ApiIntranetConstans
                                                                        .baseUrl +
                                                                    _publicationModel![
                                                                            index]
                                                                        .photoPublication))));
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
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  child: InkWell(
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
                                                child: _publicationModelToLike![index]
                                                                .likes ==
                                                            _publicationModel![
                                                                    index]
                                                                .likes &&
                                                        _publicationModelToLike![
                                                                    index]
                                                                .isLike ==
                                                            false
                                                    ? Badge(
                                                        toAnimate: true,
                                                        position: BadgePosition
                                                            .bottomEnd(),
                                                        badgeContent: Text(
                                                          _publicationModel![
                                                                  index]
                                                              .likes
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                        child: const Icon(
                                                          Icons.favorite,
                                                          color: Colors.black,
                                                          size: 24,
                                                        ))
                                                    : Badge(
                                                        toAnimate: true,
                                                        position: BadgePosition
                                                            .bottomEnd(),
                                                        badgeContent: Text(
                                                          _publicationModel![
                                                                  index]
                                                              .likes
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                        child: const Icon(
                                                          Icons.favorite,
                                                          color: Colors.red,
                                                          size: 24,
                                                        )),
                                              ))
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
      print("Like");
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
      print("Unlike");
      return true;
    }
    if (response.statusCode == 422) {
      print(response.statusCode);
      return false;
    }

    return false;
  }
}
