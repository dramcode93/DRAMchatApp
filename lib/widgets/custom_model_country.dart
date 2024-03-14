import 'package:dram/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomModelCountry extends StatefulWidget {
  final Function(String) onCountrySelected;
  const CustomModelCountry({super.key, required this.onCountrySelected});

  @override
  State<CustomModelCountry> createState() => _CustomModelCountryState();
}

class _CustomModelCountryState extends State<CustomModelCountry> {
  String? country;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> countryOptions = [
      {
        'value': 'Egypt',
        'text': S.of(context).Egypt,
      },
      {
        'value': 'Canada',
        'text': S.of(context).Canada,
      },
      {
        'value': 'Palestine',
        'text': S.of(context).Palestine,
      },
      {
        'value': 'England',
        'text': S.of(context).England,
      },
    ];
    return SizedBox(
      height: 300,
      child: Center(
        child: Column(
          children: [
            const Icon(
              Icons.remove,
              size: 32,
              color: Colors.grey,
            ),
            Text(
              S.of(context).countryHint,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: countryOptions.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = countryOptions[index];
                  return RadioListTile(
                    title: Text(
                      '${item['text']}',
                    ),
                    value: item['value'],
                    groupValue: country,
                    onChanged: (value) {
                      setState(() {
                        Navigator.pop(context);
                        country = value;
                        widget.onCountrySelected(country!);
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
