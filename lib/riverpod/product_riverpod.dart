import 'package:flutter/material.dart';
import 'package:flutter_project/model/product_model.dart';
import 'package:grock/grock.dart';

class ProductRiverpod extends ChangeNotifier {
  List<ProductModel> products = [];

  void init() {
    for (var i = 0; i < 15; i++) {
      products.add(
        ProductModel(
          image: i.randomImage(width: 500,height: 300),
          title: "Başlık $i",
          description: "Açıklama metni yazısı $i",
        ),
      );
    }
  }
}
