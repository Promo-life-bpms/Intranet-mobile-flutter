import 'package:flutter/material.dart';
import 'package:intranet_movil/model/communique.dart';
import 'package:intranet_movil/model/employee.dart';
import 'package:intranet_movil/model/manual.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/services/api_communique.dart';
import 'package:intranet_movil/services/api_employee.dart';
import 'package:intranet_movil/services/api_manual.dart';
import 'package:intranet_movil/services/api_user.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/about/about_main_page.dart';
import 'package:intranet_movil/views/access/access_page.dart';
import 'package:intranet_movil/views/aniversary/home_page.dart';
import 'package:intranet_movil/views/auth/logout.page.dart';
import 'package:intranet_movil/views/communicate/communicate_page.dart';
import 'package:intranet_movil/views/directory/directory_page.dart';
import 'package:intranet_movil/views/employee_month/employee_month_page.dart';
import 'package:intranet_movil/views/home/home_page.dart';
import 'package:intranet_movil/views/manual/manual_page.dart';
import 'package:intranet_movil/views/organization/organization_page.dart';
import 'package:intranet_movil/views/profile/user.dart';
import 'package:intranet_movil/views/request/request_main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
    
  static var _selectedDrawerItem = 0;

  static var username = "";
  static var email = "";
  static var photo = "";

  late List<UserModel>? _userlModel = [];
  late List<ManualModel>? _manualModel = [];
  late List<CommuniqueModel>? _communiqueModel = [];
  late List<MonthEmployeeModel>? _monthEmployeeModel = [];

  static List<ManualModel> manualData = [];
  static List<CommuniqueModel> communiqueData = [];
  static List<MonthEmployeeModel> monthEmployeeData = [];

  @override
  void initState() {
    super.initState();
    _getData();
    _getAppData();
  }

   void _getData() async {
     //Obtiene el token (si existe) y lo valida enviando una peticion GET al servidor, devuelviendo la información del usuario
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    _userlModel = (await ApiUserService().getUsers(token.toString()))!.cast<UserModel>();
    if(_userlModel!.isNotEmpty){
      setState(() {
        username= _userlModel![0].fullname.toString();
        email =_userlModel![0].email.toString();
        photo = _userlModel![0].photo.toString();
      });
      
    }

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _getAppData() async {
     
    _manualModel = (await ApiManualService().getManual())!.cast<ManualModel>();
    _communiqueModel = (await ApiCommuniqueService().getCommunique())!.cast<CommuniqueModel>();
    _monthEmployeeModel = (await ApiMonthEmployeeService().getMonthEmployee())!.cast<MonthEmployeeModel>();
      setState(() {
        manualData = _manualModel!;
        communiqueData = _communiqueModel!;
        monthEmployeeData = _monthEmployeeModel!;
      });    
     
  
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  //Widget de la barra lateral
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: ListView(
          children: <Widget>[
           UserAccountsDrawerHeader(
              accountName: Text(username),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                child: InkWell(
                  onTap: ()=>Navigator.of(context)
                   .push(MaterialPageRoute(builder: (context) => const UserProfilePage())),
                ),
                backgroundImage: NetworkImage(ApiIntranetConstans.baseUrl+photo),
              ),
            ), 
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(StringIntranetConstants.homePage),
              selected: (_selectedDrawerItem == 0),
              selectedColor: ColorIntranetConstants.primaryColorLight,
              onTap: () {
                selectedItem(context, 0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text(StringIntranetConstants.aboutPage),
              selected: (_selectedDrawerItem == 1),
              selectedColor: ColorIntranetConstants.primaryColorLight,
              onTap: () {
                selectedItem(context, 1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.chat_rounded),
              title: const Text(StringIntranetConstants.organizationPage),
              selectedColor: ColorIntranetConstants.primaryColorLight,
              selected: (_selectedDrawerItem == 2),
              onTap: () {
                selectedItem(context, 2);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(StringIntranetConstants.requestPage),
              selected: (_selectedDrawerItem == 3),
              selectedColor: ColorIntranetConstants.primaryColorLight,
              onTap: () {
                selectedItem(context, 3);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text(StringIntranetConstants.directoryPage),
              selected: (_selectedDrawerItem == 4),
              selectedColor: ColorIntranetConstants.primaryColorLight,
              onTap: () {
                selectedItem(context, 4);
              },
            ),
            ListTile(
              leading: const Icon(Icons.celebration),
              title: const Text(StringIntranetConstants.aniversaryBirthdayPage),
              selected: (_selectedDrawerItem == 5),
              selectedColor: ColorIntranetConstants.primaryColorLight,
              onTap: () {
                selectedItem(context, 5);
              },
            ),
            ListTile(
              leading: const Icon(Icons.emoji_events),
              title: const Text(StringIntranetConstants.monthPage),
              selected: (_selectedDrawerItem == 6),
              selectedColor: ColorIntranetConstants.primaryColorLight,
              onTap: () {
                selectedItem(context, 6);
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text(StringIntranetConstants.communiquePage),
              selected: (_selectedDrawerItem == 7),
              selectedColor: ColorIntranetConstants.primaryColorLight,
              onTap: () {
                selectedItem(context, 7);
              },
            ),
            ListTile(
              leading: const Icon(Icons.library_books),
              title: const Text(StringIntranetConstants.manualPage),
              selected: (_selectedDrawerItem == 8),
              selectedColor: ColorIntranetConstants.primaryColorLight,
              onTap: () {
                selectedItem(context, 8);
              },
            ),
            ListTile(
              leading: const Icon(Icons.public),
              title: const Text(StringIntranetConstants.accessPage),
              selected: (_selectedDrawerItem == 9),
              selectedColor: ColorIntranetConstants.primaryColorLight,
              onTap: () {
                selectedItem(context, 9);
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text(StringIntranetConstants.logoutPage),
              selected: (_selectedDrawerItem == 10),
              selectedColor: ColorIntranetConstants.primaryColorLight,
              onTap: () {
                selectedItem(context, 10);
              },
            ),
          ],
        ),
      ),
    );
     
    
}

  selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        _selectedDrawerItem = index;
        Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(
              builder: (context) => const HomePage()
            ), 
          ModalRoute.withName("/HomePage")
          );
        break;
      case 1:
        _selectedDrawerItem = index;
          Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(
              builder: (context) =>  const AboutMainPage()
            ), 
          ModalRoute.withName("/AboutPage")
          );
        break;
      case 2:
        _selectedDrawerItem = index;
        Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(
              builder: (context) =>  const OrganizationPage()
            ), 
          ModalRoute.withName("/OrganizationPage")
          );
        break;
      case 3:
        _selectedDrawerItem = index;
          Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(
              builder: (context) => const  RequestMainPage()
            ), 
          ModalRoute.withName("/RequestPage")
          );
        break;
      case 4:
        _selectedDrawerItem = index;
          Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(
              builder: (context) =>  const DirectoryPage()
            ), 
          ModalRoute.withName("/DirectoryPage")
          );
        break;
      case 5:
        _selectedDrawerItem = index;
         Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(
              builder: (context) => const AniversaryHomePage()
            ), 
          ModalRoute.withName("/AniversaryPage")
          );
        break;
      case 6:
        _selectedDrawerItem = index;
         Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(
              builder: (context) =>  EmployeeMonthPage( monthEmployeeData: monthEmployeeData)
            ), 
          ModalRoute.withName("/EmployeeMonthPage")
          );
        break;
      case 7:
        _selectedDrawerItem = index;
         Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(
              builder: (context) =>   CommunicatePage(communiqueData: communiqueData)
            ), 
          ModalRoute.withName("/CommuniquePage")
          );
        break;
      case 8:
        _selectedDrawerItem = index;
         Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(
              builder: (context) =>   ManualPage(manualData: manualData)
            ), 
          ModalRoute.withName("/ManualPage")
          );
        break;
      case 9:
        _selectedDrawerItem = index;
         Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(
              builder: (context) =>  const AccessPage()
            ), 
          ModalRoute.withName("/AccesPage")
          );
        break;
      case 10:
        _selectedDrawerItem = index;
         Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(
              builder: (context) =>  const LogoutPage()
            ), 
          ModalRoute.withName("/LogoutPage")
          );

        break; 
    }
  }
}
