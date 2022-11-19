import 'package:flutter/material.dart';
import 'package:intranet_movil/model/birthday.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/profile/employee_profile.dart';
import 'package:lottie/lottie.dart';

class UserBirthdayCard extends StatefulWidget {
  const UserBirthdayCard({Key? key, required this.birthdayData})
      : super(key: key);

  final List<BirthdayModel> birthdayData;

  @override
  State<UserBirthdayCard> createState() => _UserBirthdayCardState();
}

class _UserBirthdayCardState extends State<UserBirthdayCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    width: 60,
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: NetworkImage(ApiIntranetConstans.baseUrl +
                            widget.birthdayData[0].photo.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Align(
                      alignment: Alignment(0, 1.3),
                      child: SizedBox(
                        width: 150.0,
                        child: SizedBox(
                            width: 22,
                            height: 22,
                            child: Image(
                              image: AssetImage("lib/assets/birthday_cake.png"),
                            )),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EmployeeProfilePage(
                              employeeID: widget.birthdayData[0].id,
                              employeeName: widget.birthdayData[0].name +
                                  " " +
                                  widget.birthdayData[0].lastname,
                            )));
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 8)),
                SizedBox(
                  width: 120,
                  child: Center(
                    child: Text(
                        widget.birthdayData[0].name +
                            " " +
                            widget.birthdayData[0].lastname,
                        style: const TextStyle(
                          fontSize: 12.00,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                SizedBox(
                    width: 80,
                    child: Text(widget.birthdayData[0].date,
                        style: const TextStyle(fontSize: 10.00),
                        textAlign: TextAlign.center)),
              ],
            )),
      ],
    );
  }
}
