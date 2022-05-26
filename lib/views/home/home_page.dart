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
import 'package:intranet_movil/widget/containers/publications.dart';
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
  late List<CommuniqueModel>? _communiqueModel = [];
  late List<BirthdayModel>? _brithdayModel = [];
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
        (await ApiBrithdayService().getBrithday())!.cast<BirthdayModel>();
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
        title: const Text(StringIntranetConstants.homePage),
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
                                            const Center(
                                                child:
                                                    CircularProgressIndicator()),
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
                                  return PublicationContainer(
                                      publicationData: [
                                        PublicationModel(
                                            id: _publicationModel![index].id,
                                            photo:
                                                _publicationModel![index].photo,
                                            userName: _publicationModel![index]
                                                .userName,
                                            created: _publicationModel![index]
                                                .created,
                                            contentPublication:
                                                _publicationModel![index]
                                                    .contentPublication,
                                            photoPublication:
                                                _publicationModel![index]
                                                    .photoPublication,
                                            likes:
                                                _publicationModel![index].likes,
                                            isLike: isLike,
                                            comments: _publicationModel![index]
                                                .comments)
                                      ],
                                      publicationToLikeData: [
                                        PublicationModel(
                                            id: _publicationModel![index].id,
                                            photo:
                                                _publicationModel![index].photo,
                                            userName: _publicationModel![index]
                                                .userName,
                                            created: _publicationModel![index]
                                                .created,
                                            contentPublication:
                                                _publicationModel![index]
                                                    .contentPublication,
                                            photoPublication:
                                                _publicationModel![index]
                                                    .photoPublication,
                                            likes:
                                                _publicationModel![index].likes,
                                            isLike: isLike,
                                            comments: _publicationModel![index]
                                                .comments)
                                      ],
                                      token: token,
                                      userlModelData: [
                                        UserModel(
                                            id: _userlModel![0].id,
                                            fullname: _userlModel![0].fullname,
                                            email: _userlModel![0].email,
                                            photo: _userlModel![0].photo,
                                            department:
                                                _userlModel![0].department,
                                            position: _userlModel![0].position,
                                            daysAvailables:
                                                _userlModel![0].daysAvailables)
                                      ]);
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
}