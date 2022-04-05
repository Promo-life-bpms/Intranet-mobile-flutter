import 'package:flutter/material.dart';

void main() => runApp(const AboutPromolife());

class AboutPromolife extends StatelessWidget {
  const AboutPromolife({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Iniciar sesion';

    return const MaterialApp(
      title: appTitle,
      home: Scaffold(
        body: Promolife(),    
      ),
    );
  }
}

class Promolife extends StatefulWidget {
  const Promolife({Key? key}) : super(key: key);

  @override
  AboutPromolifeView createState() {
    return AboutPromolifeView();
  }
}

class AboutPromolifeView extends State<Promolife> {
 
  @override
  Widget build(BuildContext context) {
    return const  Center(
     child: Text ("Promolife"),
    );
  }
}


