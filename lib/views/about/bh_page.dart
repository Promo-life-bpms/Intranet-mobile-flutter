import 'package:flutter/material.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:lottie/lottie.dart';

class BHPage extends StatelessWidget {
  const BHPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringIntranetConstants.aboutBHPage),
      ),
      body: const BHWidget(),
    );
  }
}

class BHWidget extends StatelessWidget {
  const BHWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 0,
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.blue,
                    BlendMode.softLight,
                  ),
                  image: NetworkImage(
                      "http://www.trademarket.com.mx/assets/imgs/quienes.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Align(
                alignment: Alignment(0, 3),
                child: SizedBox(
                  width: 150.0,
                  child: Image(image: AssetImage('lib/assets/bhtrade.png')),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 60),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: Text(
                  "¿Qué es BH Trade Market?",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    height: 3,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 150,
                child: Text(
                    "Más de una década importando, fabricando y distribuyendo "
                    "productos promocionales y regalos corporativos para las marcas"
                    "más prestigiosas. Expertos asesores, socios estratégicos y facilitadores"
                    "para la adquisición del producto exacto para cada campaña externa o interna"
                    "de las empresas AAA.",
                    style: TextStyle(height: 1.5),
                    textAlign: TextAlign.justify),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Text(
                  "Codigo de valores",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      height: 2,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Text(
                  "Lealtad",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      height: 2,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Lottie.asset("lib/assets/lealtad.json"),
                  ),
                  const Expanded(
                    child: Text(
                      "Es sin duda una de las cualidades más "
                      "respetables de un ser humano, en especial "
                      "cuando se trata de una relación de pareja "
                      "o de una amistad ya que ayuda a mantener "
                      "un lazo fuerte y generar confianza en el "
                      "otro.",
                      style: TextStyle(height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Text(
                  "Confianza",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      height: 2,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Lottie.asset("lib/assets/confianza.json"),
                  ),
                  const Expanded(
                    child: Text(
                      "Nos referimos a la posibilidad  de creer en que "
                      "otra persona, o un grupo de ellas, actuarán de "
                      "la manera adecuada en nuestra ausencia, es decir, "
                      "que no nos defraudarán o nos engañarán, ni "
                      "necesitan  tampoco nuestra supervisión y "
                      "vigilancia.",
                      style: TextStyle(height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Text(
                  "Honestidad",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      height: 2,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Lottie.asset("lib/assets/honestidad.json"),
                  ),
                  const Expanded(
                    child: Text(
                      "Es la virtud humana consistente en el amor "
                      "a la justicia y la verdad por encima del beneficio "
                      "personal o de la convivencia.",
                      style: TextStyle(height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Text(
                  "Trabajo en equipo",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      height: 2,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Lottie.asset("lib/assets/te.json"),
                  ),
                  const Expanded(
                    child: Text(
                      "Incluye aquellas labores que se realizan de "
                      "manera compartida y organizada, en las que cada "
                      "quien asume una parte y todos tienen el mismo "
                      "objetivo en común. Se trata de una forma de "
                      "organización del trabajo basada en el compañerismo.",
                      style: TextStyle(height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Text(
                  "Productividad",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      height: 2,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Lottie.asset("lib/assets/productividad.json"),
                  ),
                  const Expanded(
                    child: Text(
                      "Es un tipo de comportamiento de tipo anticipatorio, "
                      "que no requiere de un estímulo externo para iniciar "
                      "una acción o emprender un cambio.",
                      style: TextStyle(height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
