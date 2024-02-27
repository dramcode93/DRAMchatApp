import 'package:flutter/material.dart';

class UnderLineBtn extends StatelessWidget {
  const UnderLineBtn({super.key, required this.btnText, required this.onTap});
  final String btnText;
  final VoidCallback? onTap;
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
