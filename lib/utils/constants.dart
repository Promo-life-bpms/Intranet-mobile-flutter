import 'package:flutter/material.dart';
import 'package:intranet_movil/model/about.dart';

class ApiIntranetConstans {
  static String baseUrl = 'https://intranet.promolife.lat/';

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

  static const aboutPLWhatIs="¿Que es Promo Life?";
  static const aboutPLDescription ="PROMOTIONAL GLOBAL SUPPLIER. Más de una década importando, fabricando y distribuyendo productos promocionales y regalos corporativos para las marcas más prestigiosas. Expertos asesores, socios estratégicos y facilitadores para la adquisición del producto exacto para cada campaña externa o interna de las empresas AAA.";
  static const aboutPLHistory = "Historia";
  static const aboutPLHistoryDescription = "En 2011 se constituye Promo Life S de RL de CV, sumando la experiencia de los socios en la importación y comercialización de productos promocionales disponibles en México. Hemos crecido año con año sin detenernos, teniendo cada vez más clientes, presencia en el mercado y un equipo de colaboradores más robusto y profesionalizando cada vez más nuestra dinámica de trabajo.";
  static const aboutPLValuesCode = "Código de valores";

  static const aboutBHWhatIs="¿Qué es BH Trade Market?";
  static const aboutBHDescription ="Más de una década importando, fabricando y distribuyendo productos promocionales y regalos corporativos para las marcas más prestigiosas. Expertos asesores, socios estratégicos y facilitadores para la adquisición del producto exacto para cada campaña externa o interna de las empresas AAA.";

  static const successfulAlertTitle ="¡Solicitud enviada!";
  static const successfulAlertDescription ="Tu solicitud ha sido procesada con exito";
  static const wrongAlertTitle = "Revisa los datos de tu solicitud e intenta nuevamente";
  static const wrongAlertDescription = "Revisa los datos de tu solicitud e intenta nuevamente";

  static const buttonAcept="ACEPTAR";
  static const buttonPost="PUBLICAR";
  static const buttonViewMore="VER MAS";

  static const homeBirthdayTitle = "Cumpleaños del Mes";
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

  final List<AboutData> aboutPL = [
    const AboutData('Lealtad','Es sin duda una de las cualidades más respetables de un ser humano, en especial cuando se trata de una relación de pareja o de una amistad ya que ayuda a mantener un lazo fuerte y generar confianza en el otro.', 'lib/assets/lealtad.json'),
    const AboutData('Confianza', 'Nos referimos a la posibilidad  de creer en que otra persona, o un grupo de ellas, actuarán de la manera adecuada en nuestra ausencia, es decir, que no nos defraudarán o nos engañarán, ni necesitan tampoco nuestra supervisión y vigilancia.', 'lib/assets/confianza.json'),
    const AboutData('Honestidad', 'Es la virtud humana consistente en el amor a la justicia y la verdad por encima del beneficio personal o de la convivencia','lib/assets/honestidad.json'),
    const AboutData('Trabajo en equipo', 'Incluye aquellas labores que se realizan de manera compartida y organizada, en las que cada quien asume una parte y todos tienen el mismo objetivo en común. Se trata de una forma de organización del trabajo basada en el compañerismo.', 'lib/assets/te.json'),
    const AboutData('Productividad', 'Es un tipo de comportamiento de tipo anticipatorio, que no requiere de un estímulo externo para iniciar una acción o emprender un cambio.', 'lib/assets/productividad.json')
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