import 'package:flutter/material.dart';
import 'package:flutter_project/model/category_model.dart';
import 'package:grock/grock.dart';

class HomeRiverpod extends ChangeNotifier {
  List<CategoryModel> categories = [];

  void init() {
    for (int i = 0; i < 8; i++) {
      categories.add(
        CategoryModel(
            image: i.randomImage(width: 500, height: 300), title: "Bitkiler $i")
      );
    }
  }
}
