import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/views/directory/widget/user_info_card.dart';

class DirectoryBuilder extends StatefulWidget {
  const DirectoryBuilder({Key? key, required this.directoryData})
      : super(key: key);
  final List<DirectoryModel> directoryData;

  @override
  State<DirectoryBuilder> createState() => _EmployeeMonthBuilderBuilderState();
}

class _EmployeeMonthBuilderBuilderState extends State<DirectoryBuilder> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 16, right: 16),
        itemCount: widget.directoryData.length,
        itemBuilder: (context, index) {
          return UserInfoCard(userData: [
            DirectoryModel(
                id: widget.directoryData[index].id,
                fullname: widget.directoryData[index].fullname,
                email: widget.directoryData[index].email,
                photo: widget.directoryData[index].photo,
                department: widget.directoryData[index].department,
                position: widget.directoryData[index].position)
          ]);
        },
      ),
    );
  }
}
