import 'package:flutter/material.dart';
import 'package:intranet_movil/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(const Login());

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Iniciar sesion';

    return const MaterialApp(
      title: appTitle,
      home: Scaffold(
        body: LoginForm(),    
      ),
    );
  }
}

/* class LoginForm extends StatefulWidget {
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const MainPage()));   
              },
                child: const Text('INICIAR SESION'),

            ),
          ),

          
        ],
      ),
    );
  }
} */


class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  String _errorMessage = '';
  
  
  Future<void> submitForm() async {
    setState(() {
      _errorMessage = '';
    });
    bool result = await Provider.of<AuthProvider>(context, listen: false).login(_email, _password);
    if (result == false) {
      setState(() {
        _errorMessage = 'There was a problem with your credentials.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Email',
                  icon: Icon(
                    Icons.mail,
                  )
              ),
              validator: (value) => value!.isEmpty ? 'Please enter an email address' : null,
              onSaved: (value) => _email = value.toString(),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Password',
                icon: Icon(
                  Icons.lock,
                ),
              ),
              obscureText: true,
              validator: (value) => value!.isEmpty ? 'Please enter a password' : null,
              onSaved: (value) => _password = value.toString(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
              child: Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    submitForm();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}