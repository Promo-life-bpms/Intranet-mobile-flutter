import 'package:flutter/material.dart';

class AboutBHHeaderWidget extends StatefulWidget {
  const AboutBHHeaderWidget({Key? key}) : super(key: key);

  @override
  State<AboutBHHeaderWidget> createState() => _AboutBHHeaderState();
}

class _AboutBHHeaderState extends State<AboutBHHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.blue,
            BlendMode.softLight,
          ),
          image: NetworkImage(
              "http://www.trademarket.com.mx/assets/imgs/quienes.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: const Align(
        alignment: Alignment(0, 3),
        child: SizedBox(
          width: 150.0,
          child: Image(image: AssetImage('lib/assets/bhtrade.png')),
        ),
      ),
    );
  }
}
