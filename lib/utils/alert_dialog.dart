import 'package:flutter/material.dart';

class UserCardAlertDialog{
  
  static showFullDialog(BuildContext context , String img, String name, String position,/* Data data  */ ) {

  showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(context)
          .modalBarrierDismissLabel,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext,
          Animation animation,
          Animation secondaryAnimation) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
            child: Card(
              child:  SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://media-exp1.licdn.com/dms/image/C4E1BAQHZpvSzm3mrGg/company-background_10000/0/1604596643746?e=2159024400&v=beta&t=7eQro0ejdMhEJ8UTKMZ2fEjTZmbCc6KtEm5kg-LeXIw"),
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
                          backgroundImage: NetworkImage(img),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 80.0) ,
                  ),
                  Column(
                    children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 20.00,fontWeight: FontWeight.bold,),
                    ),
                    const Padding(
                    padding: EdgeInsets.only(top: 12.0) ,
                    ),
                    Text(
                      position,
                      style: const TextStyle(fontSize: 16.00),
                    ),
                    ],
                  ),
                  
                ],
              ),
              ),
              
            ),
          );
        }
      );

  }
}