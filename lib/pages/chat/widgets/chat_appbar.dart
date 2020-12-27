import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_language_app/theme/dimens.dart';

class ChatDetailPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: standardSize(context)),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 2,
              ),
              CircleAvatar(
                backgroundImage: AssetImage("assets/woman.png"),
                maxRadius: 20,
              ),
              SizedBox(
                width: mediumSize(context),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Jane Russel",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Online",
                      style: TextStyle(color: Colors.greenAccent, fontSize: 12),
                    ),
                  ],
                ),
              ),
              IconButton(
                // onPressed: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => InvoiceDetail()));
                // },
                icon: Icon(
                  Icons.assignment_sharp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
