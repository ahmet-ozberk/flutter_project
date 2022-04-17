import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class TextInput extends StatelessWidget {
  String? hintText;
  TextEditingController controller;
  bool? obscureText;
  Function(String value)? onSubmit;
  IconData? icon;
  Function? onSuffixChange;
  TextInput(
      {required this.controller,
      this.obscureText,
      this.onSubmit,
      this.hintText,
      this.icon,
      this.onSuffixChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 10.onlyBottomP,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: 10.allBR,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
            ),
          ]),
      child: TextField(
        controller: controller,
        obscureText: obscureText ?? false,
        onSubmitted: (value) => onSubmit!(value),
        decoration: InputDecoration(
          hintText: hintText,
          border: _border,
          enabledBorder: _border,
          focusedBorder: _border,
          disabledBorder: _border,
          contentPadding: [13, 12].horizontalAndVerticalP,
          suffixIcon: IconButton(
            onPressed: onSuffixChange != null && icon != null
                ? () => onSuffixChange!()
                : null,
            icon: Icon(icon),
          ),
        ),
      ),
    );
  }

  final OutlineInputBorder _border = OutlineInputBorder(
      borderRadius: 10.allBR,
      borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5));
}
