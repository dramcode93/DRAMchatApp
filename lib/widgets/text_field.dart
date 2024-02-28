import 'package:dram/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.obscureText = false,
  }) : super(key: key);
  final String? hintText;
  final Function(String)? onChanged;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 332,
      child: TextFormField(
        obscureText: obscureText!,
        validator: (data) {
          if (data!.isEmpty) {
            return S.of(context).requiredHint;
          }
          return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          // fillColor: Colors.amber,
          hintText: hintText,
          hintStyle: const TextStyle(
            // color: Color(0xff322653),
            // color: Color.fromARGB(255, 97, 80, 145),
            color: Colors.grey,
            // color: Colors.white,
            // color: Colors.grey,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              // color: Color.fromARGB(255, 97, 80, 145),
              color: Colors.grey,
              // color: Colors.white,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              // color: Color(0xff322653),
              // color: Color.fromARGB(255, 97, 80, 145),
              color: Colors.grey,
              // color: Colors.white,
            ),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              // color: Color(0xff322653),
              // color: Color.fromARGB(255, 97, 80, 145),
              // color: Colors.white,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
