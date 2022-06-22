import 'package:flutter/material.dart';
import 'package:intranet_movil/utils/constants.dart';

class MyMessageItem extends StatefulWidget {
  const MyMessageItem({Key? key, required this.conversation,required this.created}) : super(key: key);

  final String conversation;
  final String created;

  @override
  State<MyMessageItem> createState() => _MyMessageItemState();
}

class _MyMessageItemState extends State<MyMessageItem> {
  @override
  Widget build(BuildContext context) {
    return widget.created == "no data"?
     const Padding(padding: EdgeInsets.zero)
    :
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            decoration: const BoxDecoration(
              color: ColorIntranetConstants.primaryColorNormal,
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Text(widget.conversation,
                style: const TextStyle(color: Colors.white)))
      ],
    );
  }
}
