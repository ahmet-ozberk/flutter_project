import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/assets.dart';
import 'package:flutter_project/component/button.dart';
import 'package:flutter_project/component/text_input.dart';
import 'package:flutter_project/riverpod/riverpod_management.dart';
import 'package:flutter_project/view/register.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:lottie/lottie.dart';

class Login extends ConsumerStatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(loginRiverpod);
    var read = ref.read(loginRiverpod);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: [20, 40].horizontalAndVerticalP,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Lottie.asset(Assets.lottie.loginJSON,
                  height: Grock.height * 0.43),
              Text(
                "Giriş Yap",
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
              Button(text: "Giriş Yap", onTap: () =>read.loginFunction()),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Bir hesabın yok mu? ",
                    children: [
                      TextSpan(
                        text: "Kayıt Ol",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Grock.toRemove(Register(),type: NavType.topToBottom),
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
