import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/widgets/image_loading.dart';
import 'package:image_fade/image_fade.dart';


Widget imageWidget(String image, {BoxFit fit: BoxFit.cover}) {
  return ImageFade(
    placeholder: Container(
      color: Color(0xfff4f4f4),
    ),
    fit: fit,

    errorBuilder: (context, child, exception) => Container(child: Icon(Icons.error),),
    image: CachedNetworkImageProvider(image),
    loadingBuilder:
        (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
      // ignore: unnecessary_null_comparison
      if (loadingProgress == null) return child;
      return imageLoading();
    },
  );
}
