import 'package:flutter/cupertino.dart';

import 'message_type.dart';

class ChatMessage {
  String message;
  MessageType type;

  ChatMessage({required this.message, required this.type});
}
