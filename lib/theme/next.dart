import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'dimens.dart';

class State2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
          Align(
            alignment: Alignment.center,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade200,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: mediumSize(context)),
                height: fullHeight(context) / 7,
                width: fullWidth(context),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(fullWidth(context) / 1.8),
                      bottomLeft: Radius.circular(fullWidth(context) / 1.8),
                      bottomRight: Radius.circular(fullWidth(context)),
                      topRight: Radius.circular(fullWidth(context))),
                ),
              ),
            ),),
      ),
    );
  }

}