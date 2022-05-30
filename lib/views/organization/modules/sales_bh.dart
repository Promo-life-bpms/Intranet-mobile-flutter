import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/views/organization/widget/organization_builder.dart';
import 'package:intranet_movil/widget/skeletons/list_view_company.dart';

class SalesBHDirectoryPage extends StatefulWidget {
  const SalesBHDirectoryPage({Key? key, required this.directoryModel}) : super(key: key);
  final List<DirectoryModel> directoryModel;

  @override
  State<SalesBHDirectoryPage> createState() => _SalesBHDirectoryPageState();
}

class _SalesBHDirectoryPageState extends State<SalesBHDirectoryPage> {
   @override
  Widget build(BuildContext context) {
    return widget.directoryModel.isEmpty
        ? const ListviewCompanyPage()
        : OrganizationBuilder(directoryData: widget.directoryModel);
  }
}