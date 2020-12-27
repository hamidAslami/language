import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/models/chat_message.dart';
import 'package:flutter_language_app/models/message_type.dart';
import 'package:flutter_language_app/pages/chat/widgets/chat_appbar.dart';
import 'package:flutter_language_app/pages/chat/widgets/chat_bubble.dart';
import 'package:flutter_language_app/theme/dimens.dart';

class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: ChatDetailPageAppBar(),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
            height: fullHeight(context),
            child: Stack(
              children: <Widget>[
                Container(
                  height: fullHeight(context),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: ListView.builder(
                      itemCount: chatMessage.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                          top: mediumSize(context),
                          bottom: fullHeight(context) / 13),
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ChatBubble(
                          chatMessage: chatMessage[index],
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: sendMessageWidget(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

sendMessageWidget(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 1.0), //(x,y)
          blurRadius: 2.0,
        ),
      ],
    ),
    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
    child: Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          iconSize: iconSizeLarge(context),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            showModalSendFile(context);
          },
        ),
        Flexible(
          child: ConstrainedBox(
            constraints: new BoxConstraints(
                minWidth: fullWidth(context),
                maxWidth: fullWidth(context),
                maxHeight: fullHeight(context) / 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                onChanged: (value) {},
                decoration: InputDecoration.collapsed(
                  hintText: 'پیامتو بنویس..',
                ),
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send),
          iconSize: iconSizeLarge(context),
          color: Theme.of(context).primaryColor,
          // onPressed: () {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => RatingPage(),
          //       ));
          // },
        ),
      ],
    ),
  );
}

void showModalSendFile(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: MediaQuery.of(context).size.height / 3.4,
            color: Color(0xff737373),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Container(
                      height: 4,
                      width: 50,
                      color: Colors.grey.shade200,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    itemCount: menuItems.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: menuItems[index].color.shade50,
                            ),
                            height: 50,
                            width: 50,
                            child: Icon(
                              menuItems[index].icons,
                              size: 20,
                              color: menuItems[index].color.shade400,
                            ),
                          ),
                          title: Text(menuItems[index].text),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      });
}

List<ChatMessage> chatMessage = [
  ChatMessage(message: "سلام عزیز", type: MessageType.Receiver),
  ChatMessage(
      message: "فاکتور شما در حال برسی است", type: MessageType.Receiver),
  ChatMessage(
      message: "سلام ، ممنونم لطفا موجودی رو بهم اعلام کنید",
      type: MessageType.Sender),
  ChatMessage(
      message: "همه ی اجناسی که سفارش دادین موجود هست ",
      type: MessageType.Receiver),
  ChatMessage(message: "خیلی ممنونم", type: MessageType.Sender),
  ChatMessage(message: "خیلی ممنونم", type: MessageType.Sender),
  ChatMessage(message: "خیلی ممنونم", type: MessageType.Sender),
  ChatMessage(message: "خیلی ممنونم", type: MessageType.Sender),
  ChatMessage(message: "خیلی ممنونم", type: MessageType.Sender),
  ChatMessage(message: "خیلی ممنونم", type: MessageType.Sender),
  ChatMessage(message: "خیلی ممنونم", type: MessageType.Sender),
  ChatMessage(message: "خیلی ممنونم", type: MessageType.Sender),
  ChatMessage(message: "خیلی ممنونم", type: MessageType.Sender),
  ChatMessage(message: "خیلی ممنونم", type: MessageType.Sender),
  ChatMessage(message: "خیلی ممنونم", type: MessageType.Sender),
];

List<SendMenuItems> menuItems = [
  SendMenuItems(text: "ارسال تصویر", icons: Icons.image, color: Colors.amber),
  SendMenuItems(
      text: "ارسال فایل", icons: Icons.insert_drive_file, color: Colors.blue),
];

class SendMenuItems {
  String text;
  IconData icons;
  MaterialColor color;

  SendMenuItems(
      {@required this.text, @required this.icons, @required this.color});
}
