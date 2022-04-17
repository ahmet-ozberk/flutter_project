import 'package:flutter/material.dart';
import 'package:flutter_project/model/category_model.dart';
import 'package:flutter_project/model/product_model.dart';
import 'package:grock/grock.dart';

class HomeRiverpod extends ChangeNotifier {
  List<CategoryModel> categories = [
    CategoryModel(
        image:
            "https://www.gidahatti.com/wp-content/uploads/2021/06/ulkemizde_illere_ve_bolgelere_gore_yetisen_tarim_urunleri_h19892_45657-1_750_400.jpg",
        title: "Tarım Ürünleri",
        items: [
          ProductModel(
              image: 0.randomImage(width: 500),
              title: "Terimler",
              description: "Zararlı içerikler"),
          ProductModel(
              image: 1.randomImage(width: 500),
              title: "Terimler",
              description: "Zararlı içerikler"),
          ProductModel(
              image: 2.randomImage(width: 500),
              title: "Terimler",
              description: "Zararlı içerikler"),
          ProductModel(
              image: 3.randomImage(width: 500),
              title: "Terimler",
              description: "Zararlı içerikler")
        ]),
  ];
}
