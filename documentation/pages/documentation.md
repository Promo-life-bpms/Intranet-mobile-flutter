# Documentación

## **Diseño**

### Wireframes

<img src="../img/wireframes.png" alt="wireframes">

### Mockups

<img src="../img/mockups.png" alt="mockups">

### Flow chart

<img src="../img/flowchart.png" alt="flowchart">


## **Estructura de carpetas** 

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


### Generalidades de las carpetas 

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

Carpeta que almacena porciónes de código que puede ser utilizadas en cualquier parte de la aplicación.

**constants.dart**

En este archivo se incluyeron las principales constantes de la aplicación, siendo en su mayoria textos.

```dart

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
	<summary>/views</summary>
    
Esta carpeta almacena los principales módulos de toda la aplicación, se encuentra separada de acuerdo a su funciónalidad. 

Los módulos contienen una subcarpeta llamada /widget, la cual contiene widgets utilizados en el archivo principal del módulo, separando las funcionalidades.

**/about**

Muestra información acerca de las empresas BH y Promolife, se encuentra didivido en 3 archivos:

**/access**

Muestra accesos directos a las diferentes plataformas y sistemas que cuenta la empresa.

**/aniversary**

Carpeta que almacena los modulos de cumpleaños y aniversarios.

**/auth**

Carpeta que almanena los módulos de inicio y cierre de sesión.

**/communicate**

Carpeta que almacena el módulo de los comunicados.

**/directory**

Carpeta que almacena el módulo del directorio.

**/employee-month**

Carpeta que almacena el módulo de los empleados del mes.

**/home**

Carpeta que almacena el módulo de Home o Inicio.

**/manual**

Carpeta que almacena el módulo de los manuales.


**/organization**

Carpeta que almacena el módulo del organigrama.

**/profile**

Carpeta que almacena el módulo de perfil de usuario

**/request**

Carpeta que almacena el módulo de las solcitudes.

</details>

<details>
	<summary>/widget</summary>
    
Esta carpeta almacena widgets globales de la aplicación, es decir, widgets que se pueden utilizar en mas de un módulo, solo si cumplen con los requisitos para su uso. 

**navigation_drawer_widget.dart**

```dart
    
    class NavigationDrawerWidget extends StatefulWidget {
    const NavigationDrawerWidget({Key? key}) : super(key: key);

    @override
    _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
    }

    class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
    late List<UserModel>? _userlModel = [];
    static var _selectedDrawerItem = 0;

    @override
    void initState() {
        super.initState();
        _getData();
    }

    void _getData() async {
        final prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString('token');
        _userlModel = (await ApiUserService().getUsers(token.toString()))!.cast<UserModel>();
        Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    }


    @override
    Widget build(BuildContext context) {
        return Drawer(
        child: Material(
            child: ListView(
            children: <Widget>[
                _userlModel == null || _userlModel!.isEmpty
                ? UserAccountsDrawerHeader(
                accountName: const Text("Obteniendo nombre ..."),
                accountEmail: const Text("Obteniendo email ..."),
                currentAccountPicture: CircleAvatar(
                    child: InkWell(
                    onTap: ()=>Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const UserProfilePage())),
                    ),
                    backgroundColor: ColorIntranetConstants.primaryColorLight,
                ),
                )
                :UserAccountsDrawerHeader(
                accountName: Text(_userlModel![0].fullname),
                accountEmail: Text(_userlModel![0].email),
                currentAccountPicture: CircleAvatar(
                    child: InkWell(
                    onTap: ()=>Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const UserProfilePage())),
                    ),
                    backgroundImage: NetworkImage(ApiIntranetConstans.baseUrl+_userlModel![0].photo),
                ),
                ),
                ListTile(
                leading: const Icon(Icons.home),
                title: const Text(StringIntranetConstants.homePage),
                selected: (_selectedDrawerItem == 0),
                selectedColor: ColorIntranetConstants.primaryColorLight,
                onTap: () {
                    selectedItem(context, 0);
                },
                ),
                ListTile(
                leading: const Icon(Icons.info),
                title: const Text(StringIntranetConstants.aboutPage),
                selected: (_selectedDrawerItem == 1),
                selectedColor: ColorIntranetConstants.primaryColorLight,
                onTap: () {
                    selectedItem(context, 1);
                },
                ),
                ListTile(
                leading: const Icon(Icons.chat_rounded),
                title: const Text(StringIntranetConstants.organizationPage),
                selectedColor: ColorIntranetConstants.primaryColorLight,
                selected: (_selectedDrawerItem == 2),
                onTap: () {
                    selectedItem(context, 2);
                },
                ),
                ListTile(
                leading: const Icon(Icons.edit),
                title: const Text(StringIntranetConstants.requestPage),
                selected: (_selectedDrawerItem == 3),
                selectedColor: ColorIntranetConstants.primaryColorLight,
                onTap: () {
                    selectedItem(context, 3);
                },
                ),
                ListTile(
                leading: const Icon(Icons.contact_mail),
                title: const Text(StringIntranetConstants.directoryPage),
                selected: (_selectedDrawerItem == 4),
                selectedColor: ColorIntranetConstants.primaryColorLight,
                onTap: () {
                    selectedItem(context, 4);
                },
                ),
                ListTile(
                leading: const Icon(Icons.celebration),
                title: const Text(StringIntranetConstants.aniversaryBirthdayPage),
                selected: (_selectedDrawerItem == 5),
                selectedColor: ColorIntranetConstants.primaryColorLight,
                onTap: () {
                    selectedItem(context, 5);
                },
                ),
                ListTile(
                leading: const Icon(Icons.emoji_events),
                title: const Text(StringIntranetConstants.monthPage),
                selected: (_selectedDrawerItem == 6),
                selectedColor: ColorIntranetConstants.primaryColorLight,
                onTap: () {
                    selectedItem(context, 6);
                },
                ),
                ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text(StringIntranetConstants.communiquePage),
                selected: (_selectedDrawerItem == 7),
                selectedColor: ColorIntranetConstants.primaryColorLight,
                onTap: () {
                    selectedItem(context, 7);
                },
                ),
                ListTile(
                leading: const Icon(Icons.library_books),
                title: const Text(StringIntranetConstants.manualPage),
                selected: (_selectedDrawerItem == 8),
                selectedColor: ColorIntranetConstants.primaryColorLight,
                onTap: () {
                    selectedItem(context, 8);
                },
                ),
                ListTile(
                leading: const Icon(Icons.public),
                title: const Text(StringIntranetConstants.accessPage),
                selected: (_selectedDrawerItem == 9),
                selectedColor: ColorIntranetConstants.primaryColorLight,
                onTap: () {
                    selectedItem(context, 9);
                },
                ),
                ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text(StringIntranetConstants.logoutPage),
                selected: (_selectedDrawerItem == 10),
                selectedColor: ColorIntranetConstants.primaryColorLight,
                onTap: () {
                    selectedItem(context, 10);
                },
                ),
            ],
            ),
        ),
        );
        
        
    }

    selectedItem(BuildContext context, int index) {
        Navigator.of(context).pop();

        switch (index) {
        case 0:
            _selectedDrawerItem = index;
            Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(
                builder: (context) => const HomePage()
                ), 
            ModalRoute.withName("/HomePage")
            );
            break;
        case 1:
            _selectedDrawerItem = index;
            Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(
                builder: (context) =>  const AboutMainPage()
                ), 
            ModalRoute.withName("/AboutPage")
            );
            break;
        case 2:
            _selectedDrawerItem = index;
            Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(
                builder: (context) =>  const OrganizationPage()
                ), 
            ModalRoute.withName("/OrganizationPage")
            );
            break;
        case 3:
            _selectedDrawerItem = index;
            Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(
                builder: (context) => const  RequestMainPage()
                ), 
            ModalRoute.withName("/RequestPage")
            );
            break;
        case 4:
            _selectedDrawerItem = index;
            Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(
                builder: (context) =>  const DirectoryPage()
                ), 
            ModalRoute.withName("/DirectoryPage")
            );
            break;
        case 5:
            _selectedDrawerItem = index;
            Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(
                builder: (context) => const AniversaryHomePage()
                ), 
            ModalRoute.withName("/AniversaryPage")
            );
            break;
        case 6:
            _selectedDrawerItem = index;
            Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(
                builder: (context) =>  const EmployeeMonthPage()
                ), 
            ModalRoute.withName("/EmployeeMonthPage")
            );
            break;
        case 7:
            _selectedDrawerItem = index;
            Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(
                builder: (context) =>  const CommunicatePage()
                ), 
            ModalRoute.withName("/CommuniquePage")
            );
            break;
        case 8:
            _selectedDrawerItem = index;
            Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(
                builder: (context) =>  const ManualPage()
                ), 
            ModalRoute.withName("/ManualPage")
            );
            break;
        case 9:
            _selectedDrawerItem = index;
            Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(
                builder: (context) =>  const AccessPage()
                ), 
            ModalRoute.withName("/AccesPage")
            );
            break;
        case 10:
            _selectedDrawerItem = index;
            Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(
                builder: (context) =>  const LogoutPage()
                ), 
            ModalRoute.withName("/LogoutPage")
            );

            break; 
        }
    }
    }

```

**/skeletons/list_view_cards.dart**

Los archivos dentro de la carpeta de skeletons son loaders que se activan cuando una pantalla se encuentra cargando u obteniendo información.
[`Documentación`](https://pub.dev/packages/skeletons).

```dart
 
    class ListviewCardsExamplePage extends StatefulWidget {
    const ListviewCardsExamplePage({Key? key}) : super(key: key);

    @override
    _ListviewCardsExamplePageState createState() =>
        _ListviewCardsExamplePageState();
    }

    class _ListviewCardsExamplePageState extends State<ListviewCardsExamplePage> {
    final bool _isLoading = true;


    @override
    Widget build(BuildContext context) {
        return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
            child: _isLoading ? _skeletonView() : const ListviewCardsExamplePage(),
        ),
        );
    }

    Widget _skeletonView() => ListView.builder(
            // padding: padding,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 12,
            itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(color: Colors.white),
                child: SkeletonItem(
                    child: Column(
                children: [
                    const SizedBox(
                    height: 12,
                    ),
                    const SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                        height: 310,
                        width: double.infinity,
                    ),
                    ),
                    const SizedBox(
                    height: 12,
                    ),
                    SkeletonParagraph(
                    style: SkeletonParagraphStyle(
                        lines: 1,
                        spacing: 2,
                        lineStyle: SkeletonLineStyle(
                            randomLength: true,
                            height: 20,
                            borderRadius: BorderRadius.circular(8),
                            minLength: MediaQuery.of(context).size.width / 2,
                            alignment: Alignment.bottomCenter)),
                    ),
                    const SizedBox(
                    height: 8,
                    ),
                    Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        SkeletonLine(
                        style: SkeletonLineStyle(
                            height: 50,
                            width: 110,
                            borderRadius: BorderRadius.circular(5),
                            alignment: Alignment.bottomCenter),
                        )
                    ],
                    )
                ],
                )),
            ),
            ),
        );
    }

```

**/alerts/user_card_alert_dialog.dart**

Este archivo muestra un alert con la información del usuario.

```dart

    class UserCardAlertDialog {
    static showFullDialog(
        BuildContext context,
        String fullname,
        String email,
        String photo,
        String department,
        String position,
    ) {
        showGeneralDialog(
            context: context,
            barrierDismissible: true,
            barrierLabel:
                MaterialLocalizations.of(context).modalBarrierDismissLabel,
            transitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (BuildContext buildContext, Animation animation,
                Animation secondaryAnimation) {
            return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
                child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                ),
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                    children: [
                        Container(
                        width: double.infinity,
                        height: 200.0,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                            image: AssetImage("lib/assets/background.jpg"),
                            fit: BoxFit.cover,
                            ),
                        ),
                        child: Align(
                            alignment: const Alignment(0, 2.5),
                            child: SizedBox(
                            width: 120.0,
                            height: 120.0,
                            child: OverflowBox(
                                child: CircleAvatar(
                                backgroundImage: NetworkImage(photo),
                                ),
                            ),
                            ),
                        ),
                        ),
                        const Padding(
                        padding: EdgeInsets.only(top: 80.0),
                        ),
                        Column(
                        children: [
                            Text(
                            fullname,
                            style: const TextStyle(
                                fontSize: 20.00,
                                fontWeight: FontWeight.bold,
                            ),
                            ),
                            const Padding(
                            padding: EdgeInsets.only(top: 14.0),
                            ),
                            Text(
                            position,
                            style: const TextStyle(fontSize: 16.00),
                            ),
                            const Padding(
                            padding: EdgeInsets.only(top: 36.0),
                            ),
                            Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Column(
                                children: [
                                Row(
                                    children: [
                                    const Icon(Icons.house),
                                    const Padding(
                                        padding: EdgeInsets.only(right: 8.0)),
                                    Text(department)
                                    ],
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 12.0)),
                                Row(
                                    children: [
                                    const Icon(Icons.work),
                                    const Padding(
                                        padding: EdgeInsets.only(right: 8.0)),
                                    Text(position)
                                    ],
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 12.0)),
                                Row(
                                    children: [
                                    const Icon(Icons.mail),
                                    const Padding(
                                        padding: EdgeInsets.only(right: 8.0)),
                                    Text(email)
                                    ],
                                ),
                                ],
                            ),
                            ),
                        ],
                        ),
                    ],
                    ),
                ),
                ),
            );
            });
    }
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

<br>

## **APIs**

Los datos de las APIs provienen del [`proyecto web`](https://github.com/adminportales/intranet) , el cual utilza laravel como backend.

Las rutas del API en la app movil se encuentran definidas en el archivo /lib/utils/constants.dart, de esta manera se garantiza escalabilidad y adaptabilidad.

### Rutas

<details>
	<summary>baseURL</summary>
    Definida como la url del proyecto web, en caso de cambiar de DNS, solo se actualiza esta dirección.

```dart
static String baseUrl = 'https://dev-intranet.promolife.lat/';
```
</details>


<details>
	<summary>loginEndpoint</summary>
    Ruta utilizada para el login de usuarios, es de tipo POST y devuelve un token cuando las credenciales enviadas por el usuario son correctas.

```dart
static String loginEndpoint = 'api/login' ;
```
Ruta asociada en la intranet web 

```php
Route::post('/login', [APIController::class, 'requestToken'])->name('api.login');
```

Función asociada a la ruta 

```php
public function requestToken(Request $request): string
    {
        //Valida los datos enviados desde la aplicación movil
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
            'device_name' => 'required',
        ]);

        //Obtiene el usuario al que pertenece el correo electrónico enviado desde la aplicación movil
        $user = User::where('email', $request->email)->first();

        //Valida que el usuario y contraseña sean los correctos, de lo contrario, devuelve un error
        if (!$user || !Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'email' => ['The provided credentials are incorrect.'],
            ]);
        }
        //Borra todos los tokens asociados al id de usuario (el usuario solo puede acceder desde un dispositivo movil a la vez)
        DB::table('personal_access_tokens')->where('tokenable_id', $user->id)->delete();

        //Crea un token en la tabla personal_access_tokens, asociada al id del usuario de la intranet web
        $user->createToken($request->device_name)->plainTextToken;
        
        //Devuelve el token como respuesta
        $token =  DB::table('personal_access_tokens')->where('tokenable_id', $user->id)->value('token');
        return $token;
    }
```

</details>


<details>
	<summary>getUser</summary>
    Obtiene la información del usuario de la intranet web asociado al token, esta ruta es de tipo GET.

```dart
static String getUser = 'api/getUser/' ;
```

Ruta asociada en la intranet web
```php
Route::get('/getUser/{hashedToken}', [APIController::class, 'getUser'])->name('api.getUser');
```

Función asociada a la ruta 

```php
public function getUser($hashedToken)
    {
        //Busca el token enviado desde el app movil en la base de datos y lo asocia a una variable
        $token = DB::table('personal_access_tokens')->where('token', $hashedToken)->first();
        //Se asigna a la variable $user_id el id de usuario al que pertence el token
        $user_id = $token->tokenable_id;
        //Busca la información de usuario 
        $user = User::where('id', $user_id)->get();
        //Obtiene el total de vacaciones con los que cuenta el usuario
        $vacations = DB::table('vacations_availables')->where('users_id', $user_id)->where('period', '<>', 3)->sum('dv');
        $data = [];

        if ($vacations == null) {
            $vacations = 0;
        }

        foreach ($user as $usr) {
            //Valida que el usuario tenga una foto de perfil, en caso contrario, asigna una por defecto para eviar que tenga datos nulos o vacios
            $image = '';
            if ($usr->image == null) {
                $image = "img/default_user.png";
            } else {
                $image = $usr->image;
            }
            //Información enviada como respuesta
            array_push($data, (object)[
                'id' => $usr->id,
                'fullname' => $usr->name . " " . $usr->lastname,
                'email' => $usr->email,
                'photo' => $image,
                'department' => $usr->employee->position->department->name,
                'position' => $usr->employee->position->name,
                'daysAvailables' => intval($vacations),
            ]);
        }

        return $data;
    }
```

</details>

<details>
	<summary>getRequest</summary>
    Obtiene todas las solicitudes creadas por el usuario mediante el uso del token, el endpoint es de tipo GET. 

```dart
static String getRequest = 'api/getRequest/' ;
```
Ruta asociada en la intranet web

```php
Route::get('/getRequest/{hashedToken}', [APIController::class, 'getRequest'])->name('api.getRequest');
```

Función asociada a la ruta 

```php
public function getRequest($hashedToken)
    {
        //Busca el token enviado desde el app movil en la base de datos y lo asocia a una variable
        $token = DB::table('personal_access_tokens')->where('token', $hashedToken)->first();
        //Se asigna a la variable $user_id el id de usuario al que pertence el token
        $user_id = $token->tokenable_id;
        //Busca todas las solicitudes asociadas al id de usuario
        $request = ModelsRequest::all()->where('employee_id', $user_id);
        //Se obtienen los dias de vacaciones
        $vacations = DB::table('vacations_availables')->where('users_id', $user_id)->where('period', '<>', 3)->sum('dv');

        $data = [];
        $start = "";
        $end = "";

        if ($vacations == null) {
            $vacations = 0;
        }

        foreach ($request as $req) {

            $days = "";
            //Asigna valores en datos de tipo null o vacions
            if ($req->start == null) {
                $start = "Sin especificar";
            } else {
                $start = $req->start;
            }
            //Asigna valores en datos de tipo null o vacions
            if ($req->end == null) {
                $end = "Sin especificar";
            } else {
                $end = $req->end;
            }

            //Las fechas de solicitudes rechazadas se guardan en la tabla request_rejected, por lo que se buscan los dias asociados a esa solictud en esa tabla, en el caso de ser aprobadas las solicitudes, las fechas se guardan en la tabla request_calendars.
            if ($req->direct_manager_status == "Rechazada" || $req->human_resources_status == "Rechazada") {
                $date =  DB::table('request_rejected')->where('users_id', $req->employee_id)->where('requests_id', $req->id)->get();
            } else {
                $date = DB::table('request_calendars')->where('users_id', $req->employee_id)->where('requests_id', $req->id)->get();
            }

            foreach ($date as  $calendar) {
                $days = $days . "," . $calendar->start;
            }

            //Al devolver todas las fechas en un String, se elimina la primer "," Ejemplo: ,1,2,3 => 1,2,3
            $days = substr($days, 1);
            //Datos que retoran en endpoint
            array_push($data, (object)[
                'id' => $req->id,
                'employeeID' => $req->employee_id,
                'typeRequest' => $req->type_request,
                'payment' => $req->payment,
                'payment' => $req->payment,
                'start' => $start,
                'end' => $end,
                'reason' => $req->reason,
                'directManagerId' => $req->direct_manager_id,
                'directManagerStatus' => $req->direct_manager_status,
                'humanResourcesStatus' => $req->human_resources_status,
                'visible' => $req->visible,
                'days' => $days,
                'daysAvailables' => intval($vacations),
            ]);
        }
        return $data;
    }
```

</details>

<details>
	<summary>postRequestEndpoint</summary>
    Ruta de tipo POST que envia información (solicitudes) de la intranet movil a la web.

```dart
static String postRequestEndpoint = 'api/postRequest' ;
```

Ruta asociada en la intranet web

```php
Route::post('/postRequest', [APIController::class, 'postRequest'])->name('api.postRequest');

```

Función asociada a la ruta 
```php
public function postRequest(Request $request)
    {
        //Busca el token enviado desde el app movil en la base de datos y lo asocia a una variable
        $token = DB::table('personal_access_tokens')->where('token', $hashedToken)->first();
        //Se asigna a la variable $user_id el id de usuario al que pertence el token
        $user_id = $token->tokenable_id;
        //Obtiene la información del empleado asignado al id de usuario
        $employee = Employee::all()->where('user_id',$user_id);
        //Si el token el incorrecto, el usuario no puede generar solicitudes
        if($token !=null || $token !=""){
            $date= date("G:i:s", strtotime($request->start));
            $manager = "";
            foreach($employee as $emp){
                $manager = $emp->jefe_directo_id; 
            }
            //Crea una nueva solicitud con los datos enviados desde la app movil
            $req = new ModelsRequest();
            $req->employee_id = $user_id;
            $req->type_request = $request->typeRequest;
            $req->payment = $request->payment;
            $req->reason = $request->reason;
            $req->start = $date;
            $req->end = null;
            $req->direct_manager_id = $manager;
            $req->direct_manager_status = "Pendiente";
            $req->human_resources_status = "Pendiente";
            $req->visible = 1;
            $req->save();

            //Los dias seleccionados se envian como strings, ["[1222022,21212022]"], por lo que se tienen que separar las fechas y convertirlas en un array
            $days = collect( $request->days);
            $daySelected= str_replace (array('["', '"]'), '' , $days);
            $tag_array = explode(',', $daySelected );

            //por cada elemento en la lista de dias, se crea un registro en la base de datos
            foreach($tag_array as $day){
                //Se elima el ultimo corchete, quedando solo los valores
                $daySelected2= str_replace (array('[', ']'), '' , $day);
                //Se conveierten en tipo int
                $dayInt = intval($daySelected2);
                //Se debe transformar la fecha a un formato que sea valido en la base de datos, para ello se realiza la siguiente conversión 22062022 => 2022-06-22
                $date = DateTime::createFromFormat('dmY', $dayInt);
                //Se crea un nuevo registro en la base de datos
                $request_calendar = new RequestCalendar();
                $request_calendar->title = "Día seleccionado";
                $request_calendar->start =  $date->format('Y-m-d');
                $request_calendar->end = $date->format('Y-m-d');
                $request_calendar->users_id = $user_id;
                $request_calendar->requests_id =$req->id;
                $request_calendar->save();
            
            }
            //Al crear una nueva solicitud, se debe avisar a su jefe directo que la creó, para ello debemos de crear un registro en la tabla de notificaciones.
            //Se debe crear un array con los siguientes datos, estos se modificaran de acuerdo al starus de la solicitud
            $data_send = [
                "id"=>$req->id,
                "employee_id"=>$user_id,
                "direct_manager_status"=>"Pendiente",
                "human_resources_status"=>"Pendiente" 
            ];
            //Se crea un nuevo registro en la base de datos
            $notification = new Notification();
            $notification->id = $req->id;
            $notification->type = "App\Notifications\RequestNotification";
            $notification->notifiable_type = "App\Models\User";
            $notification->notifiable_id = $manager;
            $notification->data = json_encode($data_send);
            $notification->save();
        }
        return  true;
    }

```

</details>

<details>
	<summary>manualEndpoint</summary>
    Ruta de tipo GET que muestra los manuales generados desde la Intranet web.

```dart
static String manualEndpoint = 'api/manuals' ;
```

Ruta asociada en la intranet web
```php
Route::get('/manuals', [APIController::class, 'manuals'])->name('api.manual');
```

Función asociada a la ruta 
```php
public function manuals()
    {
        //Se obtienen todos los manuales
        $manuals = Manual::all();
        $data = [];

        foreach ($manuals  as $manual) {
            $image = "";
            //En casi de no tener imagen, se asigna una por default
            if ($manual->img == null) {
                $image = "img/pdf.png";
            } else {
                $image = $manual->img;
            };
            //Se agregan los datos al array data
            array_push($data, (object)[
                'id' => $manual->id,
                'name' => $manual->name,
                'file' => $manual->file,
                'img' => $image,
            ]);
        }
        //retorna el objeto de datos
        return $data;
    }
```

</details>


<details>
	<summary>monthEmployeeEndpoint</summary>
    Ruta de tipo GET que muestra la información de los empleados del mes.

```dart
static String monthEmployeeEndpoint = 'api/month-employees/';
```

Ruta asociada en la intranet web
```php
Route::get('/month-employees', [APIController::class, 'monthEmployees'])->name('api.month.employees');
```

Función asociada a la ruta 
```php
public function monthEmployees()
    {
        //Se obtienen los datos del endpoint creado en el otro proyecto
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "https://evaluacion.promolife.lat/api/empleado-del-mes");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $res = curl_exec($ch);
        curl_close($ch);
        $res = json_decode($res);
        $users = [];
        $employeesMonth = [];
        //Se asignan los datos a las variables
        foreach ($res as $data) {
            try {
                $user = User::where('email', '=', $data->email)->firstOrFail();
                if ($user != null) {
                    $image = '';
                    //En caso de no tener foto el usuario, se asigna una por default
                    if ($user->image == null) {
                        $image = "img/default_user.png";
                    } else {
                        $image = $user->image;
                    }
                    array_push($users, $user);
                    //Se envia la información al objeto
                    array_push($employeesMonth, (object)[
                        'id' => $user->id,
                        'name' => $user->name . ' ' . $user->lastname,
                        'position' => $data->puesto,
                        'star' => $data->star,
                        'photo' => $image
                    ]);
                }
            } catch (Exception $e) {
            }
        }
        //Retorna la información del objeto
        return $employeesMonth;
    }

```

</details>


<details>
	<summary>monthAniveraryEndpoint</summary>
    Ruta de tipo GET, que muestra los aniversarios del mes.

```dart
static String monthAniveraryEndpoint =  'api/month-anniversaries/';
```

Ruta asociada en la intranet web
```php
Route::get('/month-anniversaries', [APIController::class, 'aniversary'])->name('api.anniversaries');
```

Función asociada a la ruta 
```php
public function aniversary()
    {   
        //Se consulta la fecha actual para conocer el mes en el que estamos
        $carbon = new \Carbon\Carbon();
        $date = $carbon->now();
        //Seleccionamos solo el mes
        $date = $date->format('m');
        $employees = [];
        foreach (Employee::all() as $employee) {
            //Por cada empleado buscamos la fecha de admisión que contenga el mes actual
            if ($employee->date_admission != null) {
                //Se delimitan los valores de las fecha mediante el "-" ocupando una posición especifica, similar a los arrays
                $birthday = explode('-', $employee->date_admission);
                // Se realiza un filtrado de empleados que coincida en el mes
                $monthAniversaryth = $birthday[1];
                if ($monthAniversaryth == $date) {
                    //Se asigna una imagen por default en caso de tener valores nulos
                    $image = '';
                    if ($employee->user->image == null) {
                        $image = "img/default_user.png";
                    } else {
                        $image = $employee->user->image;
                    }
                    //Se envia la obformación al objeto.
                    array_push($employees, (object)[
                        'id' => $employee->user->id,
                        'name' => $employee->user->name,
                        'lastname' => $employee->user->lastname,
                        'photo' => $image,
                        'date' => $employee->date_admission->format('d-m-Y'),
                    ]);
                }
            }
        }
        //Retorna la infomración de los empleados del mes.
        return $employees;
    }
```

</details>


<details>
	<summary>monthBirthdayEndpoint</summary>
    Ruta de tipo GET que muestra los cumpleaños del mes.

```dart
static String monthBirthdayEndpoint = 'api/month-birthdays/';
```

Ruta asociada en la intranet web
```php
Route::get('/month-birthdays', [APIController::class, 'birthday'])->name('api.birthdays');
```

Función asociada a la ruta 
```php
public function birthday()
    {
       //Esta función es similar a la anterior mostrada, cambiando solo la fecha a comparar (birthday_date). Primero se consulta la fecha actual para conocer el mes en el que estamos
        $carbon = new \Carbon\Carbon();
        $date = $carbon->now();
        //Seleccionamos solo el mes
        $date = $date->format('m');
        $employees = [];
        foreach (Employee::all() as $employee) {
            //Por cada empleado buscamos la fecha de cumpleaños que contenga el mes actual
            if ($employee->birthday_date != null) {
                //Se delimitan los valores de las fecha mediante el "-" ocupando una posición especifica, similar a los arrays
                $birthday = explode('-', $employee->birthday_date);
                // Se realiza un filtrado de empleados que coincida en el mes
                $monthAniversaryth = $birthday[1];
                if ($monthAniversaryth == $date) {
                    //Se asigna una imagen por default en caso de tener valores nulos
                    $image = '';
                    if ($employee->user->image == null) {
                        $image = "img/default_user.png";
                    } else {
                        $image = $employee->user->image;
                    }
                    //Se envia la obformación al objeto.
                    array_push($employees, (object)[
                        'id' => $employee->user->id,
                        'name' => $employee->user->name,
                        'lastname' => $employee->user->lastname,
                        'photo' => $image,
                        'date' => $employee->birthday_date->format('d-m'),
                    ]);
                }
            }
        }

        return $employees;
    }

```

</details>

<details>
	<summary>communicateEndpoint</summary>

```dart
static String communicateEndpoint = 'api/communicate/';
```

Ruta asociada en la intranet web
```php
Route::get('/communicate', [APIController::class, 'communicate'])->name('api.communicate');
```
Función asociada a la ruta 
```php
public function communicate()
    {
        //Esta ruta retorna todos los comunicados, sin cambios en su estructura.
        $communicate = Communique::all();
        return $communicate;
    }
```

</details>

<details>
	<summary>directoryEndponit</summary>

```dart
static String directoryEndponit = 'api/directory/';
```

Ruta asociada en la intranet web
```php

```

Función asociada a la ruta 
```php

```

</details>

<details>
	<summary>organizationEndpoint</summary>

```dart
static String organizationEndpoint = '/api/organization/';
```

Ruta asociada en la intranet web
```php

```

Función asociada a la ruta 
```php

```


</details>

<details>
	<summary>postPublication</summary>

```dart
static String postPublication = 'api/postPublications';
```

Ruta asociada en la intranet web
```php

```

Función asociada a la ruta 
```php

```

</details>

<details>
	<summary>getPublication</summary>

```dart
static String getPublication = 'api/getPublications/';
```

Ruta asociada en la intranet web
```php

```

Función asociada a la ruta 
```php

```

</details>

<details>
	<summary>postLike</summary>

```dart
static String postLike = 'api/postLike';
```

Ruta asociada en la intranet web
```php

```

Función asociada a la ruta 
```php

```

</details>

<details>
	<summary>postUnlike</summary>

```dart
static String postUnlike = 'api/postUnlike';
```

Ruta asociada en la intranet web
```php

```

Función asociada a la ruta 
```php

```

</details>

<details>
	<summary>getComment</summary>

```dart
static String getComment = 'api/showComments/';
```

Ruta asociada en la intranet web
```php

```

Función asociada a la ruta 
```php

```

</details>

<details>
	<summary>postComment</summary>

```dart
static String postComment = 'api/postComment';
```

Ruta asociada en la intranet web
```php

```

Función asociada a la ruta 
```php

```

</details>

<details>
	<summary>getEmployeeProfile</summary>
    
```dart
static String getEmployeeProfile = 'api/getProfile/';
```

Ruta asociada en la intranet web
```php

```

Función asociada a la ruta 
```php

```

</details>

[`Volver al Inicio`](https://github.com/Oscar-CR/Intranet-mobile-flutter)

