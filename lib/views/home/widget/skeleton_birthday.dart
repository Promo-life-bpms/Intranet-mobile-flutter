import 'package:flutter/material.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/home/create_post.dart';
import 'package:intranet_movil/widget/skeletons/stylings.dart';
import 'package:intranet_movil/widget/skeletons/widgets.dart';

class SkeletonBirthday extends StatefulWidget {
  const SkeletonBirthday({Key? key, required this.userData}) : super(key: key);

  final List<UserModel> userData;

  @override
  State<SkeletonBirthday> createState() => _PublicationCardState();
}

class _PublicationCardState extends State<SkeletonBirthday> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
             _skeletonView()
          ],
        ),
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
