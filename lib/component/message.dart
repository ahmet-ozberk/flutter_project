import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/constant/constant.dart';
import 'package:grock/grock.dart';

SuccessMessage({required String title, required String desc}) {
  Grock.snackBar(
      title: title,
      description: desc,
      bgColor: Cons.lowGreen,
      borderRadius: 10,
      opacity: 0.8,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      icon: CupertinoIcons.checkmark,
      iconColor: Colors.white);
}

ErrorMessage({required String title, required String desc}) {
  Grock.snackBar(
      title: title,
      description: desc,
      bgColor: CupertinoColors.destructiveRed,
      opacity: 0.8,
      borderRadius: 10,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      icon: CupertinoIcons.clear_thick,
      iconColor: Colors.white);
}
