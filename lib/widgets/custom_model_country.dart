import 'package:dram/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomModelCountry extends StatefulWidget {
  final Function(String) onCountrySelected;
  const CustomModelCountry({super.key, required this.onCountrySelected});

  @override
  State<CustomModelCountry> createState() => _CustomModelCountryState();
}

class _CustomModelCountryState extends State<CustomModelCountry> {
  String? country = '';

  @override
  Widget build(BuildContext context) {
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
            RadioListTile(
                title: Text(S.of(context).Egypt),
                value: 'Egypt',
                groupValue: country,
                onChanged: (value) {
                  setState(() {
                    Navigator.pop(context);
                    country = value;
                    widget.onCountrySelected(country!);
                  });
                }),
            RadioListTile(
                title: Text(S.of(context).Egypt),
                value: 'Canada',
                groupValue: country,
                onChanged: (value) {
                  setState(() {
                    Navigator.pop(context);
                    country = value;
                    widget.onCountrySelected(country!);
                  });
                }),
            RadioListTile(
                title: Text(S.of(context).Egypt),
                value: 'Philistine',
                groupValue: country,
                onChanged: (value) {
                  setState(() {
                    Navigator.pop(context);
                    country = value;
                    widget.onCountrySelected(country!);
                  });
                }),
            RadioListTile(
                title: Text(S.of(context).Egypt),
                value: 'England',
                groupValue: country,
                onChanged: (value) {
                  setState(() {
                    Navigator.pop(context);

                    country = value;
                    widget.onCountrySelected(country!);
                  });
                })
          ],
        ),
      ),
    );
  }
}
