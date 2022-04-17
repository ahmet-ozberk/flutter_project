import 'package:flutter/material.dart';
import 'package:flutter_project/assets.dart';
import 'package:flutter_project/service/firebase_service.dart';
import 'package:flutter_project/view/home.dart';
import 'package:flutter_project/view/login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:lottie/lottie.dart';

class Splash extends ConsumerStatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashState();
}

class _SplashState extends ConsumerState<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      FirebaseService.checkUser().then((value) {
        if (value!) {
          Grock.toRemove(const Home(), type: NavType.fade);
        } else {
          Grock.toRemove(const Login(), type: NavType.fade);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(Assets.lottie.splashJSON),
      ),
    );
  }
}
