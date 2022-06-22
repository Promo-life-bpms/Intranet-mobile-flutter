import 'package:flutter/material.dart';
import 'package:intranet_movil/utils/constants.dart';

class OtherMessageItem extends StatefulWidget {
  const OtherMessageItem({Key? key, required this.conversation})
      : super(key: key);

  final String conversation;

  @override
  State<OtherMessageItem> createState() => _OtherMessageItemState();
}

class _OtherMessageItemState extends State<OtherMessageItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            decoration: const BoxDecoration(
              color: ColorIntranetConstants.backgroundColorDark,
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Text(widget.conversation,
                style: const TextStyle(color: Colors.black)))
      ],
    );
  }
}
