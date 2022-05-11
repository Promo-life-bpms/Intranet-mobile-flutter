import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/services/api_directory.dart';
import 'package:intranet_movil/utils/alert_dialog.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:pagination_view/pagination_view.dart';

void main() => runApp(TestApp());

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TesPagePagination(),
    );
  }
}

class TesPagePagination extends StatefulWidget {
  const TesPagePagination({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<TesPagePagination> {
  late int page;
  late PaginationViewType paginationViewType;
  late Axis scrollDirection;
  late GlobalKey<PaginationViewState> key;
  late List<DirectoryModel>? _directoryModel = [];
  late List<DirectoryModel>? _directoryModelSearch = [];

  @override
  void initState() {
    page = -1;
    paginationViewType = PaginationViewType.listView;
    scrollDirection = Axis.vertical;
    key = GlobalKey<PaginationViewState>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('PaginationView Example'),
      ),
      body: PaginationView(
        key: key,
        header: const SliverToBoxAdapter(child: Text('Header text')),
        footer: const SliverToBoxAdapter(child: Text('Footer text')),
        paginationViewType: paginationViewType,
        itemBuilder:
            (BuildContext context, DirectoryModel directoryModel, int index) =>
                GridTile(
          child: Column(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    UserCardAlertDialog.showFullDialog(
                        context,
                        directoryModel.fullname.toString(),
                        directoryModel.email,
                        ApiIntranetConstans.baseUrl + directoryModel.photo,
                        directoryModel.department,
                        directoryModel.position);
                  },
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 24.0),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(ApiIntranetConstans
                                      .baseUrl +
                                  directoryModel.photo
                                      .toString()), /*  backgroundImage: NetworkImage(ApiIntranetConstans.baseUrl + _directoryModel![index].photo.toString()), */
                            ),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            directoryModel.fullname,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16.00,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 8)),
                          Text(directoryModel.position,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12.00,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        pageFetch: pageFetch,
        scrollDirection: scrollDirection,
        pullToRefresh: true,
        physics: const BouncingScrollPhysics(),
        onError: (dynamic error) => const Center(
          child: Text('Some error occured'),
        ),
        onEmpty: const Center(
          child: Text('Sorry! This is empty'),
        ),
        bottomLoader: const Center(
          child: CircularProgressIndicator(),
        ),
        initialLoader: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Future<List<DirectoryModel>> pageFetch(int offset) async {
    List<DirectoryModel> _directoryModel =
        (await ApiDirectoryService().getDirectory())!.cast<DirectoryModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if (_directoryModel.length == 0) {
      return [];
    } else {
      return _directoryModel;
    }
  }
}
