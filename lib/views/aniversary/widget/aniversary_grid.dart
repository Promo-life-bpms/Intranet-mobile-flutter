import 'package:flutter/material.dart';
import 'package:intranet_movil/model/aniversary.dart';
import 'package:intranet_movil/utils/constants.dart';

class AniversaryGrid extends StatefulWidget {
  const AniversaryGrid({Key? key, required this.aniversaryData})
      : super(key: key);

  final List<AniversaryModel> aniversaryData;

  @override
  State<AniversaryGrid> createState() => _AniversaryGridState();
}

class _AniversaryGridState extends State<AniversaryGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: CircleAvatar(
            backgroundImage: NetworkImage(ApiIntranetConstans.baseUrl +
                widget.aniversaryData[0].photo.toString()),
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(left: 1, top: 10, right: 5, bottom: 4)),
        SizedBox(
          width: 100,
          height: 30,
          child: Text(
              widget.aniversaryData[0].name +
                  " " +
                  widget.aniversaryData[0].lastname,
              style: const TextStyle(
                fontSize: 12.00,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
        Center(
            child: widget.aniversaryData[0].date == 1
                ? Text(
                    widget.aniversaryData[0].date.toString() + " " + StringIntranetConstants.aniversaryYear,
                    style: const TextStyle(fontSize: 12.00),
                    textAlign: TextAlign.center)
                : Text(
                    widget.aniversaryData[0].date.toString() + " " + StringIntranetConstants.aniversaryYears,
                    style: const TextStyle(fontSize: 12.00),
                    textAlign: TextAlign.center)),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
      ],
    );
  }
}
