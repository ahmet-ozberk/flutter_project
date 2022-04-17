import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project/component/message.dart';

class FirebaseService {
  static Future<bool?> checkUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final name = user.displayName;
      final email = user.email;
      final emailVerified = user.emailVerified;
      final uid = user.uid;
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  static Future<bool?> register(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Yeteraiz şifre gücü.');
        ErrorMessage(
            title: "Başarısız",
            desc: "Yetersiz şifre gücü, lütfen tekrar deneyin.");
        return Future.value(false);
      } else if (e.code == 'email-already-in-use') {
        print('Bu email zaten kullanılıyor.');
        ErrorMessage(
            title: "Başarısız",
            desc: "Bu mail adresi zaten kullanılıyor, lütfen tekrar deneyin.");
        return Future.value(false);
      }
    } catch (e) {
      print(e);
      ErrorMessage(
          title: "Başarısız",
          desc: "Bir sorun oluştu: ${e.toString().substring(0, 40)}");
      return Future.value(true);
    }
  }

  static Future<bool?> login(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Kullanıcı bulunamadı.');
        ErrorMessage(title: "Başarısız", desc: "Kullanıcı bulunamadı.");
        return Future.value(false);
      } else if (e.code == 'wrong-password') {
        print('Bu kullanıcı için yanlış şifre sağlandı.');
        ErrorMessage(
            title: "Başarısız", desc: "Bu kullanıcı için yanlış şifre.");
        return Future.value(false);
      }
    } catch (e) {
      print(e);
      ErrorMessage(
          title: "Başarısız",
          desc: "Bir sorun oluştu: ${e.toString().substring(0, 40)}");
      return Future.value(true);
    }
  }
}
