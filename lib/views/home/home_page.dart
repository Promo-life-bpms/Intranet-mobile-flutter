import 'package:flutter/material.dart';
import 'package:intranet_movil/model/birthday.dart';
import 'package:intranet_movil/model/communique.dart';
import 'package:intranet_movil/model/publication.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/services/api_birthday.dart';
import 'package:intranet_movil/services/api_communique.dart';
import 'package:intranet_movil/services/api_publications.dart';
import 'package:intranet_movil/services/api_user.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/chat/chat_page.dart';
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
  static const String _title = 'Inicio';
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
        title: const Text(_title),
        actions: [
          Padding(
              padding:const  EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                   .push(MaterialPageRoute(builder: (context) => const ChatPage()));
                },
                child: const Image(
                  image: AssetImage('lib/assets/chat.png'),
                ),
              ),
            ),
        ],
      ),
      body: _userlModel == null || _userlModel!.isEmpty
          ? const ListviewPublication()
          : SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Container(
                color: ColorIntranetConstants.backgroundColorDark,
                child: Column(
                  children: [
                    //Publicaciones
                    PublicationCard(userData: _userlModel!),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    const BirthdayTitleCard(),
                    //Cumpleanos del mes
                    _brithdayModel == null || _brithdayModel!.isEmpty
                        ? const Padding(padding: EdgeInsets.zero)
                        : BirthdayHomeBuilder(birthdayData: _brithdayModel!),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    //Comunicados
                    _communiqueModel == null || _communiqueModel!.isEmpty
                        ? const Padding(padding: EdgeInsets.zero)
                        : CarouselHomeBuilder(
                            communiqueData: _communiqueModel!),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    //Publicaciones
                    _publicationModel == null || _publicationModel!.isEmpty
                        ? const Text(
                            StringIntranetConstants.homePublicationEmpty,
                            textAlign: TextAlign.left,
                          )
                        : PublicationBuilder(
                            publicationData: _publicationModel!,
                            publicationToLikeData: _publicationModelToLike!,
                            userData: _userlModel!,
                            isLike: isLike,
                            token: token)
                  ],
                ),
              ),
            ),
    );
  }
}
