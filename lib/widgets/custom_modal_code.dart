import 'package:dram/generated/l10n.dart';
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
             Icon(
              Icons.remove,
              size: 32,
              color: Theme.of(context).hintColor,
            ),
            Text(
              // 'Request a new code',
              S.of(context).requestNew,
              style: const TextStyle(
                fontSize: 20,
                // fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  CustomBtn(
                    // btnText: 'Send the message again',
                    btnText: S.of(context).sendAgain,
                    txtColor: Colors.white,
                    btnColor: Theme.of(context).primaryColor,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomBtn(
                    // btnText: '               Call me               ',
                    btnText: S.of(context).callMe,
                    txtColor: Theme.of(context).primaryColor,
                    btnColor: const Color.fromARGB(255, 249, 244, 244),
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
