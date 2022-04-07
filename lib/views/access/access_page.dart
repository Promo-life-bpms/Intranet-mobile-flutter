import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:url_launcher/url_launcher.dart';


void main() => runApp(const AccessPage());

class AccessPage extends StatelessWidget {
  const AccessPage({Key? key}) : super(key: key);

  static const String _title = 'Accesos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: const AccessWidget(),
    );
  }
}

/* Prueba git
 */
class AccessWidget extends StatelessWidget {
  const AccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child:Container(
        margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          children:<Widget> [
            Card(
              child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: <Widget> [
                  const SizedBox(
                    width: double.infinity,
                    height: 160.0,
                    child:FittedBox(
                      fit: BoxFit.contain,
                      child: Image(
                          image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                        )
                    ),
                  ),
                  const Text(
                    "Cursos",
                    style: TextStyle(fontSize: 20.00,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton( 
                  onPressed: () {
                    _launchURL("https://www.google.com.mx");
                  },
                  child: const Text('INICIAR SESION'),
                  ),
                ],
                ),
              ),
            ),

            Card(
              child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: <Widget> [
                  const SizedBox(
                    width: double.infinity,
                    height: 160.0,
                    child:FittedBox(
                      fit: BoxFit.contain,
                      child: Image(
                          image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                        )
                    ),
                  ),
                  const Text(
                    "Cursos",
                    style: TextStyle(fontSize: 20.00,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton( 
                  onPressed: () {
                    _launchURL("https://www.google.com.mx");
                  },
                  child: const Text('INICIAR SESION'),
                  ),
                ],
                ),
              ),
            ),

            Card(
              child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: <Widget> [
                  const SizedBox(
                    width: double.infinity,
                    height: 160.0,
                    child:FittedBox(
                      fit: BoxFit.contain,
                      child: Image(
                          image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                        )
                    ),
                  ),
                  const Text(
                    "Cursos",
                    style: TextStyle(fontSize: 20.00,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton( 
                  onPressed: () {
                    _launchURL("https://www.google.com.mx");
                  },
                  child: const Text('INICIAR SESION'),
                  ),
                ],
                ),
              ),
            ),

            Card(
              child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: <Widget> [
                  const SizedBox(
                    width: double.infinity,
                    height: 160.0,
                    child:FittedBox(
                      fit: BoxFit.contain,
                      child: Image(
                          image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                        )
                    ),
                  ),
                  const Text(
                    "Cursos",
                    style: TextStyle(fontSize: 20.00,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton( 
                  onPressed: () {
                    _launchURL("https://www.google.com.mx");
                  },
                  child: const Text('INICIAR SESION'),
                  ),
                ],
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}

void _launchURL(_url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}



