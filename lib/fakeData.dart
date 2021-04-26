import 'package:flutter/material.dart';
import 'package:flutter_language_app/lessons/base_page.dart';
import 'package:flutter_language_app/models/cart_box.dart';
import 'package:flutter_language_app/models/category_model.dart';

import 'lessons/intro_lesson_page.dart';
import 'models/lesson_model.dart';
import 'models/MultiQuestion.dart';

List categoryList() {
  List<CategoryModel> categoryCard = []
  ;

  categoryCard.add(CategoryModel('assets/bg_category_card_yellow.jpg',
      'دوره مـبتدی', 'assets/pic_rocket.png'));
  categoryCard.add(CategoryModel('assets/bg_category_card_blue.jpg',
      'دوره متوسـط', 'assets/pic_rocket.png'));
  categoryCard.add(CategoryModel('assets/bg_category_card_pink.jpg',
      'دوره پیشرفتـه', 'assets/pic_rocket.png'));

  return categoryCard;
}

List lessonList(BuildContext context) {
  List<Lesson> lessonList = [];

  var theme = Theme.of(context);
  lessonList.add(Lesson("https://s16.picofile.com/file/8417349934/teacher.jpg",
      "آموزش گرامر", lessonType.video, true, theme.primaryColor, () {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => LessonDetailPage()));
  }));

  lessonList.add(Lesson("https://s17.picofile.com/file/8417350200/talk.jpg",
      "صحبت کن !", lessonType.speaking, true, theme.accentColor, () {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => BaseLessonPage()));
  }));
  lessonList.add(Lesson("https://s16.picofile.com/file/8417350600/Write.jpg",
      "بنویس تا یادت بمونه !", lessonType.writing, true, Colors.pink, () {}));
  lessonList.add(Lesson("https://s17.picofile.com/file/8417351634/Book3.jpg",
      "کلمات رو حفظ کن!", lessonType.words, false, Colors.indigoAccent, () {}));
  lessonList.add(Lesson("https://s16.picofile.com/file/8417352300/quiz5.jpg",
      "وقتشه خودتو محک بزنی!", lessonType.Exercises, false, Colors.red, () {}));
  return lessonList;
}

List homeLessonList() {
  List<CartBoxModel> homeLessonList = [];
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

MultiQuestion multiQuestion() {
  return MultiQuestion([
    "Boy",
    "Girl",
    "Father",
    "Mother"
  ], [
    "https://www.flaticon.com/svg/static/icons/svg/145/145867.svg",
    "https://www.flaticon.com/svg/static/icons/svg/145/145852.svg",
    "https://www.flaticon.com/svg/static/icons/svg/145/145859.svg",
    "https://www.flaticon.com/svg/static/icons/svg/145/145862.svg"
  ], "Girl","");
}
