import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/views/organization/widget/organization_builder.dart';
import 'package:intranet_movil/widget/skeletons/list_view_company.dart';

class CommunicationDirectoryPage extends StatefulWidget {
  const CommunicationDirectoryPage({Key? key, required this.directoryModel})
      : super(key: key);
  final List<DirectoryModel> directoryModel;

  @override
  State<CommunicationDirectoryPage> createState() =>
      _CommunicationDirectoryPageState();
}

class _CommunicationDirectoryPageState
    extends State<CommunicationDirectoryPage> {
  @override
  Widget build(BuildContext context) {
    return widget.directoryModel.isEmpty
        ? const ListviewCompanyPage()
        : OrganizationBuilder(directoryData: widget.directoryModel);
  }
}
