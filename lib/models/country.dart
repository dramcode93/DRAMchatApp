import 'package:flutter/material.dart';

class CountryProvider with ChangeNotifier {
  String? selectedCountry;
  String? selectedCountryCode;

  void setCountry(String country, String countryCode) {
    selectedCountry = country;
    selectedCountryCode = countryCode;
    notifyListeners();
  }
}
