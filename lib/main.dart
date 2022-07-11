import 'package:flutter/material.dart';
import 'package:intranet_movil/model/birthday.dart';
import 'package:intranet_movil/model/communique.dart';
import 'package:intranet_movil/model/publication.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/services/api_birthday.dart';
import 'package:intranet_movil/services/api_communique.dart';
import 'package:intranet_movil/services/api_publications.dart';
import 'package:intranet_movil/services/api_user.dart';
import 'package:intranet_movil/services/api_auth.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/auth/login_page.dart';
import 'package:intranet_movil/views/home/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => AuthProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MyApp> {
  late List<UserModel>? _userModel = [];
  late List<BirthdayModel>? _brithdayModel = [];
  late List<CommuniqueModel>? _communiqueModel = [];
  late List<PublicationModel>? _publicationModel = [];

  late String? _token = "";

  late String validate = "";

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    _userModel = (await ApiUserService().getUsers(_token.toString()))!.cast<UserModel>();

    if(_userModel!.isNotEmpty){
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('fullname', _userModel![0].fullname);
      await prefs.setString('email', _userModel![0].email);
      await prefs.setString('photo', _userModel![0].photo);
    }
    _brithdayModel =
        (await ApiBrithdayService().getBrithday())!.cast<BirthdayModel>();
    _communiqueModel =
        (await ApiCommuniqueService().getCommunique())!.cast<CommuniqueModel>();
        
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        //Tema custom de la aplicacion
        theme: ThemeData(
            primaryColor: ColorIntranetConstants.primaryColorLight,
            primaryColorLight: ColorIntranetConstants.primaryColorLight,
            primaryColorDark: ColorIntranetConstants.primaryColorDark,
            backgroundColor: ColorIntranetConstants.backgroundColorDark,
            scaffoldBackgroundColor:
                ColorIntranetConstants.backgroundColorNormal,
            hoverColor: ColorIntranetConstants.primaryColorLight,
            appBarTheme: const AppBarTheme(
                backgroundColor: ColorIntranetConstants.primaryColorLight)),
        home: Scaffold(
            body: _userModel == null || _userModel!.isEmpty
                ? Center(
                    //Widget que valida si esta autenticado o no
                    child: Consumer<AuthProvider>(
                    builder: (context, auth, child) {
                      switch (auth.isAuthenticated) {
                        case true:
                          if (_userModel != null || _userModel!.isNotEmpty) {
                            return HomePage(
                              userData: _userModel,
                              birthdayData: _brithdayModel,
                              communiqueData: _communiqueModel,
                              publicationData: _publicationModel,
                            );
                          } else {
                            return const HomePage();
                          }
                        default:
                          return const LoginForm();
                      }
                    },
                  ))
                : HomePage(
                    userData: _userModel,
                    birthdayData: _brithdayModel,
                    communiqueData: _communiqueModel,
                  )));
  }
}
