import 'package:flutter/material.dart';
import 'package:intranet_movil/model/access.dart';
import 'package:intranet_movil/services/internet.dart';

class AccessCard extends StatefulWidget {
  const AccessCard({Key? key, required this.accessData}) : super(key: key);

  final List<AccessData> accessData;

  @override
  State<AccessCard> createState() => _AccessCardState();
}

class _AccessCardState extends State<AccessCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 160.0,
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image(
                        image: AssetImage(widget.accessData[0].accImage),
                      )),
                ),
                Text(
                  widget.accessData[0].accName,
                  style: const TextStyle(
                      fontSize: 20.00, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      LaunchToInternet.launchURL(widget.accessData[0].accLink);
                    },
                    child: const Text('ABRIR'),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
