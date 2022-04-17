import 'package:flutter/material.dart';
import 'package:flutter_project/component/message.dart';
import 'package:flutter_project/service/firebase_service.dart';
import 'package:grock/grock.dart';

import '../view/home.dart';

class RegisterRiverpod extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordReController = TextEditingController();
  bool isVisible = true;
  bool isReVisible = true;

  void setVisible() {
    isVisible = !isVisible;
    notifyListeners();
  }

  void setReVisible() {
    isReVisible = !isReVisible;
    notifyListeners();
  }

  void regFunction() {
    FirebaseService.register(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      if (value!) {
        //SuccessMessage(title: "Başarılı", desc: "Kayıt oldunuz.");
        Grock.toRemove(Home());
      } else {
        //ErrorMessage(title: "Başarısız", desc: "B")
        print("Bir sorun oldu.");
      }
    });
  }
}
