import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const AboutBH());

class AboutBH extends StatelessWidget {
  const AboutBH({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: PromolifeView(),
    );
  }
}

class PromolifeView extends StatelessWidget {
  const PromolifeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('BH'),
      ), 
      body: const Center(
        child: Text(
          'This is the home page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}


/* 
class BHView extends State<BH> {
 
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [

          const SizedBox(height: 100,),

           const SizedBox(
            width: 200,
            height: 200, 
            child: Image(
              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            )
            
          ),
          

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Debes llenar todos los campos';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(top: 20), 
                isDense: true,
                hintText: "Correo",
                prefixIcon: Padding(
                  padding: EdgeInsets.only(top: 15), 
                  child: Icon(Icons.mail),
                ),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child:TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Debes llenar todos los campos';
                }
                return null;
                
              },
              obscureText: true,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(top: 20), 
                isDense: true,
                hintText: "Contrasena",
                prefixIcon: Padding(
                  padding: EdgeInsets.only(top: 15), 
                  child: Icon(Icons.password_rounded),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 20,),
          
        ],
      ),
    );
  }
}
 */