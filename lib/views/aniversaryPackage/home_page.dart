import 'package:flutter/material.dart';
import 'package:intranet_movil/views/aniversaryPackage/aniversary_page.dart';
import 'package:intranet_movil/views/aniversaryPackage/birthday_page.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

class AniversaryHomePage extends StatelessWidget {
  const AniversaryHomePage({Key? key}) : super(key: key);

  static const String _title = 'Aniversarios y Cumpleaños';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(_title),
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
      child: Column(
        children: <Widget>[
          Card(
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
          //Segunda card
          Card(
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
        ],
      ),
    );
  }
}
