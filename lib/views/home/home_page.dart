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
import 'package:intranet_movil/views/home/widget/no_data_birthday_builder.dart';
import 'package:intranet_movil/views/home/widget/no_data_post_publication.dart';
import 'package:intranet_movil/views/home/widget/publication_builder.dart';
import 'package:intranet_movil/views/home/widget/publication_card.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:lottie/lottie.dart';
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

  static List<BirthdayModel>? _brithdayList = [];
  static List<UserModel>? _userList = [];
  static List<CommuniqueModel>? _communiqueList = [];

  static List<PublicationModel>? _publicationList = [];
  static List<PublicationModel>? _publicationListToLike = [];

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  bool isLike = false;
  bool loadingComment = false;
  late String token = "";

  @override
  void initState() {
    super.initState();
    // ignore: prefer_is_empty
    if (widget.userData == [] || widget.userData == null || widget.userData!.length == 0) {
      _getData();
    } else {
      _userList = widget.userData;
    }

    // ignore: prefer_is_empty
    if (widget.birthdayData == [] || widget.birthdayData == null || widget.birthdayData!.length == 0) {
      _getBirthdayData();
    } else {
      _brithdayList = widget.birthdayData;
    }

    // ignore: prefer_is_empty
    if (widget.communiqueData == [] || widget.communiqueData == null || widget.communiqueData!.length == 0) {
      _getCommuniqueData();
    } else {
      _communiqueList = widget.communiqueData;
    }

    _getData();
  }

  void _getData() async {
    final prefs = await SharedPreferences.getInstance();
    String? _token = prefs.getString('token');
    if (_token != null || _token!.isNotEmpty) {
      token = _token;
    }
    _userlModel = (await ApiUserService().getUsers(_token.toString()))!.cast<UserModel>();
    _brithdayModel = (await ApiBrithdayService().getBrithday())!.cast<BirthdayModel>();
    _communiqueModel = (await ApiCommuniqueService().getCommunique())!.cast<CommuniqueModel>();
    _publicationModel = (await ApiPublicationService().getPublication(token.toString()))!.cast<PublicationModel>();
    _publicationModelToLike = _publicationModel;

    setState(() {
      _userList = _userlModel;
      _brithdayList = _brithdayModel;
      _communiqueList = _communiqueModel;
      _publicationList = _publicationModel;
      _publicationListToLike = _publicationModel;
    });

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _getBirthdayData() async {
    _brithdayModel = (await ApiBrithdayService().getBrithday())!.cast<BirthdayModel>();

    setState(() {
      _brithdayList = _brithdayModel;
    });

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _getCommuniqueData() async {
    _communiqueModel = (await ApiCommuniqueService().getCommunique())!.cast<CommuniqueModel>();

    setState(() {
      _communiqueList = _communiqueModel;
    });
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(userData: _userList),
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
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        color: Colors.white,
        backgroundColor: Colors.blue,
        strokeWidth: 3.0,
        onRefresh: () async {
          setState(() {
            _getData();

          });

         return Future<void>.delayed(const Duration(seconds: 3));

        },
        child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          color: ColorIntranetConstants.backgroundColorDark,
          child: Column(
            children: [
              //Publicaciones
              _userList == null || _userList!.isEmpty
                  ? Column(
                      children: const [
                        NoDataPublicationCard(),
                        Padding(padding: EdgeInsets.only(top: 8)),
                      ],
                    )
                  : Column(
                      children: [
                        PublicationCard(userData: _userList!),
                        const Padding(padding: EdgeInsets.only(top: 8)),
                      ],
                    ),

              //Cumpleanos del mes
              _brithdayList == null ||
                      _brithdayList!.isEmpty ||
                      _brithdayList == []
                  ? Column(
                      children: const [
                        BirthdayTitleCard(),
                        NoDataBirthdayHomeBuilder(),
                        Padding(padding: EdgeInsets.only(top: 8))
                      ],
                    )
                  : Column(
                      children: [
                        const BirthdayTitleCard(),
                        BirthdayHomeBuilder(birthdayData: _brithdayList!),
                        const Padding(padding: EdgeInsets.only(top: 8))
                      ],
                    ),
              //Comunicados
              // ignore: prefer_is_empty
              _communiqueList == null || _communiqueList!.isEmpty || _communiqueList!.length == 0
                  ? const Padding(padding: EdgeInsets.zero)
                  : Column(
                      children: [
                        CarouselHomeBuilder(communiqueData: _communiqueList!),
                        const Padding(padding: EdgeInsets.only(bottom: 8))
                      ],
                    ),
              //Publicaciones
              _publicationList == null || _publicationList!.isEmpty || _publicationList == []
                  ? Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text(
                              "Actualizando publicaciones...",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Center(
                            child: SizedBox(
                                width: 300,
                                child:
                                    Lottie.asset("lib/assets/fech_data.json")),
                          ),
                        ],
                      ))
                  : PublicationBuilder(
                      publicationData: _publicationList!,
                      publicationToLikeData: _publicationListToLike!,
                      userData: _userList!,
                      isLike: isLike,
                      token: token,
                      mainContext: context,
                    )
            ],
          ),
        ),
      ),


      )



            );
  }
}
