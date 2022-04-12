import 'package:flutter/material.dart';
import 'package:intranet_movil/model/access.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const AccessPage());

class AccessPage extends StatefulWidget {
  const AccessPage({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<AccessPage> {
  final List<String> accessName = <String>['CURSOS', 'ODDO', 'EVALUACIÓN 360', 'NOM 035', 'Cotizador','Sistema de Tickets','Power BI'];
  final List<String> accessImage = <String>['lib/assets/course.png', 'lib/assets/odoo.png','lib/assets/evaluacion.png', 'lib/assets/nom.png', 'lib/assets/cotizador.png', 'lib/assets/tickets.png','lib/assets/powerbi.png'];
  final List<String> accessLink = <String>['https://dev-cursos.promolife.lat/loginEmail?email=admin@admin.com&password=password', 'https://promolife.vde-suite.com:8030/web/login', 'https://evaluacion.promolife.lat/login', 'https://plataforma.nom-035.net/', 'https://promolife.lat/login/?redirect_to=https%3A%2F%2Fpromolife.lat%2F','https://tdesign.promolife.lat/','https://app.powerbi.com/singleSignOn?ru=https:%2f%2fapp.powerbi.com%2f%3fnoSignUpCheck%3d1'];

  static const String _title = 'Accesos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: CardImageLinkWidget(
        accessData : List<AccessData>.generate(accessName.length, (index) => AccessData(accessName[index], accessImage[index],accessLink[index])),            
      ),
    );
  }
}

// Funcion que abre url en el navegador
void _launchURL(_url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}


//Widget dinamico
class CardImageLinkWidget  extends StatelessWidget {
  const CardImageLinkWidget({Key? key, required this.accessData}) : super(key: key);

  //Obtiene la estructura de la lista desde el modelo
  final List<AccessData> accessData;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: accessData.length,
        itemBuilder: (context, index) {
          return Card(
          child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              children: <Widget> [
              SizedBox(
                width: double.infinity,
                height: 160.0,
                child:FittedBox(
                  fit: BoxFit.contain,
                  child: Image(
                      image: AssetImage(accessData[index].accImage),
                    )
                ),
              ),
                Text(
                accessData[index].accName,
                style: const TextStyle(fontSize: 20.00,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              ElevatedButton( 
              onPressed: () {
                _launchURL(accessData[index].accLink); 
              },
              child: const Text('ABRIR'),
              ),
            ],
            ),
          ),
        );
      },
    );
  }
}

