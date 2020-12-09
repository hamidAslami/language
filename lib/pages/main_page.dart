import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/theme/colors.dart';

import 'bas/splash_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _index = 0;
  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;

  final iconList = <IconData>[
    Icons.home_filled,
    Icons.menu_book,
    Icons.headset,
    Icons.account_circle,
  ];

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
      () => _animationController.forward(),
    );
  } // ignore: missing_return

  Widget bodyWidget() {
    switch (_index) {
      case 0:
        // return HomePage();
      /*case 1:
        return DesigneApp();
      case 2:
        return ArtistAlbum();
      case 3:
        return NotificationPage();*/
      // case 4:
      //   return ProfilePage();
      default:
        // return HomePage();
    }
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ScaleTransition(
        scale: animation,
        child: FloatingActionButton(
          elevation: 8,
          child: Icon(
            Icons.brightness_3,
          ),
          onPressed: () {

          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _index,
        elevation: 30,
        inactiveColor: Colors.grey,
        notchAndCornersAnimation: animation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        gapLocation: GapLocation.center,

        onTap: (index) => setState(() => _index = index),
      ),
      body: bodyWidget(),
    );
  }
}
