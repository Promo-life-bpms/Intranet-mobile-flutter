import 'package:flutter/material.dart';
import 'package:intranet_movil/widgets/drawer.dart';

class AboutPromolife extends StatelessWidget {
  const AboutPromolife({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body:  Column(
          children: const [
            Image(
              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            ),
            Image(
              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              width: 100,
              height: 100,
              
            )
          ],
        ),
        drawer: const DrawerNavigation(),
      ),
    );
  }
}





