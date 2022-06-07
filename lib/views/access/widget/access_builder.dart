import 'package:flutter/material.dart';
import 'package:intranet_movil/model/access.dart';
import 'package:intranet_movil/views/access/widget/access_widget.dart';

class AccessBuilder extends StatefulWidget {
  const AccessBuilder({Key? key, required this.accessData})
      : super(key: key);
  final List<AccessData> accessData;

  @override
  State<AccessBuilder> createState() =>
      _AccessBuilderState();
}

class _AccessBuilderState extends State<AccessBuilder> {
  @override
 Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: widget.accessData.length,
      itemBuilder: (context, index) {
        return AccessCard(accessData: [
          AccessData(widget.accessData[index].accName, widget.accessData[index].accImage,
              widget.accessData[index].accLink)
        ]);
      },
    );
  }
}
