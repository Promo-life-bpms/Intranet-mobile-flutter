/* import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intranet_movil/model/publication.dart';
import 'package:intranet_movil/utils/constants.dart';

class CarrouselPublicationItemCard extends StatefulWidget {
  const CarrouselPublicationItemCard({Key? key, required this.publicationData})
      : super(key: key);

  final List<PublicationModel> publicationData;

  @override
  State<CarrouselPublicationItemCard> createState() => _CarrouselPublicationItemCardState();
}

class _CarrouselPublicationItemCardState extends State<CarrouselPublicationItemCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: CachedNetworkImage(
              imageUrl:
                  ApiIntranetConstans.baseUrl + widget.publicationData[0].,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Image(
                  image: AssetImage("lib/assets/lost_connection.png")),
            ),
      onDoubleTap: () {
        if (widget.communiqueData[0].image == "/img/communique.svg") {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Image(
                    image: AssetImage('lib/assets/communique.png'),
                    fit: BoxFit.contain,
                  )));
        } else {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CachedNetworkImage(
                  imageUrl: ApiIntranetConstans.baseUrl +
                      widget.communiqueData[0].image,
                  errorWidget: (context, url, error) => const Image(
                      image: AssetImage("lib/assets/lost_connection.png")))));
        }
      },
    );
  }
}
 */