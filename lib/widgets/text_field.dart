import 'package:dram/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.hintText,
      required this.onChanged,
      this.obscureText = false,
      this.textController});
  final String? hintText;
  final Function(String)? onChanged;
  final bool? obscureText;
  TextEditingController? textController;
  @override
  Widget build(BuildContext context) {
    // final orientationDevice = MediaQuery.of(context).orientation;
// orientationDevice == Orientation.portrait ? :
    // final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // final appBar = AppBar();
    // print(appBar.preferredSize.height);
    // final bodyHeight = screenHeight -
    //     appBar.preferredSize.height -
    //     MediaQuery.of(context).padding.top;

    return SizedBox(
      width: screenWidth * 0.73,
      child: TextFormField(
        
        obscureText: obscureText!,
        controller: textController,
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
          hintStyle:  TextStyle(
            // color: Color(0xff322653),
            // color: Color.fromARGB(255, 97, 80, 145),
            color: Theme.of(context).hintColor,
            // color: Colors.white,
            // color: Theme.of(context).hintColor,
          ),
          focusedBorder:  UnderlineInputBorder(
            borderSide: BorderSide(
              // color: Color.fromARGB(255, 97, 80, 145),
              color: Theme.of(context).hintColor,
              // color: Colors.white,
            ),
          ),
          enabledBorder:  UnderlineInputBorder(
            borderSide: BorderSide(
              // color: Color(0xff322653),
              // color: Color.fromARGB(255, 97, 80, 145),
              color: Theme.of(context).hintColor,
              // color: Colors.white,
            ),
          ),
          border:  UnderlineInputBorder(
            borderSide: BorderSide(
              // color: Color(0xff322653),
              // color: Color.fromARGB(255, 97, 80, 145),
              // color: Colors.white,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
      ),
    );
  }
}
