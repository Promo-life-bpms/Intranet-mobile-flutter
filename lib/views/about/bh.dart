import 'package:flutter/material.dart';

void main() => runApp(const AboutBH());

class AboutBH extends StatelessWidget {
  const AboutBH({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Iniciar sesion';

    return const MaterialApp(
      title: appTitle,
      home: Scaffold(
        body: BH(),    
      ),
    );
  }
}

class BH extends StatefulWidget {
  const BH({Key? key}) : super(key: key);

  @override
  BHView createState() {
    return BHView();
  }
}

class BHView extends State<BH> {
 
  @override
  Widget build(BuildContext context) {
    return const  Center(
     child: Text ("BH"),
    );
  }
}
