import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyImageWidget extends StatelessWidget {
  final String url;
  final double h;
    final double w;
        final double r;


  const MyImageWidget({Key? key, required this.url, required this.h, required this.w, required this.r}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(r)),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
