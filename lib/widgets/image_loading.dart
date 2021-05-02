import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/theme/colors.dart';
import 'package:lottie/lottie.dart';

Widget imageLoading() {
  return Container(
      child: Center(child: LottieBuilder.asset('assets/lottie_loading.json')));
}
