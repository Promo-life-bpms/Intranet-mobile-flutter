import 'package:flutter/material.dart';
import 'package:intranet_movil/views/about/bh_page.dart';
import 'package:intranet_movil/views/about/promolife_page.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

//Inicializamos la clase SamplePage() en el metodo main()
void main() => runApp(const SamplePage());
//La clase SamplePage construye la estructura general del modulo
class SamplePage extends StatelessWidget {
  const SamplePage({Key? key}) : super(key: key);

  static const String _title = 'Pagina de ejemplo';
  //Se definen los principales metodos del Widget build, dicho widget es traido desde StatelessWidget
  //Conocido en POO como herencia
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(_title),
      ),
      // El body retorna un widget llamado const AccessWidget() 
      body: const AccessWidget(),
    );
  }
}

// El widget AccessWidget  es un StatelessWidget, lo que significa que no habra cambios durante su ejecucion
// Al extenderse de la clase StatelessWidget, se pueden acceder a todos los metodos y funciones existentes en el
class AccessWidget extends StatelessWidget {
  const AccessWidget({Key? key}) : super(key: key);

  // Los metodos utilziados por otra clase, se importan con el @override, debido a que puede ser modificada su estrcutura base
  @override
  Widget build(BuildContext context) {
    //Se esta retornando un SingleChildScrollView, el cual permite poder hacer scroll en la pantalla si esta rebala los limites
    return SingleChildScrollView(
      //Se debe especificar la direccion de scroll
      scrollDirection: Axis.vertical,
      //Apartir de aqui podemos utilizar los widgets que sean mas convenientes
      child:Column(
        children:<Widget> [
          //En este ejemplo se especifican 2 Card 
          //En caso de utilizar estrucuturas iguales se recomienda hacer widgets dinamicos mediante ListView.builder
          //Primera card
          Card(
            child: Column(
              children: <Widget>[
                // El contenido dentro de este children, puede ser moficado libremente 
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
                  TextButton( 
                  onPressed: () {
                    //Al extenderse de la clase StatelessWidget, podemos utilizar su contexto para navegacion entre pantallas
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const PromolifePage()));   
                  },
                  child: const Text('Ver mas'),
                  ),
                
              ],
            ),
          ),
          //Segunda card
          Card(
            child: Column(
              children: <Widget>[
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
                  TextButton( 
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const BHPage()));   
                  },
                  child: const Text('Ver mas'),
                  ),
                
              ],
            ),
          ),

        ],
      ),
 
    );
  }
}
