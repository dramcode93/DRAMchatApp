import 'package:dram/generated/l10n.dart';
import 'package:dram/models/country.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Country {
  final String id;
  final String name;
  final String code;
  final String emoji;
  final String unicode;
  final String dialCode;
  final String image;

  Country({
    required this.id,
    required this.name,
    required this.code,
    required this.emoji,
    required this.unicode,
    required this.dialCode,
    required this.image,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['_id'] ?? 'id',
      name: json['name'] ?? 'name',
      code: json['code'] ?? 'code',
      emoji: json['emoji'] ?? 'emoji',
      unicode: json['unicode'] ?? 'unicode',
      dialCode: json['dial_code'] ?? 'dial_code',
      image: json['image'] ?? 'image',
    );
  }
}

class CustomModelCountry extends StatefulWidget {
  final Function(String, String) onCountrySelected;
  const CustomModelCountry({super.key, required this.onCountrySelected});

  @override
  State<CustomModelCountry> createState() => _CustomModelCountryState();
}

class _CustomModelCountryState extends State<CustomModelCountry> {
  String? country;

  String? selectedCountry;
  List<Country> countries = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://dramchatapi.giize.com/api/countries'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> countryList = data['data'];
        setState(() {
          countries =
              countryList.map((json) => Country.fromJson(json)).toList();
        });
        print('success');
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

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
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: countryOptions.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       final item = countryOptions[index];
            //       return RadioListTile(
            //         title: Text(
            //           '${item['text']}',
            //         ),
            //         value: item['value'],
            //         groupValue: country,
            //         onChanged: (value) {
            //           setState(() {
            //             Navigator.pop(context);
            //             country = value;
            //             widget.onCountrySelected(country!);
            //           });
            //         },
            //       );
            //     },
            //   ),
            // )
            Expanded(
              child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (BuildContext context, int index) {
                  final country = countries[index];
                  return RadioListTile(
                    title: Text(
                      '${country.emoji} ${country.name}',
                    ),
                    value: '${country.emoji} ${country.name}',
                    groupValue:
                        context.watch<CountryProvider>().selectedCountry,
                    onChanged: (value) {
                      context.read<CountryProvider>().setCountry(
                            value.toString(),
                            country.dialCode,
                          );
                      setState(() {
                        Navigator.pop(context);
                        widget.onCountrySelected(
                          value.toString(),
                          country.dialCode,
                        );
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
