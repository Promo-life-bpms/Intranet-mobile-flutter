// This is a Custom TextField Widget
import 'package:flutter/material.dart';
import 'package:intranet_movil/model/aniversary.dart';
import 'package:intranet_movil/views/aniversary/widget/aniversary_grid.dart';

class AniversaryBuilder extends StatefulWidget {
  const AniversaryBuilder({Key? key, required this.aniversaryData})
      : super(key: key);
  final List<AniversaryModel> aniversaryData;

  @override
  State<AniversaryBuilder> createState() => _AniversaryBuilderState();
}

class _AniversaryBuilderState extends State<AniversaryBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          primary: false,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(0),
          itemCount: widget.aniversaryData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (BuildContext context, int index) {
            return AniversaryGrid(aniversaryData: [
              AniversaryModel(
                  id: widget.aniversaryData[index].id,
                  name: widget.aniversaryData[index].name,
                  lastname: widget.aniversaryData[index].lastname,
                  photo: widget.aniversaryData[index].photo,
                  date: widget.aniversaryData[index].date)
            ]);
          },
        ),
      ],
    );
  }
}
