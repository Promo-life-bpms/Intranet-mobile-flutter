import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(const PromolifePage());

class PromolifePage extends StatelessWidget {
  const PromolifePage({Key? key}) : super(key: key);

  static const String _title = 'Acerca de Promolife';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: const PromolifeWidget(),
    );
  }
}

class PromolifeWidget extends StatelessWidget {
  const PromolifeWidget({Key? key}) : super(key: key);

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
                image: NetworkImage("https://media-exp1.licdn.com/dms/image/C4E1BAQHZpvSzm3mrGg/company-background_10000/0/1604596643746?e=2159024400&v=beta&t=7eQro0ejdMhEJ8UTKMZ2fEjTZmbCc6KtEm5kg-LeXIw"),
                fit: BoxFit.cover,
                ),
              ),
              child: const Align(
                alignment:  Alignment(0, 1.45),
                child: SizedBox(
                width: 200.0,
                  child: Image(
                    image: AssetImage('lib/assets/promolife.png')
                  ),
                ),     
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 60),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: Text(
                  "¿Que es Promo Life?",
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
                  "PROMOTIONAL GLOBAL SUPPLIER. Más de una década "
                  "importando, fabricando y distribuyendo productos "
                  "promocionales y regalos corporativos para las "
                  "marcas más prestigiosas. Expertos asesores, "
                  "socios estratégicos y facilitadores para la "
                  "adquisición del producto exacto para cada "
                  "campaña externa o interna de las empresas "
                  "AAA.",
                    style: TextStyle(height: 1.5),
                    textAlign: TextAlign.justify
                    ),
                  ),
                ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Text(
                    "Historia",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      height: 2,
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                      ),
                      textAlign: TextAlign.justify,
                ),
              ),
            ),
            const Padding(
              padding:EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 150,
                child: Text(
                  "En 2011 se constituye Promo Life S de RL de CV, "
                  "sumando la experiencia de los socios en la "
                  "importación y comercialización de productos "
                  "promocionales disponibles en México. Hemos "
                  "crecido año con año sin detenernos, teniendo "
                  "cada vez más clientes, presencia en el mercado "
                  "y un equipo de colaboradores más robusto y "
                  "profesionalizando cada vez más nuestra dinámica "
                  "de trabajo.",
                    style: TextStyle(height: 1.5),
                    textAlign: TextAlign.justify
                ),
              ),
            ),
            const Padding(
              padding:EdgeInsets.only(top: 40),
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
              padding:EdgeInsets.symmetric(horizontal: 30),
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
              padding:EdgeInsets.symmetric(horizontal: 30),
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
              padding:EdgeInsets.symmetric(horizontal: 30),
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
              padding:EdgeInsets.symmetric(horizontal: 30),
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
              padding:EdgeInsets.symmetric(horizontal: 30),
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

