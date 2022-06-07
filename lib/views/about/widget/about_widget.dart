import 'package:flutter/material.dart';
import 'package:intranet_movil/model/about.dart';
import 'package:lottie/lottie.dart';

class AboutItem extends StatefulWidget {
  const AboutItem({Key? key,required this.aboutData})
      : super(key: key);

  final List<AboutData> aboutData;

  @override
  State<AboutItem> createState() => _AboutItemState();
}

class _AboutItemState extends State<AboutItem> {

  @override
  Widget build(BuildContext context) {
    return Column(
         children: [
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Text(
                widget.aboutData[0].title,
                style: const TextStyle(
                color: Colors.blueGrey,
                height: 2,
                fontSize: 20,
                fontWeight: FontWeight.w700),
                textAlign: TextAlign.justify,
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                SizedBox(
                  width: 150,
                  child: Lottie.asset(widget.aboutData[0].lottie),
                ),
                Expanded(
                  child: Text(
                    widget.aboutData[0].description,
                    style: const TextStyle(height: 1.5),
                    textAlign: TextAlign.justify,
                  ),
                ),           
              ],
            ),        
          ),

         ],


        );
  }
}

