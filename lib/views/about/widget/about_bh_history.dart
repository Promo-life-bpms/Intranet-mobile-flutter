import 'package:flutter/material.dart';
import 'package:intranet_movil/utils/constants.dart';

class AboutBHHistoryWidget extends StatefulWidget {
  const AboutBHHistoryWidget({Key? key}) : super(key: key);

  @override
  State<AboutBHHistoryWidget> createState() => _AboutBHHistoryWidgetState();
}

class _AboutBHHistoryWidgetState extends State<AboutBHHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 60),
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: Text(
              StringIntranetConstants.aboutBHWhatIs,
              style: TextStyle(
                color: Colors.blueGrey,
                height: 3,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SizedBox(
            width: double.infinity,
            height: 150,
            child: Text(
                StringIntranetConstants.aboutBHDescription,
                style: TextStyle(height: 1.5),
                textAlign: TextAlign.justify),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: Text(
              StringIntranetConstants.aboutPLValuesCode,
              style: TextStyle(
                  color: Colors.blueGrey,
                  height: 2,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
