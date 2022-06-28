/* import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intranet_movil/model/communique.dart';
import 'package:intranet_movil/model/publication.dart';
import 'package:intranet_movil/views/home/widget/carrousel_item_card.dart';
import 'package:intranet_movil/views/home/widget/carrousel_publication_item_card.dart';

class CarouselPublicationBuilder extends StatefulWidget {
  const CarouselPublicationBuilder({Key? key, required this.publicationData})
      : super(key: key);
  final List<PublicationModel> publicationData;

  @override
  State<CarouselPublicationBuilder> createState() => _CarouselPublicationBuilderState();
}

class _CarouselPublicationBuilderState extends State<CarouselPublicationBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: widget.publicationData.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                FittedBox(
                    fit: BoxFit.scaleDown,
                    child: CarrouselPublicationItemCard(communiqueData: [
                      PublicationModel(id: widget.publicationData[index].id, userId: widget.publicationData[index].userId, photo: widget.publicationData[index].photo, userName: widget.publicationData[index].userName, created: widget.publicationData[index].created, contentPublication: widget.publicationData[index].contentPublication, photoPublication: photoPublication, likes: widget.publicationData[index].likes, isLike: widget.publicationData[index].isLike, comments: widget.publicationData[index].comments)
                    ])),
            options: CarouselOptions(
              height: 350,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 2,
            ),
          ),
        ],
      ),
    );
  }
}
 */