import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/view/splash.dart';
import 'package:grock/grock.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  String title;
  bool isBack;
  bool isExit;
  @override
  final Size preferredSize;

  CustomAppBar(
      {Key? key, required this.title, this.isBack = false, this.isExit = false})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.w600),
      ),
      leading: isBack
          ? IconButton(
              tooltip: "Geri",
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black87,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      actions: isExit
          ? [
              IconButton(
                tooltip: "Çıkış Yap",
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Colors.black87,
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Grock.toRemove(Splash());
                },
              )
            ]
          : null,
      automaticallyImplyLeading: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0.3,
    );
  }
}
