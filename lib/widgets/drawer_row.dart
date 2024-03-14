import 'package:flutter/material.dart';

class DrawerRow extends StatelessWidget {
  const DrawerRow({super.key, required this.title, required this.icon});
  final String? title;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 32, left: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title!,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16),
            height: 44,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color.fromARGB(255, 226, 219, 239),
            ),
            child: icon,
          ),
        ],
      ),
    );
  }
}
