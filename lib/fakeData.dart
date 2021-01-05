import 'package:flutter/material.dart';
import 'package:flutter_language_app/models/cart_box.dart';
import 'package:flutter_language_app/models/category_model.dart';

import 'models/lesson_model.dart';

List categoryList() {
  List<CategoryModel> categoryCard = new List();

  categoryCard.add(CategoryModel('assets/bg_category_card_yellow.jpg',
      'دوره مـبتدی', 'assets/pic_rocket.png'));
  categoryCard.add(CategoryModel('assets/bg_category_card_blue.jpg',
      'دوره متوسـط', 'assets/pic_rocket.png'));
  categoryCard.add(CategoryModel('assets/bg_category_card_pink.jpg',
      'دوره پیشرفتـه', 'assets/pic_rocket.png'));

  return categoryCard;
}

List lessonList(BuildContext context) {
  List<Lesson> lessonList = new List();

  var theme = Theme.of(context);
  lessonList.add(Lesson("https://s16.picofile.com/file/8417349934/teacher.jpg",
      "آموزش گرامر", lessonType.video, true, theme.primaryColor));

  lessonList.add(Lesson("https://s17.picofile.com/file/8417350200/talk.jpg",
      "صحبت کن !", lessonType.speaking, true, theme.accentColor));
  lessonList.add(Lesson("https://s16.picofile.com/file/8417350600/Write.jpg",
      "بنویس تا یادت بمونه !", lessonType.writing, true, Colors.pink));
  lessonList.add(Lesson("https://s17.picofile.com/file/8417351634/Book3.jpg",
      "کلمات رو حفظ کن!", lessonType.words, false, Colors.indigoAccent));
  lessonList.add(Lesson("https://s16.picofile.com/file/8417352300/quiz5.jpg",
      "وقتشه خودتو محک بزنی!", lessonType.Exercises, false, Colors.red));
  return lessonList;
}

List homeLessonList() {
  List<CartBoxModel> homeLessonList = new List();
  homeLessonList.add(CartBoxModel(
      "https://s16.picofile.com/file/8417344384/Family.jpg",
      "خانواده و فامیل",
      "The Family",
      "طلایی"));
  homeLessonList.add(CartBoxModel(
      "https://s16.picofile.com/file/8417343834/Countries.jpg",
      "کشور ها و زبانها",
      "Country and Nationality",
      "طلایی"));
  homeLessonList.add(CartBoxModel(
      "https://s16.picofile.com/file/8417344242/Romance.jpg",
      "عشق و علاقه",
      "Lovely",
      "طلایی"));
  homeLessonList.add(CartBoxModel(
      "https://s16.picofile.com/file/8417344742/Weather.jpg",
      "فصل ها و اقلیم ها",
      "Seasons and climates",
      "طلایی"));

  homeLessonList.add(CartBoxModel(
      "https://s16.picofile.com/file/8417344250/travel.jpg",
      "سفر کردن",
      "Travel",
      "طلایی"));

  homeLessonList.add(CartBoxModel(
      "https://s16.picofile.com/file/8417348918/activities.jpg",
      "فعالیت ها",
      "Activities",
      "طلایی"));

  homeLessonList.add(CartBoxModel(
      "https://s16.picofile.com/file/8417346692/travel9.jpg",
      "تدارک سفر",
      "Travel preparation",
      "طلایی"));

  homeLessonList.add(CartBoxModel(
      "https://s16.picofile.com/file/8417344468/public.jpg",
      "حمل و نقل عمومی",
      "Public transportation",
      "طلایی"));

  return homeLessonList;
}
