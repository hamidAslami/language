import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/models/chat_message.dart';
import 'package:flutter_language_app/models/message_type.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:flutter_language_app/theme/text_widgets.dart';


class ChatBubble extends StatefulWidget {
  final ChatMessage chatMessage;

  ChatBubble({@required this.chatMessage});

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: standardSize(context),
          right: standardSize(context),
          top: mediumSize(context),
          bottom: mediumSize(context)),
      child: Align(
        alignment: (widget.chatMessage.type == MessageType.Receiver
            ? Alignment.topLeft
            : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: (widget.chatMessage.type == MessageType.Receiver
                ? Colors.white
                : Colors.blueGrey),
          ),
          padding: EdgeInsets.all(standardSize(context)),
          child: bodyText2(context,widget.chatMessage.message,color: widget.chatMessage.type == MessageType.Receiver ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
