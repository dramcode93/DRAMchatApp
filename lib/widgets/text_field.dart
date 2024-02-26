import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.hintText, required this.onChanged});
  String? hintText;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.amber,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xff322653),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        // border: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.white),
        // ),
      ),
    );
  }
}
