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
import 'package:intranet_movil/views/home/widget/birthday_title_card.dart';
import 'package:intranet_movil/views/home/widget/carrousel_item_card.dart';
import 'package:intranet_movil/views/home/widget/publication_card.dart';
import 'package:intranet_movil/views/home/widget/user_birthday_card.dart';
import 'package:intranet_movil/widget/containers/publications.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:intranet_movil/widget/skeletons/list_view_publication.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  late List<CommuniqueModel>? _communiqueModel = [];
  late List<BirthdayModel>? _birthdayModel = [];
  late List<UserModel>? _userModel = [];
  late List<PublicationModel>? _publicationModel = [];
/*   late List<PublicationModel>? _publicationModelToLike = [];
 */  bool isLike = false;
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
    _userModel =
        (await ApiUserService().getUsers(_token.toString()))!.cast<UserModel>();
    _birthdayModel =
        (await ApiBrithdayService().getBrithday())!.cast<BirthdayModel>();
    _communiqueModel =
        (await ApiCommuniqueService().getCommunique())!.cast<CommuniqueModel>();
    _publicationModel =
        (await ApiPublicationService().getPublication(token.toString()))!
            .cast<PublicationModel>();
/*     _publicationModelToLike = _publicationModel;
 */
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(StringIntranetConstants.homePage),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const ListviewPublication()
          : SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Container(
                color: ColorIntranetConstants.backgroundColorDark,
                child: Column(
                  children: [
                    PublicationCard(userData: [UserModel(id: _userModel![0].id, fullname: _userModel![0].fullname, email: _userModel![0].email, photo: _userModel![0].photo, department: _userModel![0].department, position: _userModel![0].position, daysAvailables: _userModel![0].daysAvailables)]),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    const BirthdayTitleCard(),
                    _birthdayModel == null || _birthdayModel!.isEmpty
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
                                    itemCount: _birthdayModel!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return UserBirthdayCard (birthdayData: [BirthdayModel(id: _birthdayModel![index].id, name: _birthdayModel![index].name, lastname: _birthdayModel![index].lastname, photo: _birthdayModel![index].photo, date: _birthdayModel![index].date)]);
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
                                    child: CarrouselItemCard(communiqueData: [CommuniqueModel(id: _communiqueModel![index].id, title: _communiqueModel![index].title, image: _communiqueModel![index].image, description: _communiqueModel![index].description)])
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
                                            id: _userModel![0].id,
                                            fullname: _userModel![0].fullname,
                                            email: _userModel![0].email,
                                            photo: _userModel![0].photo,
                                            department:
                                                _userModel![0].department,
                                            position: _userModel![0].position,
                                            daysAvailables:
                                                _userModel![0].daysAvailables)
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