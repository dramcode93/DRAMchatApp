import 'package:flutter/material.dart';

class UnderLineBtn extends StatelessWidget {
  const UnderLineBtn({
    super.key,
    required this.btnText,
    required this.onTap,
    required this.remainingSeconds,
  });
  final String btnText;
  final VoidCallback? onTap;
  final int? remainingSeconds;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: remainingSeconds! <= 0 ? Colors.blue : Colors.grey,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          btnText,
          style: TextStyle(
            color: remainingSeconds! <= 0 ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }
}
