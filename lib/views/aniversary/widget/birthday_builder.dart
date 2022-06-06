import 'package:flutter/material.dart';
import 'package:intranet_movil/model/aniversary.dart';
import 'package:intranet_movil/model/birthday.dart';
import 'package:intranet_movil/views/aniversary/widget/aniversary_grid.dart';

class BirthdayBuilder extends StatefulWidget {
  const BirthdayBuilder({Key? key, required this.brithdayData})
      : super(key: key);
  final List<BirthdayModel> brithdayData;

  @override
  State<BirthdayBuilder> createState() => _AniversaryBuilderState();
}

class _AniversaryBuilderState extends State<BirthdayBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          primary: false,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(0),
          itemCount: widget.brithdayData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (BuildContext context, int index) {
            return AniversaryGrid(aniversaryData: [
              AniversaryModel(
                  id: widget.brithdayData[index].id,
                  name: widget.brithdayData[index].name,
                  lastname: widget.brithdayData[index].lastname,
                  photo: widget.brithdayData[index].photo,
                  date: widget.brithdayData[index].date)
            ]);
          },
        ),
      ],
    );
  }
}
