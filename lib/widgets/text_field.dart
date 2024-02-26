import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.hintText, required this.onChanged});
  String? hintText;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 332,
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return 'required';
          }
          return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          // fillColor: Colors.amber,
          hintText: hintText,
          hintStyle: const TextStyle(
            // color: Color(0xff322653),
            color: Color.fromARGB(255, 97, 80, 145),
            // color: Colors.white,
            // color: Colors.grey,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 97, 80, 145),
              // color: Colors.white,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              // color: Color(0xff322653),
              color: Color.fromARGB(255, 97, 80, 145),
              // color: Colors.white,
            ),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              // color: Color(0xff322653),
              color: Color.fromARGB(255, 97, 80, 145),
              // color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
