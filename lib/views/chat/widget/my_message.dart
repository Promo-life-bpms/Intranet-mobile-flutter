import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:intranet_movil/services/internet.dart';
import 'package:intranet_movil/utils/constants.dart';

class MyMessageItem extends StatefulWidget {
  const MyMessageItem(
      {Key? key, required this.conversation, required this.created})
      : super(key: key);

  final String conversation;
  final String created;

  @override
  State<MyMessageItem> createState() => _MyMessageItemState();
}

class _MyMessageItemState extends State<MyMessageItem> {
  @override
  Widget build(BuildContext context) {
    return widget.created == ""
        ? const Padding(padding: EdgeInsets.zero)
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Container(
                  decoration: const BoxDecoration(
                    color: ColorIntranetConstants.primaryColorNormal,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: SelectableLinkify(
                    onOpen: (link) =>
                        LaunchToInternet.launchURL(widget.conversation),
                    text: widget.conversation,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.justify,
                  ),
                ),
              )
            ],
          );
  }
}
