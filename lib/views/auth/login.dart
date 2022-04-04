import 'package:flutter/material.dart';
import 'package:intranet_movil/views/home/home.dart';

void main() => runApp(const Login());

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Iniciar sesion';

    return const MaterialApp(
      title: appTitle,
      home: Scaffold(
        /* appBar: AppBar(
          title: const Text(appTitle),
          
        ), */
        body: LoginForm(),    
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormView createState() {
    return LoginFormView();
  }
}

class LoginFormView extends State<LoginForm> {
 
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,

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

          SizedBox(
            width: 200,
            height: 50, 
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomePage()));   
              },
                child: const Text('INICIAR SESION'),

            ),
          ),

          
        ],
      ),
    );
  }
}