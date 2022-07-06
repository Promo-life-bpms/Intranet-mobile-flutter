import 'package:flutter/material.dart';
import 'package:intranet_movil/model/aniversary.dart';
import 'package:intranet_movil/model/birthday.dart';
import 'package:intranet_movil/services/api_aniversary.dart';
import 'package:intranet_movil/services/api_birthday.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/aniversary/aniversary_page.dart';
import 'package:intranet_movil/views/aniversary/birthday_page.dart';
import 'package:intranet_movil/views/chat/chat_page.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';


class AniversaryHomePage extends StatefulWidget {
  const AniversaryHomePage({Key? key }) : super(key: key);

  @override
  _AniversaryHomeState createState() => _AniversaryHomeState();
}

class _AniversaryHomeState extends State<AniversaryHomePage> {

  late List<AniversaryModel>? _aniversaryModel = [];
  late List<BirthdayModel>? _brithdayModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

   void _getData() async {
    _aniversaryModel = (await ApiAniversaryService().getAniversary())!.cast<AniversaryModel>();
    _brithdayModel = (await ApiBrithdayService().getBrithday())!.cast<BirthdayModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
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
        title: const Text(StringIntranetConstants.aniversaryBirthdayPage),
      ),
      body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Widget de los cumpleaños
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BrithdayPage(brithdayData: _brithdayModel!)));      
              },
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      width: double.infinity,
                      height: 160.0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                        child: FittedBox(
                          //fit: BoxFit.contain,
                          child: Image(
                            image: AssetImage('lib/assets/birthday.png'),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  BrithdayPage(brithdayData: _brithdayModel!)));
                      },
                      child: const Text('Cumpleaños'),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),

            //Widget de los aniversarios
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AniversaryPage(aniversaryData: _aniversaryModel!)));      
              },
                child: Column(
                children: <Widget>[
                  const SizedBox(
                    width: double.infinity,
                    height: 160.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80),
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image(
                            image: AssetImage('lib/assets/aniversary.png'),
                          )),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AniversaryPage(aniversaryData: _aniversaryModel!)));
                    },
                    child: const Text('Aniversarios'),
                  ),
                ],
                ),
              ),
            ),

          ],
        ),
      ),
    ),
    );
  }
}
