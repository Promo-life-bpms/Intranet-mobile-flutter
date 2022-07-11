import 'package:flutter/material.dart';
import 'package:intranet_movil/utils/constants.dart';

class NoDataBirthdayHomeBuilder extends StatefulWidget {
  const NoDataBirthdayHomeBuilder({Key? key})
      : super(key: key);

  @override
  State<NoDataBirthdayHomeBuilder> createState() => _BirthdayHomeBuilderState();
}

class _BirthdayHomeBuilderState extends State<NoDataBirthdayHomeBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: SizedBox(
            width: double.infinity,
            height: 120,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(0),
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: const [
                            SizedBox(
                                width: 70,
                                height: 70,
                                child: CircleAvatar(
                                  backgroundColor: ColorIntranetConstants
                                      .backgroundColorNormal,
                                )),
                            Padding(padding: EdgeInsets.only(top: 4)),
                          ],
                        )),
                  ],
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}
