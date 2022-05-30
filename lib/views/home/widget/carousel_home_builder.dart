import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intranet_movil/model/communique.dart';
import 'package:intranet_movil/views/home/widget/carrousel_item_card.dart';

class CarouselHomeBuilder extends StatefulWidget {
  const CarouselHomeBuilder({Key? key, required this.communiqueData})
      : super(key: key);
  final List<CommuniqueModel> communiqueData;

  @override
  State<CarouselHomeBuilder> createState() => _CarouselHomeBuilderState();
}

class _CarouselHomeBuilderState extends State<CarouselHomeBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: widget.communiqueData.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                FittedBox(
                    fit: BoxFit.scaleDown,
                    child: CarrouselItemCard(communiqueData: [
                      CommuniqueModel(
                          id: widget.communiqueData[index].id,
                          title: widget.communiqueData[index].title,
                          image: widget.communiqueData[index].image,
                          description: widget.communiqueData[index].description)
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
