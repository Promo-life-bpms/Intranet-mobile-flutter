import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/skeletons/stylings.dart';
import 'package:intranet_movil/widget/skeletons/widgets.dart';

class ListviewBirthday extends StatefulWidget {
  const ListviewBirthday({Key? key}) : super(key: key);

  @override
  _ListviewCardsExamplePageState createState() =>
      _ListviewCardsExamplePageState();
}

class _ListviewCardsExamplePageState extends State<ListviewBirthday> {
  final bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _isLoading ? _skeletonView() : const ListviewBirthday(),
      ),
    );
  }

  Widget _skeletonView() => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(),
            child: SkeletonItem(
                child: Center(
                    child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          shape: BoxShape.circle,
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          lines: 3,
                          spacing: 6,
                          lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 5,
                              borderRadius: BorderRadius.circular(8),
                              minLength:
                                  MediaQuery.of(context).size.width / 4.5,
                              maxLength: MediaQuery.of(context).size.width / 4,
                              alignment: Alignment.bottomLeft)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          shape: BoxShape.circle,
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          lines: 3,
                          spacing: 6,
                          lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 5,
                              borderRadius: BorderRadius.circular(8),
                              minLength:
                                  MediaQuery.of(context).size.width / 4.5,
                              maxLength: MediaQuery.of(context).size.width / 4,
                              alignment: Alignment.bottomLeft)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          shape: BoxShape.circle,
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          lines: 3,
                          spacing: 6,
                          lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 5,
                              borderRadius: BorderRadius.circular(8),
                              minLength:
                                  MediaQuery.of(context).size.width / 4.5,
                              maxLength: MediaQuery.of(context).size.width / 4,
                              alignment: Alignment.bottomLeft)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ],
            ))),
          ),
        ),
      );
}
