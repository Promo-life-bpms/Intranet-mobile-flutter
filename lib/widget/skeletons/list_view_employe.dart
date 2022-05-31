import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/skeletons/stylings.dart';
import 'package:intranet_movil/widget/skeletons/widgets.dart';

class ListviewEmploye extends StatefulWidget {
  const ListviewEmploye({Key? key}) : super(key: key);

  @override
  _ListviewCardsExamplePageState createState() =>
      _ListviewCardsExamplePageState();
}

class _ListviewCardsExamplePageState extends State<ListviewEmploye> {
  final bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        child: _isLoading ? _skeletonView() : const ListviewEmploye(),
      ),
    );
  }

  Widget _skeletonView() => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 50,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(color: Colors.white),
            child: SkeletonItem(
                child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 1,
                      spacing: 2,
                      lineStyle: SkeletonLineStyle(
                          randomLength: true,
                          height: 20,
                          borderRadius: BorderRadius.circular(8),
                          minLength: MediaQuery.of(context).size.width / 2,
                          alignment: Alignment.bottomCenter)),
                ),
                const SizedBox(
                  height: 0,
                ),
                SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 1,
                      spacing: 2,
                      lineStyle: SkeletonLineStyle(
                          randomLength: true,
                          height: 20,
                          borderRadius: BorderRadius.circular(8),
                          minLength: MediaQuery.of(context).size.width / 5,
                          alignment: Alignment.bottomCenter)),
                ),
                const SizedBox(
                  height: 12,
                ),
                const SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    height: 310,
                    width: 250,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 1,
                      spacing: 2,
                      lineStyle: SkeletonLineStyle(
                          randomLength: true,
                          height: 20,
                          borderRadius: BorderRadius.circular(8),
                          alignment: Alignment.bottomCenter)),
                ),
                const SizedBox(
                  height: 12,
                ),
                SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 1,
                      spacing: 2,
                      lineStyle: SkeletonLineStyle(
                          randomLength: true,
                          height: 20,
                          borderRadius: BorderRadius.circular(8),
                          minLength: MediaQuery.of(context).size.width / 2,
                          alignment: Alignment.bottomCenter)),
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 20,
                          width: 35,
                          borderRadius: BorderRadius.circular(5),
                          alignment: Alignment.bottomCenter),
                    )
                  ],
                )
              ],
            )),
          ),
        ),
      );
}
