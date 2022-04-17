import 'package:flutter/material.dart';
import 'package:flutter_project/view/home.dart';
import 'package:grock/grock.dart';

import '../component/message.dart';
import '../service/firebase_service.dart';

class LoginRiverpod extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;

  void setVisible() {
    isVisible = !isVisible;
    notifyListeners();
  }

  void loginFunction() {
    FirebaseService.login(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      if (value!) {
        //SuccessMessage(title: "Başarılı", desc: "Giriş yaptınız.");
        Grock.toRemove(Home());
      } else {
        //ErrorMessage(title: "Başarısız", desc: "B")
        print("Bir sorun oldu.");
      }
    });
  }
}
