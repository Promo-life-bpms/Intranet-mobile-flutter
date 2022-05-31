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
import 'package:intranet_movil/views/home/widget/birthday_home_builder.dart';
import 'package:intranet_movil/views/home/widget/birthday_title_card.dart';
import 'package:intranet_movil/views/home/widget/carousel_home_builder.dart';
import 'package:intranet_movil/views/home/widget/publication_builder.dart';
import 'package:intranet_movil/views/home/widget/publication_card.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:intranet_movil/widget/skeletons/list_view_publication.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    _userModel =
        (await ApiUserService().getUsers(_token.toString()))!.cast<UserModel>();
    _birthdayModel =
        (await ApiBrithdayService().getBrithday())!.cast<BirthdayModel>();
    _communiqueModel =
        (await ApiCommuniqueService().getCommunique())!.cast<CommuniqueModel>();
    _publicationModel =
        (await ApiPublicationService().getPublication(token.toString()))!
            .cast<PublicationModel>();

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
                    //Publicaciones
                    PublicationCard(userData: _userModel!),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    const BirthdayTitleCard(),
                    //Cumpleanos del mes
                    _birthdayModel == null || _birthdayModel!.isEmpty
                        ? const Padding(padding: EdgeInsets.zero)
                        : BirthdayHomeBuilder(birthdayData: _birthdayModel!),
                    //Comunicados
                    _communiqueModel == null || _communiqueModel!.isEmpty
                        ? const Padding(padding: EdgeInsets.zero)
                        : CarouselHomeBuilder(communiqueData: _communiqueModel!),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    //Publicaciones
                    _publicationModel == null || _publicationModel!.isEmpty
                        ? const Text(StringIntranetConstants.homePublicationEmpty,textAlign: TextAlign.left,)
                        : PublicationBuilder(publicationData: _publicationModel!, userData: _userModel!, isLike: isLike, token: token)
                  ],
                ),
              ),
            ),
    );
  }
}