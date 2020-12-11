import 'package:flutter_language_app/models/category_model.dart';

List menuFood(){
  List<CategoryModel> categoryCard = new List();

  categoryCard.add(CategoryModel('assets/background_category_card_1.jpg','Read to Me','assets/image_category_1.png'));
  categoryCard.add(CategoryModel('assets/background_category_card_2.jpg','Children Drawing','assets/image_category_2.png'));
  categoryCard.add(CategoryModel('assets/background_category_card_3.jpg','Read to Me','assets/image_category_3.png'));

  return categoryCard;
}