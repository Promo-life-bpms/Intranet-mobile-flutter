import 'package:flutter/material.dart';
import 'package:intranet_movil/model/access.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/widget/cards/access_card.dart';
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
      body: CardImageLinkWidget(
        accessData: List<AccessData>.generate(
            accessName.length,
            (index) => AccessData(
                accessName[index], accessImage[index], accessLink[index])),
      ),
    );
  }
}

//Widget dinamico
class CardImageLinkWidget extends StatelessWidget {
  const CardImageLinkWidget({Key? key, required this.accessData})
      : super(key: key);

  //Obtiene la estructura de la lista desde el modelo
  final List<AccessData> accessData;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: accessData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: AccessCard(accessData: [
            AccessData(accessData[index].accName, accessData[index].accImage,
                accessData[index].accLink)
          ]),
        );
      },
    );
  }
}
