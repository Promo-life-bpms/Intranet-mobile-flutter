import 'package:flutter/material.dart';
import 'package:intranet_movil/services/post_publication.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CreatePostPage> {
  late String token = "";

  final _formKey = GlobalKey<FormState>();
  final _contentPublication = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final prefs = await SharedPreferences.getInstance();
    String? _token = prefs.getString('token');
    if (_token != null || _token!.isNotEmpty) {
      token = _token;
    }
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(StringIntranetConstants.homeCreatePost),
        ),
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Widget del TextFormField
                  Container(
                    color: Colors.white,
                    child: Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return StringIntranetConstants.emptyError;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(15.0),
                          hintText: StringIntranetConstants.homeThink,
                        ),
                        maxLines: 4,
                        maxLength: 250,
                        controller: _contentPublication,
                      ),
                    ),
                  ),
                  //Wisget del ElevatedButton 
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: ColorIntranetConstants
                                .primaryColorNormal, // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () => {
                                //Al presionar el boton de la publicacion, valida si es contenido del TextFromField no se encuentra vacio. 
                                if (_contentPublication.text.isNotEmpty)
                                  {
                                    //Notifica al usuario que se envio el mensaje
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                          StringIntranetConstants.homeSuccessfulPost),
                                    )),
                                    //Envia al servidor una peticion de tipo POST con la información del usuario.
                                    postPublication(token,
                                        _contentPublication.text.toString()),
                                    //Retorna al usuario a la pagina principal, destruyendo la página de publicaciones
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage()),
                                        ModalRoute.withName("/HomePost"))
                                  }
                                else
                                  {_formKey.currentState!.validate()}
                              },
                          child: const Text(StringIntranetConstants.buttonPost)),
                    ),
                  )
                ],
              ),
            )));
  }


}
