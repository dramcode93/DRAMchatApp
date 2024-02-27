
import 'package:dram/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomModalCode extends StatelessWidget {
  const CustomModalCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Request a new code',
                style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  CustomBtn(
                    btnText: 'Send the message again',
                    txtColor: Colors.white,
                    btnColor: const Color(0xff322653),
                    onTap: () {},
                  ),
                  CustomBtn(
                    btnText:
                        '               Call me               ',
                    txtColor: const Color(0xff322653),
                    btnColor:
                        Color.fromARGB(255, 249, 244, 244),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
