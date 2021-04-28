import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:stacked/stacked.dart';

import 'wish_button_notifier.dart';

class WishButtonWidget extends StatelessWidget {
  final int productId;
  bool isLikedProduct;
  double likeSize;

  WishButtonWidget(this.productId, this.isLikedProduct,this.likeSize);

  @override
  Widget build(BuildContext context) {


    return ViewModelBuilder<NewWishVM>.reactive(
        viewModelBuilder: () => NewWishVM(),
        builder: (context, model, child) => LikeButton(
          onTap: (isLiked) {
            return model
                .changeWishListState()
                .whenComplete(() {
              isLikedProduct = !isLikedProduct;
              model.notifyListeners();
            });
          },
          circleColor: CircleColor(
              start: Colors.red.shade300,
              end: Colors.red.shade900,),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Colors.red.shade300,
            dotSecondaryColor: Colors.red.shade900,
          ),
          isLiked: isLikedProduct,
          likeBuilder: (bool isLiked) {
            return model.isBusy
                ? CupertinoActivityIndicator()
                : (!isLiked
                    ? Icon(Icons.favorite_border,
                        size: likeSize, color: Colors.grey)
                    : Icon(Icons.favorite,
                        color: Colors.red.shade700,
                        size: likeSize));
          },
        ));
  }
}
//
