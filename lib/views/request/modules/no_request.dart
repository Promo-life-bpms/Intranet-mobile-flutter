import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoRequest extends StatefulWidget {
  const NoRequest({Key? key}) : super(key: key);

  @override
  State<NoRequest> createState() => _NoRequestState();
}

class _NoRequestState extends State<NoRequest> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  SizedBox(
                    width: 550,
                    child: Lottie.asset("lib/assets/authorization.json"),
                  ),
                  const Text(
                    "No hay solicitudes",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color.fromARGB(255, 64, 96, 112),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
