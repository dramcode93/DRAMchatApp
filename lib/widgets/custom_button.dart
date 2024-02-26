import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  CustomBtn({
    super.key,
    required this.btnText,
    required this.onTap,
    required this.btnColor,
    required this.txtColor,
  });
  String btnText;
  VoidCallback? onTap;
  Color btnColor;
  Color txtColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: btnColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Text(
          btnText,
          style: TextStyle(color: txtColor, fontSize: 17),
        ),
      ),
    );
  }
}
