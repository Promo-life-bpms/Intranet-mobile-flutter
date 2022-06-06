# Proyecto 

## Dependencias y librerías

-  cupertino_icons: 1.0.2
-  http: 0.13.4
-  url_launcher: 6.0.20
-  lottie: 1.3.0
-  flutter_svg: 1.0.3
-  provider: 6.0.2
-  device_info_plus: 3.2.3
-  shared_preferences: 2.0.13
-  skeletons: 0.0.3
-  cached_network_image: 3.2.0
-  pagination_view: 2.0.0
-  intl: 0.17.0
-  flutter_tags: 0.4.9+1
-  carousel_slider: 4.1.1
-  badges: 2.0.2
-  flutter_native_splash: 2.1.6

## Estructura de carpetas 

- /lib
    - /assets
    - /model
    - /services
    - /utils
    - /views
        - /about
        - /access
        - /aniversary
        - /auth
        - /communicate
        - /directory
        - /employee_month
        - /home
        - /manual
        - /organization
        - /profile
        - /request
    - /widget
        - /alerts
        - /skeletons
    - main.dart


# Código 

##  /lib

Aqui se especifica todo el código del proyecto

<details>
	<summary>/assets</summary>
    
Esta carpeta almacena los recursos utilizados durante todo el ciclo de vida de la aplicación, en los que se incluye archivos en formano .png, .jpg y .json

</details>

<details>
	<summary>/model</summary>

Esta carpeta almacena modelos de datos, los cuales son consumidos por Listas o APIS y convertidos para que la app movil pueda utilizarlos.    

**access.dart**

Utilizado para llenar datos de una lista estática 

```dart
    class AccessData {
        final String accName;
        final String accImage;
        final String accLink;

        const AccessData(this.accName, this.accImage, this.accLink);
    }
```

**aniversary.dart**

Utilizado para consumir datos desde internet, del endpoint de aniversarios.

```dart
    import 'dart:convert';

    List<AniversaryModel> aniversaryModelFromJson(String str) =>
        List<AniversaryModel>.from(
            json.decode(str).map((x) => AniversaryModel.fromJson(x)));

    String aniversaryModelToJson(List<AniversaryModel> data) =>
        json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

    class AniversaryModel {
    AniversaryModel({
        required this.id,
        required this.name,
        required this.lastname,
        required this.photo,
        required this.date,
    });

    int id;
    String name;
    String lastname;
    String photo;
    String date;

    factory AniversaryModel.fromJson(Map<String, dynamic> json) =>
        AniversaryModel(
            id: json["id"],
            name: json["name"],
            lastname: json["lastname"],
            photo: json["photo"],
            date: json["date"],
        );

    Map<String, dynamic> toJson() => {
            "id": id,
            "name": name,
            "lastname": lastname,
            "photo": photo,
            "date": date,
        };
    }

```

La estructura es la misma en todos los archivos, cambiando solo los datos de las clases.

</details>


<details>
	<summary>/services</summary>
    
Esta carpeta almacena clases que son intermediarios entre los modelos y la APIs. 

**api_aniversary.dart**

Envia una petición de tipo GET al endpoint especificado, en caso de recibir un status 200, traduce los datos obtenidos mediante su modelo, para que puedan ser utilizados en la aplicación.

```dart
    
    class ApiAniversaryService {
        Future<List<AniversaryModel>?> getAniversary() async {
            try {
            var url = Uri.parse(ApiIntranetConstans.baseUrl +
                ApiIntranetConstans.monthAniveraryEndpoint);
            var response = await http.get(url);
            if (response.statusCode == 200) {
                List<AniversaryModel> _model = aniversaryModelFromJson(response.body);
                return _model;
            }
            } catch (e) {
            log(e.toString());
            }
            return null;
        }
    }

```

**post_comment.dart**

Envia una petición de tipo POST al endpoint junto con los datos locales,  en caso de recibir un status 200, realiza una acción dentro de la aplicación movil. 

```dart
    
    Future postComment(String token, String publicationID, String content) async {
    String url = ApiIntranetConstans.baseUrl + ApiIntranetConstans.postComment;
    final response = await http.post(Uri.parse(url), body: {
      'token': token,
      'publicationID': publicationID,
      'content': content,
    }, headers: {
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      return true;
    }
    if (response.statusCode == 422) {
      return false;
    }

    return false;
  }

```

**internet.dart**

Se incluyo dentro de los servicios la clase de internet, la cual recibe una url y manda una petición al navegador web, para abrir la ruta especificada. 

```dart
    
    class LaunchToInternet{
        static launchURL(_url) async {
            if (!await launch(_url)) throw 'Could not launch $_url';
        }
    }

```
La estructura de las otras clases es la misma que la anterior especificada, cambiando los datos utilizados.

</details>


<details>
	<summary>/utils</summary>

Carpeta que almacena porciónes de código que puede ser utilziadas en cualquier parte de la aplicación.

**constants.dart**

En este archivo se incluyeron las principales constantes de la aplicación, siendo en su mayoria textos.

```dart
    import 'package:flutter/material.dart';

    class ApiIntranetConstans {
    static String baseUrl = 'https://dev-intranet.promolife.lat/';

    static String loginEndpoint = 'api/login' ;
    static String getUser = 'api/getUser/' ;
    static String getRequest = 'api/getRequest/' ;
    static String postRequestEndpoint = 'api/postRequest' ;
    static String manualEndpoint = 'api/manuals' ;
    static String monthEmployeeEndpoint = 'api/month-employees/';
    static String monthAniveraryEndpoint =  'api/month-anniversaries/';
    static String monthBirthdayEndpoint = 'api/month-birthdays/';
    static String communicateEndpoint = 'api/communicate/';
    static String directoryEndponit = 'api/directory/';
    static String organizationEndpoint = '/api/organization/';
    static String postPublication = 'api/postPublications';
    static String getPublication = 'api/getPublications/';
    static String postLike = 'api/postLike';
    static String postUnlike = 'api/postUnlike';
    static String getComment = 'api/showComments/';
    static String postComment = 'api/postComment';
    static String getEmployeeProfile = 'api/getProfile/';
    }

    class StringIntranetConstants{
    static const homePage = "Inicio";
    static const aboutPage = "Acerca de";
    static const organizationPage = "Organigrama";
    static const requestPage = "Solicitudes";
    static const directoryPage = "Directorio";
    static const aniversaryBirthdayPage = "Cumpleaños y Aniversarios";
    static const monthPage = "Empleado del Mes";
    static const communiquePage = "Comunicados";
    static const manualPage = "Manuales";
    static const accessPage = "Accesos";
    static const logoutPage = "Cerrar sesión";
    static const profilePage = "Mi cuenta";
    static const loginPage = "Iniciar sesión";

    static const requestCreatePage = "Crear solicitud";
    static const requestApprovedPage = "Aprobadas";
    static const requestPendingPage = "Pendientes";
    static const requestProcessPage = "En proceso";
    static const requestRejectedPage = "Rechazadas";

    static const organizationCancunPage = "Cancún";
    static const organizationCommunicationPage = "Comunicación";
    static const organizationDesingPage = "Diseño";
    static const organizationDirectoryPage = "Dirección";
    static const organizationImportPage = "Importaciones";
    static const organizationLogisticPage ="Logística";
    static const organizationManagementPage= "Administración";
    static const organizationMarketingPage = "Marketing";
    static const organizationOperationPage = "Operaciones";
    static const organizationRHPage="Recursos Humanos";
    static const organizationSalesBHPage = "Ventas BH";
    static const organizationSalesPLPage = "Ventas PL";
    static const organizationStorePage = "Almacén";
    static const organizationSystemPage = "Sistemas";
    static const organizationTechnologyPage ="Tecnología e Innovación";

    static const aboutBHPage = "Acerca de BH ";
    static const aboutPLPage = "Acerca de Promolife";

    static const aniversaryBirthdayAniversaryPage ="Aniversarios";
    static const aniversaryBirthdayBirthdayPage = "Cumpleaños";

    static const homePublicationEmpty = "Sin publicaciones disponibles";
    static const homeCreatePost = "Crear publicación";
    static const homeThink = "¿Qué esta pensando?";
    static const homeSuccessfulPost = "Publicación creada satisfactoriamente";

    static const publicationPostCommentSuccesful="Comentario enviado satisfactoriamente";

    static const emptyError ="Este campo no puede estar vacío";
    } 

    class ListIntranetConstants{
    final List<String> accessName = <String>[
        'CURSOS',
        'ODDO',
        'EVALUACIÓN 360',
        'NOM 035',
        'Cotizador',
        'Sistema de Tickets',
        'Power BI'
    ];
    final List<String> accessImage = <String>[
        'lib/assets/course.png',
        'lib/assets/odoo.png',
        'lib/assets/evaluacion.png',
        'lib/assets/nom.png',
        'lib/assets/cotizador.png',
        'lib/assets/tickets.png',
        'lib/assets/powerbi.png'
    ];
    final List<String> accessLink = <String>[
        'https://dev-cursos.promolife.lat/loginEmail?email=admin@admin.com&password=password',
        'https://promolife.vde-suite.com:8030/web/login',
        'https://evaluacion.promolife.lat/login',
        'https://plataforma.nom-035.net/',
        'https://promolife.lat/login/?redirect_to=https%3A%2F%2Fpromolife.lat%2F',
        'https://tdesign.promolife.lat/',
        'https://app.powerbi.com/singleSignOn?ru=https:%2f%2fapp.powerbi.com%2f%3fnoSignUpCheck%3d1'
    ];
    }
    class ColorIntranetConstants{
    static const primaryColorDark = Color(0XFF1A346B);
    static const primaryColorNormal = Color(0XFF006EAD);
    static const primaryColorLight = Color(0XFF0084C3);

    static const backgroundColorDark = Color(0XFFE3E4E4);
    static const backgroundColorNormal = Color(0XFFF4F4F4);
    static const backgroundColorLight = Color(0XFFFFFFFF);

    static const backgroundCustomLight =Color(0xffF2F6FB);
    static const redLight = Color(0xFFfc9990);
    
    }

```

</details>

<details>
	<summary>main.dart</summary>

Clase principal de la aplicación, en este archivo se valida el inicio de sesión del usuario mediante un token.

```dart
// Metodo Main de la aplicación
void main() {
    // Retorna el estado del inicio de sesion
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => AuthProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MyApp> {
    //Inicialización de variables
  late List<UserModel>? _userModel = [];
  late String? _token = "";

  @override
  void initState() {
    super.initState();
    _getData();
  }
    // Función asíncrona que retorna el token y valida la información del usuario en la riable _userModel
  void _getData() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    _userModel =
        (await ApiUserService().getUsers(_token.toString()))!.cast<UserModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return 
     MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      //Tema custom de la aplicación
       theme: ThemeData(
        primaryColor: ColorIntranetConstants.primaryColorLight, 
        primaryColorLight: ColorIntranetConstants.primaryColorLight,
        primaryColorDark: ColorIntranetConstants.primaryColorDark,
        backgroundColor: ColorIntranetConstants.backgroundColorDark,
        scaffoldBackgroundColor: ColorIntranetConstants.backgroundColorNormal,
        hoverColor: ColorIntranetConstants.primaryColorLight,
        appBarTheme: const AppBarTheme(backgroundColor: ColorIntranetConstants.primaryColorLight) 
        ),
      home:  Scaffold(
        body:  
        //Valida la información del usuario 
        _userModel == null || _userModel!.isEmpty 
        ?Center(
            //En caso de estar autenticado, lo manda a la pagina de inicio, de lo contrario es mandado al formulario para iniciar sesión.
            child: Consumer<AuthProvider>(
              builder: (context, auth, child) {
                switch (auth.isAuthenticated) {
                  case true:
                    return  const HomePage();
                  default:
                    return  const LoginForm();
                }
              },
            )
        )
        : // Si la información del usuario es valida, lo manda a la pagina de inicio
         const HomePage()          
      )
    );
  }
}

```

</details>



