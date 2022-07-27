import 'package:flutter/material.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/about/bh_page.dart';
import 'package:intranet_movil/views/about/promolife_page.dart';
import 'package:intranet_movil/views/chat/chat_page.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const AboutMainPage());

class AboutMainPage extends StatelessWidget {
  const AboutMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
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
        title: const Text(StringIntranetConstants.aboutPage),
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
              // Card perteneciente a PL
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: InkWell(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        width: double.infinity,
                        height: 160.0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: Image(
                                image: AssetImage('lib/assets/promolife.png'),
                              )),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const PromolifePage()));
                        },
                        child: const Text(
                          'Ver más',
                          style: TextStyle(
                              color: ColorIntranetConstants.primaryColorNormal,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PromolifePage())),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 8)),
              //Segunda  card
              Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: InkWell(
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            width: double.infinity,
                            height: 160.0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 20),
                              child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Image(
                                    image: AssetImage('lib/assets/bhtrade.png'),
                                  )),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const BHPage()));
                            },
                            child: const Text(
                              'Ver más',
                              style: TextStyle(
                                  color:
                                      ColorIntranetConstants.primaryColorNormal,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BHPage())))),
            ],
          ),
        ));
  }
}
