import 'package:flutter/material.dart';
import 'package:intranet_movil/model/birthday.dart';
import 'package:intranet_movil/utils/constants.dart';

class BirthdayGrid extends StatefulWidget {
  const BirthdayGrid({Key? key, required this.birthdayData}) : super(key: key);

  final List<BirthdayModel> birthdayData;

  @override
  State<BirthdayGrid> createState() => _BirthdayGridState();
}

class _BirthdayGridState extends State<BirthdayGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: CircleAvatar(
            backgroundImage: NetworkImage(ApiIntranetConstans.baseUrl +
                widget.birthdayData[0].photo.toString()),
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(left: 1, top: 10, right: 5, bottom: 4)),
        SizedBox(
          width: 100,
          height: 30,
          child: Text(
              widget.birthdayData[0].name +
                  " " +
                  widget.birthdayData[0].lastname,
              style: const TextStyle(
                fontSize: 12.00,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
        Center(
            child: Text(widget.birthdayData[0].date,
                style: const TextStyle(fontSize: 10.00),
                textAlign: TextAlign.center)),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
      ],
    );
  }
}
