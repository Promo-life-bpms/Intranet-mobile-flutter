import 'package:flutter/material.dart';
import 'package:intranet_movil/model/access.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/access/widget/access_builder.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const AccessPage());

class AccessPage extends StatefulWidget {
  const AccessPage({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<AccessPage> {
  
  List<String> accessName = ListIntranetConstants().accessName;
  List<String> accessImage = ListIntranetConstants().accessImage;
  List<String> accessLink =ListIntranetConstants().accessLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(StringIntranetConstants.accessPage),
      ),
      body: AccessBuilder(
        accessData: List<AccessData>.generate(
            accessName.length,
            (index) => AccessData(
                accessName[index], accessImage[index], accessLink[index])),
      ),
    );
  }
}
