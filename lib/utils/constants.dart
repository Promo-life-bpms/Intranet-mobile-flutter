import 'package:flutter/material.dart';

class ApiIntranetConstans {
  static String baseUrl = 'https://intranet.kaths.com.mx/';

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