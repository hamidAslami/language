import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';

class ListeningPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListeningPageState();
}

class ListeningPageState extends State<ListeningPage> {
  double sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            splashColor: theme.primaryColor,
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          title: Text(
            'داستان',
            style: theme.textTheme.headline4,
          ),
          actions: [
            IconButton(
              splashColor: theme.primaryColor,
              icon: Icon(Icons.upload_outlined, color: Colors.black),
              onPressed: () {},
            )
          ],
          centerTitle: true,
          backgroundColor: theme.backgroundColor,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: smallSize(context)),
          child: Stack(
            children: [
              Align(
                alignment: Alignment(0, -0.85),
                child: Container(
                  width: fullWidth(context) / 1.25,
                  height: fullHeight(context) / 2.5,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.78),
                child: Container(
                  width: fullWidth(context) / 1.57,
                  height: fullHeight(context) / 2.8,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius:
                          BorderRadius.circular(fullWidth(context) / 7.2),
                      image: DecorationImage(
                          image: AssetImage('assets/listening_picture.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                bottom: largeSize(context),
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'احمد و محمود',
                                style: theme.textTheme.headline4.copyWith(
                                  color: theme.primaryColorDark,
                                ),
                              ),
                            ),
                            Container(
                                child: Text(
                              'نوشته شده توسط جعفر موسوی',
                              style: theme.textTheme.bodyText1.copyWith(
                                  color: theme.primaryColorDark,
                                  fontWeight: FontWeight.bold),
                            )),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Container(
                          child: IconButton(
                            splashColor: theme.primaryColor,
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red.shade700,
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: standardSize(context),
                          bottom: xxSmallSize(context)),
                      child: Slider(
                        value: sliderValue,
                        onChanged: (g) {
                          setState(() {
                            sliderValue = g;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: xSmallSize(context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '13 : 01',
                            style: theme.textTheme.bodyText1
                                .copyWith(color: Colors.brown.shade800),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Text(
                            '21 : 02',
                            style: theme.textTheme.bodyText1
                                .copyWith(color: Colors.brown.shade800),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: smallSize(context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            splashColor: theme.primaryColor,
                            icon: SvgPicture.asset(
                              'assets/forward.svg',
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            splashColor: theme.primaryColor,
                            icon: Icon(Icons.fast_forward),
                            onPressed: () {},
                            color: Colors.black,
                          ),
                          FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: theme.primaryColor,
                            child: Icon(Icons.play_arrow),
                          ),
                          IconButton(
                            splashColor: theme.primaryColor,
                            icon: Icon(Icons.fast_rewind),
                            onPressed: () {},
                            color: Colors.black,
                          ),
                          IconButton(
                            splashColor: theme.primaryColor,
                            icon: SvgPicture.asset('assets/backward.svg'),
                            onPressed: () {},
                            color: Colors.black,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
