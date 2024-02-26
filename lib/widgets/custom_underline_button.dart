import 'package:flutter/material.dart';

class UnderLineBtn extends StatelessWidget {
  UnderLineBtn({super.key, required this.btnText, required this.onTap});
  String btnText;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.blue,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          btnText,
          style: const TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
