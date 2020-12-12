import 'package:flutter_language_app/models/cart_box.dart';
import 'package:flutter_language_app/models/category_model.dart';

List categoryList() {
  List<CategoryModel> categoryCard = new List();

  categoryCard.add(CategoryModel('assets/background_category_card_1.jpg',
      'دوره مـبتدی', 'assets/rocket.png'));
  categoryCard.add(CategoryModel('assets/background_category_card_2.jpg',
      'دوره متوسـط', 'assets/rocket.png'));
  categoryCard.add(CategoryModel('assets/background_category_card_3.jpg',
      'دوره پیشرفتـه', 'assets/rocket.png'));

  return categoryCard;
}

List cartBoxList() {
  List<CartBoxModel> cartBox = new List();
  cartBox.add(CartBoxModel(
      "assets/Penguin3.jpg", "دوره تخصصی مـبتدی", "Elementary", "طلایی"));
  cartBox.add(CartBoxModel(
      "assets/Penguin2.jpg", "دوره تخصصی متوسـط", "Intermediate", "طلایی"));
  cartBox.add(CartBoxModel(
      "assets/Penguin.jpg", "دوره تخصصی پیشرفتـه", "Advanced", "طلایی"));
  return cartBox;
}
