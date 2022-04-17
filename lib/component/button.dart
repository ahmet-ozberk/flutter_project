import 'package:flutter/material.dart';
import 'package:flutter_project/constant/constant.dart';
import 'package:grock/grock.dart';

class Button extends StatelessWidget {
  Function onTap;
  String text;
  Button({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => onTap(),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          primary: Cons.mainGreen,
          shape: RoundedRectangleBorder(
            borderRadius: 10.allBR,
          ),
        ),
      ),
    );
  }
}
