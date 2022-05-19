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
