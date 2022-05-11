import 'package:flutter/material.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/widget/skeletons/stylings.dart';
import 'package:intranet_movil/widget/skeletons/widgets.dart';

class ListviewBanner extends StatefulWidget {
  @override
  _ListviewCardsExamplePageState createState() =>
      _ListviewCardsExamplePageState();
}

class _ListviewCardsExamplePageState extends State<ListviewBanner> {
  bool _isLoading = true;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _isLoading ? _skeletonView() : _contentView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleLoading,
        child: Icon(
          _isLoading ? Icons.hourglass_full : Icons.hourglass_bottom,
        ),
      ),
    );
  }

  Widget _skeletonView() => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
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
                    const SizedBox(
                      height: 12,
                    ),
                    SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          lines: 3,
                          spacing: 6,
                          lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 5,
                              borderRadius: BorderRadius.circular(8),
                              minLength: MediaQuery.of(context).size.width / 6,
                              maxLength: MediaQuery.of(context).size.width / 3,
                              alignment: Alignment.bottomLeft)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
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
                    const SizedBox(
                      height: 12,
                    ),
                    SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          lines: 3,
                          spacing: 6,
                          lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 5,
                              borderRadius: BorderRadius.circular(8),
                              minLength: MediaQuery.of(context).size.width / 7,
                              maxLength: MediaQuery.of(context).size.width / 4,
                              alignment: Alignment.bottomLeft)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
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
                    const SizedBox(
                      height: 12,
                    ),
                    SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          lines: 3,
                          spacing: 6,
                          lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 5,
                              borderRadius: BorderRadius.circular(8),
                              minLength: MediaQuery.of(context).size.width / 7,
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

  Widget _contentView() => ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            color: Colors.white,
            height: doubleInRange(MediaQuery.of(context).size.height / 8,
                MediaQuery.of(context).size.height / 2),
          ),
        ),
      );
}
