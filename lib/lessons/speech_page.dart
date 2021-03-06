import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/fakeData.dart';
import 'package:flutter_language_app/models/MultiQuestion.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:flutter_language_app/theme/text_widgets.dart';
import 'package:flutter_language_app/widgets/image_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechPage extends StatefulWidget {
  final PageController controller;

  SpeechPage(this.controller);

  @override
  State<StatefulWidget> createState() => SpeechPageState();
}

class SpeechPageState extends State<SpeechPage>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  Future<AudioPlayer> playWin() async {
    AudioCache cache = new AudioCache();

    return await cache.play("win.mp3");
  }

  Future<AudioPlayer> playLoss() async {
    AudioCache cache = new AudioCache();

    return await cache.play("wrong.mp3");
  }

  double blurRadius = 1;
  double spreadRadius = 4;

  bool _hasSpeech = false;
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = '';
  String lastError = '';
  String lastStatus = '';
  String _currentLocaleId = '';
  int resultListened = 0;
  List<LocaleName> _localeNames = [];
  final SpeechToText speech = SpeechToText();
  String text = "";

  @override
  void initState() {
    if (!_hasSpeech) {
      initSpeechState();
    }
  }

  Future<void> initSpeechState() async {
    var hasSpeech = await speech.initialize(
        onError: errorListener,
        onStatus: statusListener,
        debugLogging: true,
        finalTimeout: Duration(milliseconds: 0));
    if (hasSpeech) {
      _localeNames = await speech.locales();

      var systemLocale = await speech.systemLocale();
      _currentLocaleId = systemLocale!.localeId;
    }

    if (!mounted) return;

    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  void startListening() {
    lastWords = '';
    lastError = '';
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 5),
        pauseFor: Duration(seconds: 5),
        partialResults: false,
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        listenMode: ListenMode.confirmation);
    setState(() {});
  }

  void stopListening() {
    speech.stop();
    setState(() {
      level = 0.0;
    });
  }

  void cancelListening() {
    speech.cancel();
    setState(() {
      level = 0.0;
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    ++resultListened;
    print('Result listener $resultListened');
    setState(() {
      lastWords = '${result.recognizedWords} - ${result.finalResult}';
      text = lastWords;
    });
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    // print("sound level $level: $minSoundLevel - $maxSoundLevel ");
    setState(() {
      this.level = level;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    // print("Received error status: $error, listening: ${speech.isListening}");
    setState(() {
      lastError = '${error.errorMsg} - ${error.permanent}';
    });
  }

  void statusListener(String status) {
    // print(
    // 'Received listener status: $status, listening: ${speech.isListening}');
    setState(() {
      lastStatus = '$status';
    });
  }

  void _switchLang(selectedVal) {
    setState(() {
      _currentLocaleId = selectedVal;
    });
    print(selectedVal);
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
                      "جمله",
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
                  "جمله ی زیر رو تکرار کن !",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: fullWidth(context),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: imageWidget('https://s18.picofile.com/file/8432329126/photo_1512626120412_faf41adb4874.jpg')),
                margin: EdgeInsets.symmetric(vertical: smallSize(context)),
                height: fullWidth(context) / 2,
              ),
              Container(
                margin: EdgeInsets.only(top: mediumSize(context)),
                alignment: Alignment.center,
                child: headline3(context, "Hello ! How are you ?"),
              ),
              Text(
                text,
                style: TextStyle(color: Colors.redAccent),
              ),
              Container(
                margin: EdgeInsets.only(top: standardSize(context)),
                alignment: Alignment.center,
                child: Material(
                  elevation: 2,
                  type: MaterialType.button,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(1000),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(130, 237, 125, 58),
                            blurRadius: blurRadius,
                            spreadRadius: spreadRadius)
                      ],
                      borderRadius: BorderRadius.circular(1000),
                      gradient: RadialGradient(
                        center: Alignment(0.55, 0.55),
                        focalRadius: 40,
                        colors: [
                          Color(0xFFffb401),
                          Color(0xffffa43d),
                        ],
                      ),
                    ),
                    child: GestureDetector(
                      onLongPress: () {
                        setState(() {
                          if (!_hasSpeech || speech.isListening) {
                          } else {
                            blurRadius = 8;
                            spreadRadius = 12;
                            startListening();
                          }
                        });
                      },
                      behavior: HitTestBehavior.opaque,
                      onLongPressEnd: (details) {
                        setState(() {
                          blurRadius = 1;
                          spreadRadius = 4;
                          stopListening();
                          print(lastWords);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Icon(
                          Icons.mic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: largeSize(context),
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
