// This is a Custom TextField Widget
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FlagsWidget extends StatefulWidget {
  const FlagsWidget({Key? key}) : super(key: key);

  @override
  State<FlagsWidget> createState() => _FlagsWidgetState();
}

class _FlagsWidgetState extends State<FlagsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          width: 750,
          child: Lottie.asset("lib/assets/flags.json"),
        ),
      ],
    );
  }
}
