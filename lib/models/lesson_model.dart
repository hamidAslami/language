
import 'package:flutter/material.dart';

enum lessonType {video,speaking,words,writing,Exercises}

class Lesson {
  String image;
  String title;
  lessonType type;
  bool isDone;
  Color color;
  Function opPress;

  Lesson(this.image,this.title,this.type,this.isDone,this.color,this.opPress);

}

