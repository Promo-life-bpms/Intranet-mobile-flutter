import 'package:flutter/material.dart';
import 'package:intranet_movil/model/manual.dart';
import 'package:intranet_movil/services/internet.dart';
import 'package:intranet_movil/utils/constants.dart';

class ManualCard extends StatefulWidget {
  const ManualCard({Key? key, required this.manualData}) : super(key: key);

  final List<ManualModel> manualData;

  @override
  State<ManualCard> createState() => _ManualCardState();
}

class _ManualCardState extends State<ManualCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 160.0,
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image(
                      image: NetworkImage(
                          ApiIntranetConstans.baseUrl + widget.manualData[0].img),
                    )),
              ),
              Text(
                widget.manualData[0].name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.00,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    LaunchToInternet.launchURL(
                        ApiIntranetConstans.baseUrl + widget.manualData[0].file);
                  },
                  child: const Text('ABRIR'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
