import 'package:flutter_project/model/product_model.dart';

class CategoryModel {
  String image;
  String title;
  List<ProductModel> items;
  CategoryModel({required this.image, required this.title,required this.items});
}
