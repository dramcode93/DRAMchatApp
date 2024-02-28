import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.btnText,
    required this.onTap,
    required this.btnColor,
    required this.txtColor,
  });
  final String btnText;
  final VoidCallback? onTap;
  final Color btnColor;
  final Color txtColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: btnColor,
        side: const BorderSide(
          width: 1.0,
          color: Color(0xff322653),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Text(
          btnText,
          style: TextStyle(color: txtColor, fontSize: 18),
        ),
      ),
    );
  }
}
