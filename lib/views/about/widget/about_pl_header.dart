import 'package:flutter/material.dart';

class AboutPLHeaderWidget extends StatefulWidget {
  const AboutPLHeaderWidget({Key? key}) : super(key: key);

  @override
  State<AboutPLHeaderWidget> createState() => _AboutPLHeaderState();
}

class _AboutPLHeaderState extends State<AboutPLHeaderWidget> {
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
              "https://media-exp1.licdn.com/dms/image/C4E1BAQHZpvSzm3mrGg/company-background_10000/0/1604596643746?e=2159024400&v=beta&t=7eQro0ejdMhEJ8UTKMZ2fEjTZmbCc6KtEm5kg-LeXIw"),
          fit: BoxFit.cover,
        ),
      ),
      child: const Align(
        alignment: Alignment(0, 1.45),
        child: SizedBox(
          width: 200.0,
          child: Image(image: AssetImage('lib/assets/promolife.png')),
        ),
      ),
    );
  }
}
