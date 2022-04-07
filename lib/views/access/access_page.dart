import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

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
    return  Column(
      children: [
        Card(
          child: Column(
            children: <Widget>[
              const SizedBox(
                  height: 150.0,
                  child:FittedBox(
                    fit: BoxFit.fill,
                    child: Image(
                        image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                      )
                  ), 
                
              ),
              const ListTile(
                title: Text("Cursos"),
              ),
              ElevatedButton(
                onPressed: () {
                    
                },
                child: const Text('INICIAR SESION'),
                ),
              ],
          ),
        ),
        Card(
          child: Column(
            children: <Widget>[
              const SizedBox(
                  height: 150.0,
                  child:FittedBox(
                    fit: BoxFit.fill,
                    child: Image(
                        image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                      )
                  ), 
                
              ),
              const ListTile(
                title: Text("Cursos"),
              ),
              ElevatedButton(
                onPressed: () {
                    
                },
                child: const Text('INICIAR SESION'),
                ),
              ],
          ),
        ),
      ],
      
    );
  }
}


