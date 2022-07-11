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
  const HomePage(
      {Key? key,
      this.communiqueData,
      this.birthdayData,
      this.userData,
      this.publicationData})
      : super(key: key);

  final List<CommuniqueModel>? communiqueData;
  final List<BirthdayModel>? birthdayData;
  final List<UserModel>? userData;
  final List<PublicationModel>? publicationData;

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
    print(widget.birthdayData);

    if (widget.userData == [] ||
        widget.userData == null ||
        widget.userData!.length == 0) {
      print("nooo dataaaaaaaaa");
      _getData();
    } else {
      print("yess dataaaaaaaaa");
      _userlModel = widget.userData;
      if (widget.birthdayData == [] ||
          widget.birthdayData == null ||
          widget.birthdayData!.length == 0) {
        print("no widget dataaaaaaaaa");
        _getBirthdayData();
      } else {
        _brithdayModel = widget.birthdayData;
      }

      if (widget.communiqueData != [] ||
          widget.communiqueData != null ||
          widget.communiqueData!.length != 0) {
        _communiqueModel = widget.communiqueData;
      } else {
        _getCommuniqueData();
      }

      if (widget.publicationData == [] ||
          widget.publicationData == null ||
          widget.publicationData!.length == 0) {
        _getPublicationData();
      } else {
        _publicationModel = widget.publicationData;
        _publicationModelToLike = widget.publicationData;
      }
    }
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

  void _getBirthdayData() async {
    final prefs = await SharedPreferences.getInstance();
    String? _token = prefs.getString('token');
    if (_token != null || _token!.isNotEmpty) {
      token = _token;
    }
    _brithdayModel =
        (await ApiBrithdayService().getBrithday())!.cast<BirthdayModel>();

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _getCommuniqueData() async {
    final prefs = await SharedPreferences.getInstance();
    String? _token = prefs.getString('token');
    if (_token != null || _token!.isNotEmpty) {
      token = _token;
    }

    _communiqueModel =
        (await ApiCommuniqueService().getCommunique())!.cast<CommuniqueModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _getPublicationData() async {
    final prefs = await SharedPreferences.getInstance();
    String? _token = prefs.getString('token');
    if (_token != null || _token!.isNotEmpty) {
      token = _token;
    }
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
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ChatPage()));
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

                    //Cumpleanos del mes
                    _brithdayModel == null ||
                            _brithdayModel!.isEmpty ||
                            _brithdayModel == []
                        ? const Text("data")
                        : Column(
                            children: [
                              const BirthdayTitleCard(),
                              BirthdayHomeBuilder(
                                  birthdayData: _brithdayModel!),
                              
                            ],
                          ),
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
                            token: token,
                            mainContext: context,
                          )
                  ],
                ),
              ),
            ),
    );
  }
}
