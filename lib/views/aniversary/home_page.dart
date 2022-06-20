import 'package:flutter/material.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/aniversary/aniversary_page.dart';
import 'package:intranet_movil/views/aniversary/birthday_page.dart';
import 'package:intranet_movil/views/chat/chat_page.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

class AniversaryHomePage extends StatelessWidget {
  const AniversaryHomePage({Key? key}) : super(key: key);

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
      body: const AboutWidget(),
    );
  }
}

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    builder: (context) => const BrithdayPage()));      
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
                            builder: (context) => const BrithdayPage()));
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
                  builder: (context) => const AniversaryPage()));      
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
                          builder: (context) => const AniversaryPage()));
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
    );
  }
}
