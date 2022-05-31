import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ListviewPublication extends StatefulWidget {
  const ListviewPublication({Key? key}) : super(key: key);

  @override
  _ListviewProfilePageState createState() => _ListviewProfilePageState();
}

class _ListviewProfilePageState extends State<ListviewPublication> {
  bool _isLoading = true;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        child: _isLoading ? _skeletonView() : const ListviewPublication(),
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
        itemCount: 1,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(color: Colors.white),
            child: SkeletonItem(
                child: Column(
              children: [
                Row(
                  children: [
                    const SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        shape: BoxShape.circle,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: SkeletonParagraph(
                        style: SkeletonParagraphStyle(
                            lines: 1,
                            spacing: 6,
                            lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 10,
                              borderRadius: BorderRadius.circular(8),
                              minLength:
                                  MediaQuery.of(context).size.width / 2.5,
                              maxLength: MediaQuery.of(context).size.width / 2,
                            )),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
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
                                  maxLength:
                                      MediaQuery.of(context).size.width / 4,
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
                                  maxLength:
                                      MediaQuery.of(context).size.width / 4,
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
                                  maxLength:
                                      MediaQuery.of(context).size.width / 4,
                                  alignment: Alignment.bottomLeft)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        shape: BoxShape.circle,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: SkeletonParagraph(
                        style: SkeletonParagraphStyle(
                            lines: 3,
                            spacing: 6,
                            lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 10,
                              borderRadius: BorderRadius.circular(8),
                              minLength: MediaQuery.of(context).size.width / 6,
                              maxLength: MediaQuery.of(context).size.width / 3,
                            )),
                      ),
                    )
                  ],
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
                        height: 10,
                        borderRadius: BorderRadius.circular(8),
                        minLength: MediaQuery.of(context).size.width / 2,
                      )),
                ),
                const SizedBox(
                  height: 12,
                ),
                SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    width: double.infinity,
                    minHeight: MediaQuery.of(context).size.height / 8,
                    maxHeight: MediaQuery.of(context).size.height / 3,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        SkeletonAvatar(
                            style: SkeletonAvatarStyle(width: 20, height: 20)),
                        SizedBox(width: 8),
                        SkeletonAvatar(
                            style: SkeletonAvatarStyle(width: 20, height: 20)),
                        SizedBox(width: 8),
                        SkeletonAvatar(
                            style: SkeletonAvatarStyle(width: 20, height: 20)),
                      ],
                    ),
                    SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 16,
                          width: 64,
                          borderRadius: BorderRadius.circular(8)),
                    )
                  ],
                )
              ],
            )),
          ),
        ),
      );
}
