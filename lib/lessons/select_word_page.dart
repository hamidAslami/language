import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/fakeData.dart';
import 'package:flutter_language_app/models/MultiQuestion.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:flutter_language_app/theme/text_widgets.dart';
import 'package:flutter_language_app/widgets/image_widget.dart';
import 'package:flutter_svg/svg.dart';

class SelectWordPage extends StatefulWidget {
  late final PageController controller;

  SelectWordPage(this.controller);

  @override
  State<StatefulWidget> createState() => SelectWordPageState();
}

class SelectWordPageState extends State<SelectWordPage> {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  Future<AudioPlayer> playWin() async {
    AudioCache cache = new AudioCache();

    return await cache.play("win.mp3");
  }

  Future<AudioPlayer> playLoss() async {
    AudioCache cache = new AudioCache();

    return await cache.play("wrong.mp3");
  }

  @override
  Widget build(BuildContext context) {
    MultiQuestion question = multiQuestion();
    return Scaffold(
      key: key,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: standardSize(context),
              vertical: xxSmallSize(context)),
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
                          .subtitle1!
                          .copyWith(color: Theme.of(context).accentColor),
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
              GridView.builder(
                shrinkWrap: true,
                itemCount: question.words.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => QuestionCard(question, index),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: xlargeSize(context)/1.2,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor,
                    elevation: standardSize(context),
                    padding: EdgeInsets.symmetric(
                        horizontal: xxLargeSize(context),
                        vertical: smallSize(context)
                    ),
                  ),
                  onPressed: () async {
                    if (question.selectedAnswer == question.answerCorrect) {
                      await playWin();

                      widget.controller.animateToPage(
                        widget.controller.page!.toInt() + 1,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInQuad,
                      );

                      print("dorost");
                    } else {
                      await playLoss();
                      setState(() {
                        question.selectedAnswer = "";
                      });
                      key.currentState!.showSnackBar(SnackBar(
                          elevation: 3,
                          margin: EdgeInsets.only(
                              bottom: xlargeSize(context),
                              right: standardSize(context),
                              left: standardSize(context)),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: Colors.redAccent,
                          content: Text(
                            "اشتباه گفتی ! دوباره امتحان کن!",
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.white),
                          )));
                      print("ghalat");
                    }
                  },
                  child: Text(
                    "ادامـه دهـید",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: caption1Size(context),
                        color: Theme.of(context).backgroundColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionCard extends StatefulWidget {
  final MultiQuestion _multiQuestion;
  int index;

  QuestionCard(this._multiQuestion, this.index);

  @override
  State<StatefulWidget> createState() => QuestionCardState();
}

class QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        setState(() {
          widget._multiQuestion.selectedAnswer =
              widget._multiQuestion.words[widget.index];
        });
      },
      child: Container(
        margin: EdgeInsets.all(smallSize(context)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: widget._multiQuestion.selectedAnswer ==
                          widget._multiQuestion.words[widget.index]
                      ? Colors.blueAccent
                      : Colors.grey.shade200,
                  blurRadius: 6,
                  spreadRadius: 3)
            ]),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              margin: EdgeInsets.only(top: smallSize(context)),
              child: imageWidget(
                widget._multiQuestion.images[widget.index],
                fit: BoxFit.cover,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: smallSize(context)),
                child: headline3(
                    context, widget._multiQuestion.words[widget.index]))
          ],
        ),
      ),
    );
  }
}
