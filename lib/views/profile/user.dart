import 'package:flutter/material.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/services/api_user.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:intranet_movil/widget/skeletons/list_view_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<UserProfilePage> {
  late List<UserModel>? _userModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    _userModel =
        (await ApiUserService().getUsers(token.toString()))!.cast<UserModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Mi cuenta'),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const ListviewProfile()
          : ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
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
                                backgroundImage: NetworkImage(
                                    ApiIntranetConstans.baseUrl +
                                        _userModel![0].photo),
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
                            _userModel![0].fullname,
                            style: const TextStyle(
                              fontSize: 20.00,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 14.0),
                          ),
                          Text(
                            _userModel![0].position,
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
                                    Text(_userModel![0].department)
                                  ],
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 12.0)),
                                Row(
                                  children: [
                                    const Icon(Icons.work),
                                    const Padding(
                                        padding: EdgeInsets.only(right: 8.0)),
                                    Text(_userModel![0].position)
                                  ],
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 12.0)),
                                Row(
                                  children: [
                                    const Icon(Icons.mail),
                                    const Padding(
                                        padding: EdgeInsets.only(right: 8.0)),
                                    Text(_userModel![0].email)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
