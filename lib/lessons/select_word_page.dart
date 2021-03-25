import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/models/word_model.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:flutter_language_app/theme/text_widgets.dart';
import 'package:flutter_svg/svg.dart';

class SelectWordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SelectWordPageState();
}

class SelectWordPageState extends State<SelectWordPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: standardSize(context), vertical: xxSmallSize(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/new.svg",
                  width: iconSizeXLarge(context),
                  height: iconSizeXLarge(context),
                ),
                Container(
                  margin: EdgeInsets.only(right: smallSize(context)),
                  child: Text(
                    "کلمه جدید",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: smallSize(context)),
              child: Text(
                "کدام کلمه به معنای دختر است ؟",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              children: [
                WordCard(
                    Word(
                      "Boy",
                      "https://www.flaticon.com/svg/static/icons/svg/145/145867.svg",
                    ),
                    1),
                WordCard(
                    Word("Girl",
                        "https://www.flaticon.com/svg/static/icons/svg/145/145852.svg"),
                    2),
                WordCard(
                    Word("Father",
                        "https://www.flaticon.com/svg/static/icons/svg/145/145859.svg"),
                    3),
                WordCard(
                    Word("Mother",
                        "https://www.flaticon.com/svg/static/icons/svg/145/145862.svg"),
                    4),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WordCard extends StatefulWidget {
  final Word word;
  final int number;

  WordCard(this.word, this.number);

  @override
  State<StatefulWidget> createState() => WordCardState();
}

class WordCardState extends State<WordCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        setState(() {
          // if( widget.word.number = widget.number)
          widget.word.number = widget.number;

        });
      },
      child: Container(
        margin: EdgeInsets.all(smallSize(context)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: widget.word.number == widget.number
                      ? Colors.blueAccent
                      : Colors.grey.shade200,
                  blurRadius: 6,
                  spreadRadius: 3)
            ]),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: smallSize(context)),
              child: SvgPicture.network(
                widget.word.image,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: smallSize(context)),
                child: headline3(context, widget.word.word))
          ],
        ),
      ),
    );
  }
}
