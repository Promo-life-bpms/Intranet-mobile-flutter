import 'package:flutter/material.dart';
import 'package:intranet_movil/model/birthday.dart';
import 'package:intranet_movil/views/home/widget/user_birthday_card.dart';

class BirthdayHomeBuilder extends StatefulWidget {
  const BirthdayHomeBuilder({Key? key, required this.birthdayData})
      : super(key: key);
  final List<BirthdayModel> birthdayData;

  @override
  State<BirthdayHomeBuilder> createState() => _BirthdayHomeBuilderState();
}

class _BirthdayHomeBuilderState extends State<BirthdayHomeBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 0),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
              child: SizedBox(
            width: double.infinity,
            height: 140,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(0),
              itemCount: widget.birthdayData.length,
              itemBuilder: (BuildContext context, int index) {
                return UserBirthdayCard(birthdayData: [
                  BirthdayModel(
                      id: widget.birthdayData[index].id,
                      name: widget.birthdayData[index].name,
                      lastname: widget.birthdayData[index].lastname,
                      photo: widget.birthdayData[index].photo,
                      date: widget.birthdayData[index].date)
                ]);
              },
            ),
          )),
        ],
      ),
    );
  }
}
