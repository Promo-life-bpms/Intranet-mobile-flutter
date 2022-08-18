import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intranet_movil/services/post_publication.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CreatePostPage> {
  late String token = "";

  final _formKey = GlobalKey<FormState>();
  final _contentPublication = TextEditingController();

  late String filePathString = "";
  late File filePath;
  bool loadFuture = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<File?> _getImage() async {
    if (loadFuture == true) {
      ImagePicker _picker = ImagePicker();
      // Pick an image
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      //TO convert Xfile into file
      File file = File(image!.path);
      filePath = file;

      filePathString = file.toString();
      loadFuture = false;

      return file;
    }
    return null;
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
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return StringIntranetConstants.emptyError;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    counterText: "",
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
              const Padding(padding: EdgeInsets.only(top: 16)),
              FutureBuilder(
                  future: _getImage(),
                  builder:
                      (BuildContext context, AsyncSnapshot<File?> snapshot) {
                    if (snapshot.data != null) {
                      return Column(
                        children: [
                          /*  Image.file(snapshot.data!), */
                          Container(
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(snapshot.data!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          snapshot.data!.delete();
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )),
                                )),
                          ),
                          Container(
                            width: double.infinity,
                            height: 60,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 216, 216,
                                    216), //                   <--- border color
                                width: 0.3,
                              ),
                            ),
                            child: InkWell(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.photo_camera,
                                    color: ColorIntranetConstants
                                        .primaryColorNormal,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 8)),
                                  Text("Cambiar imagen")
                                ],
                              ),
                              onTap: () {
                                if (loadFuture == false) {
                                  loadFuture = true;
                                }
                                _getData();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 32),
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
                                        // ignore: unrelated_type_equality_checks
                                        if (_contentPublication.text.isNotEmpty || snapshot.data != null ||  snapshot.data != "")
                                          {
                                            //Notifica al usuario que se envio el mensaje
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text(
                                                  StringIntranetConstants
                                                      .homeSuccessfulPost),
                                            )),

                                            _asyncFileUpload(
                                                "test",
                                                snapshot.data,
                                                token,
                                                _contentPublication.text
                                                    .toString()),

                                            //Retorna al usuario a la pagina principal, destruyendo la página de publicaciones
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomePage()),
                                                ModalRoute.withName(
                                                    "/HomePost"))
                                          }
                                        else
                                          {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content:
                                                  Text("Sin datos por enviar"),
                                            )),
                                          }
                                      },
                                  child: const Text(
                                      StringIntranetConstants.buttonPost)),
                            ),
                          )
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 60,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 216, 216,
                                    216), //                   <--- border color
                                width: 0.3,
                              ),
                            ),
                            child: InkWell(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.photo_camera,
                                    color: ColorIntranetConstants
                                        .primaryColorNormal,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 8)),
                                  Text("Subir imagen")
                                ],
                              ),
                              onTap: () {
                                if (loadFuture == false) {
                                  loadFuture = true;
                                }
                                _getData();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 32),
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
                                        if (snapshot.data == null &&
                                            _contentPublication.text
                                                    .toString() ==
                                                "")
                                          {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "No se puede enviar una publicación vacia"),
                                            )),
                                          }
                                        else
                                          {
                                            _asyncFileUpload(
                                                "test",
                                                null,
                                                token,
                                                _contentPublication.text
                                                    .toString()),

                                            //Notifica al usuario que se envio el mensaje
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text(
                                                  StringIntranetConstants
                                                      .homeSuccessfulPost),
                                            )),

                                            //Retorna al usuario a la pagina principal, destruyendo la página de publicaciones
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomePage()),
                                                ModalRoute.withName(
                                                    "/HomePost"))
                                          }
                                      },
                                  child: const Text(
                                      StringIntranetConstants.buttonPost)),
                            ),
                          )
                        ],
                      );
                    }
                  }),
            ],
          ),
        ),
        );
  }
}

_asyncFileUpload(
    String text, File? file, String token, String contentPublication) async {
  String photoURL = "";
  String url =
      ApiIntranetConstans.baseUrl + ApiIntranetConstans.postImagePublication;

  if (file == null) {
    postPublication(token, contentPublication, "");
  } else {
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields["name"] = text;
    request.files.add(http.MultipartFile(
        'image', file.readAsBytes().asStream(), file.lengthSync(),
        filename: file.path.split('/').last));

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);

      photoURL = responseString;
      String photoURLtoSend = (photoURL.replaceAll("storage/posts/", ""));

      postPublication(token, contentPublication, photoURLtoSend);
    } else {
      postPublication(token, contentPublication, "");
    }
  }
}
