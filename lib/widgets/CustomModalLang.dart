import 'package:dram/generated/l10n.dart';
import 'package:dram/models/select_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class CustomModalLang extends StatefulWidget {
  const CustomModalLang({super.key});

  @override
  State<CustomModalLang> createState() => _CustomModalLangState();
}

class _CustomModalLangState extends State<CustomModalLang> {
  // final List<String> languages = ['English', 'Arabic', 'French', 'Spanish'];
  String? language = 'English';
  @override
  void initState() {
    super.initState();
    // Set the default language here
    final currentLocale = context.read<LanguageProvider>().currentLocale;
    if (currentLocale?.languageCode == 'ar') {
      language = 'arabic';
    } else if (currentLocale?.languageCode == 'en') {
      language = 'english';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> languageOptions = [
      {
        'value': 'arabic',
        'text': S.of(context).Arabic,
        'code': 'ar',
      },
      {
        'value': 'english',
        'text': S.of(context).English,
        'code': 'en',
      },
    ];

    return SizedBox(
      height: 220,
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.remove,
              size: 32,
              color: Theme.of(context).hintColor,
            ),
            Text(
              S.of(context).SelectLanguage,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                // color: Color(0xff322653),
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: languageOptions.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = languageOptions[index];
                  return RadioListTile(
                    title: Text(
                      '${item['text']} ${ui.window.locale.languageCode == item['code'] ? '\n${S.of(context).deviceLang}' : ''}',
                    ),
                    value: item['value'],
                    groupValue: language,
                    onChanged: (value) {
                      setState(() {
                        Navigator.pop(context);
                        context.read<LanguageProvider>().switchLanguage(value);
                        language = value;
                        // print(
                        //     "Language Code: ${ui.window.locale.languageCode}");
                        // print("Item Value: ${item['value']}");
                        // print("Item code: ${item['code']}");
                      });
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// void deviceLocal() {
//   final deviceLocale = ui.window.locale;
//   final String currentLocale;
//   if (deviceLocal == 'ar') {
//     currentLocale = 'arabic';
//   } else if (deviceLocale == 'en') {
//     currentLocale = 'english';
//   }
// }
