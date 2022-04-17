import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/view/login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:lottie/lottie.dart';

import '../assets.dart';
import '../component/button.dart';
import '../component/text_input.dart';
import '../riverpod/riverpod_management.dart';

class Register extends ConsumerStatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Register> {
  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(registerRiverpod);
    var read = ref.read(registerRiverpod);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: [20, 40].horizontalAndVerticalP,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Lottie.asset(Assets.lottie.loginJSON,
                    height: Grock.height * 0.33),
              ),
              Text(
                "Kayıt Ol",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                height: Grock.height * 0.05,
              ),
              TextInput(
                controller: read.emailController,
                hintText: "E-mail adresi",
              ),
              TextInput(
                controller: read.passwordController,
                hintText: "Şifre",
                obscureText: read.isVisible,
                icon: read.isVisible ? Icons.visibility_off : Icons.visibility,
                onSuffixChange: () => read.setVisible(),
              ),
              TextInput(
                controller: read.passwordReController,
                hintText: "Tekrar Şifre",
                obscureText: read.isReVisible,
                icon:
                    read.isReVisible ? Icons.visibility_off : Icons.visibility,
                onSuffixChange: () => read.setReVisible(),
              ),
              Button(text: "Kayıt Ol", onTap: () => read.regFunction()),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Bir hesabın var mı? ",
                    children: [
                      TextSpan(
                        text: "Giriş Yap",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Grock.toRemove(Login(),
                              type: NavType.bottomToTop),
                      ),
                    ],
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
