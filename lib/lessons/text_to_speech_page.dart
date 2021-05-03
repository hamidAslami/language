import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/fakeData.dart';
import 'package:flutter_language_app/models/MultiQuestion.dart';
import 'package:flutter_language_app/theme/app_theme.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:flutter_language_app/theme/text_widgets.dart';
import 'package:flutter_language_app/widgets/image_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SpeechPage2 extends StatefulWidget {
  late final PageController controller;

  SpeechPage2(this.controller);

  @override
  State<StatefulWidget> createState() => SpeechPage2State();
}

enum TtsState { playing, stopped }

class SpeechPage2State extends State<SpeechPage2>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  FlutterTts? flutterTts;
  String language = "en-US";

  String? _newVoiceText;
  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;

  late TextEditingController controller;

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();
    flutterTts!.setLanguage(language);
    flutterTts!.setStartHandler(() {
      setState(() {
        print("playing");
        ttsState = TtsState.playing;
      });
    });

    flutterTts!.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts!.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _speak2() async {
    var result = await flutterTts!.speak("Bathroom");
    if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  Future _stop() async {
    var result = await flutterTts!.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts!.stop();
  }

  void _onChange(String text) {
    setState(() {
      _newVoiceText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    MultiQuestion question = multiQuestion();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: key,
        body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: standardSize(context),
              vertical: xxSmallSize(context)),
          child: SingleChildScrollView(
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
                            .copyWith(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: largeSize(context)),
                  child: Center(
                    child: Text(
                      "جـمله زیـر را تـرجمه کن !",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: smallSize(context)),
                      child: FloatingActionButton(
                        onPressed: _speak2,
                        elevation: 2,
                        backgroundColor: appTheme(context).accentColor,
                        splashColor: Color(0xffFF7146C7),
                        child: Icon(
                          Icons.music_note,
                        ),
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(right: smallSize(context)),
                      child: Text('حمام',
                          style: appTheme(context).textTheme.subtitle1),
                    )
                  ],
                ),

                Container(
                    alignment: Alignment.center,
                    width: fullWidth(context),
                    margin: EdgeInsets.symmetric(vertical: largeSize(context)),
                    child: _inputSection()),
                Container(
                  margin: EdgeInsets.only(
                    top: xxLargeSize(context) / 1.15,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: standardSize(context),
                      padding: EdgeInsets.symmetric(
                          horizontal: xxLargeSize(context),
                          vertical: smallSize(context)
                      ),
                    ),
                    onPressed: () async {
                        widget.controller.animateToPage(
                          widget.controller.page!.toInt() + 1,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInQuad,
                        );
                      },
                    child: Text(
                      "ادامـه دهـید",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontSize: caption1Size(context),
                          color: Theme.of(context).backgroundColor),
                    ),
                  )
                ), //ادامه دهید
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputSection() => Container(
      alignment: Alignment.topCenter,
      child: TextField(
        onChanged: (String value) {
          _onChange(value);
        },
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              bottom: xxLargeSize(context),
              right: smallSize(context),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(smallSize(context))),
            hintStyle: TextStyle(color: Colors.black26),
            hintText: 'متن رو وارد کن مثال ( حمام, فرهنگ , آپـارتمـان )',
            filled: true,
            fillColor: Colors.grey.shade100),
      ));
}
