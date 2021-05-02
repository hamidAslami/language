import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/widgets/image_loading.dart';

Widget imageWidget(String image, {BoxFit fit: BoxFit.cover}) {
  return CachedNetworkImage(
    fit: fit,

    fadeInCurve: Curves.easeInCubic,
    fadeInDuration: Duration(milliseconds: 200),
    imageUrl: image ?? "",
    placeholder: (context, url) => Container(
      child: Center(
        child: imageLoading(),
      ),
    ),

    errorWidget: (context, url, error) => Center(
        child: Container(
      child: Icon(Icons.broken_image),
    )),
    // progressIndicatorBuilder: (context, url, downloadProgress) =>
    //     CupertinoActivityIndicator(),
  );
}
