// This is a Custom TextField Widget
import 'package:flutter/material.dart';
import 'package:intranet_movil/model/communique.dart';
import 'package:intranet_movil/utils/constants.dart';

class CommuniqueCard extends StatefulWidget {
  const CommuniqueCard({Key? key, required this.commuiqueData})
      : super(key: key);

  final List<CommuniqueModel> commuiqueData;

  @override
  State<CommuniqueCard> createState() => _CommuniqueCardState();
}

class _CommuniqueCardState extends State<CommuniqueCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 320.0,
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image(
                      image: NetworkImage(ApiIntranetConstans.baseUrl +
                          widget.commuiqueData[0].image),
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Text(
                widget.commuiqueData[0].title,
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Image(
                            image: NetworkImage(ApiIntranetConstans.baseUrl +
                                widget.commuiqueData[0].image))));
                  },
                  child: const Text('VER MAS'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
