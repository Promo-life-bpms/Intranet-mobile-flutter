import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/organization/widget/organization_builder.dart';

class SystemsDirectoryPage extends StatefulWidget {
  const SystemsDirectoryPage({Key? key, required this.directoryModel}) : super(key: key);
  final List<DirectoryModel>? directoryModel;

  @override
  State<SystemsDirectoryPage> createState() => _SystemsDirectoryPageState();
}

class _SystemsDirectoryPageState extends State<SystemsDirectoryPage> {
  @override
  Widget build(BuildContext context) {
    return  widget.directoryModel == null || widget.directoryModel!.isEmpty
          ? const Center(
            child: CircularProgressIndicator(color: ColorIntranetConstants.primaryColorNormal,),
          )
          : OrganizationBuilder(
            directoryData: List<DirectoryModel>.generate(
                widget.directoryModel!.length,
                (index) => DirectoryModel(
                    id: widget.directoryModel![index].id,
                    fullname: widget.directoryModel![index].fullname,
                    email: widget.directoryModel![index].email,
                    photo: widget.directoryModel![index].photo,
                    department: widget.directoryModel![index].department,
                    position: widget.directoryModel![index].position)));
  }
}
