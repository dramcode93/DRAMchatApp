// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Create Your Profile`
  String get profileTitle {
    return Intl.message(
      'Create Your Profile',
      name: 'profileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get profileHint {
    return Intl.message(
      'Name',
      name: 'profileHint',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get ProfileFinish {
    return Intl.message(
      'Finish',
      name: 'ProfileFinish',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get Camera {
    return Intl.message(
      'Camera',
      name: 'Camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallary`
  String get Gallary {
    return Intl.message(
      'Gallary',
      name: 'Gallary',
      desc: '',
      args: [],
    );
  }

  /// `Delete image`
  String get DeleteImage {
    return Intl.message(
      'Delete image',
      name: 'DeleteImage',
      desc: '',
      args: [],
    );
  }

  /// `Create Your Password`
  String get PasswordTitle {
    return Intl.message(
      'Create Your Password',
      name: 'PasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get PasswordHint {
    return Intl.message(
      'Password',
      name: 'PasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get ConfirmPasswordHint {
    return Intl.message(
      'Confirm Password',
      name: 'ConfirmPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get SubmitPassword {
    return Intl.message(
      'Submit',
      name: 'SubmitPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get numberTitle {
    return Intl.message(
      'Enter your phone number',
      name: 'numberTitle',
      desc: '',
      args: [],
    );
  }

  /// `Make sure this number receives SMS and calls you will receive an activation code through it`
  String get numberDescription {
    return Intl.message(
      'Make sure this number receives SMS and calls you will receive an activation code through it',
      name: 'numberDescription',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get countryHint {
    return Intl.message(
      'Country',
      name: 'countryHint',
      desc: '',
      args: [],
    );
  }

  /// `Egypt`
  String get Egypt {
    return Intl.message(
      'Egypt',
      name: 'Egypt',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get codeHint {
    return Intl.message(
      'Code',
      name: 'codeHint',
      desc: '',
      args: [],
    );
  }

  /// `Required!`
  String get requiredHint {
    return Intl.message(
      'Required!',
      name: 'requiredHint',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneHint {
    return Intl.message(
      'Phone number',
      name: 'phoneHint',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `You have entered the phone number:\n\n`
  String get alertTitle {
    return Intl.message(
      'You have entered the phone number:\n\n',
      name: 'alertTitle',
      desc: '',
      args: [],
    );
  }

  /// `Is this number correct\nor do you want to modify the number?`
  String get alertDescription {
    return Intl.message(
      'Is this number correct\nor do you want to modify the number?',
      name: 'alertDescription',
      desc: '',
      args: [],
    );
  }

  /// `  Login  `
  String get Login {
    return Intl.message(
      '  Login  ',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get SignUp {
    return Intl.message(
      'SignUp',
      name: 'SignUp',
      desc: '',
      args: [],
    );
  }

  /// `forgot password ?`
  String get forgotPassword {
    return Intl.message(
      'forgot password ?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get SelectLanguage {
    return Intl.message(
      'Select Language',
      name: 'SelectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Activate your Account`
  String get codeTitle {
    return Intl.message(
      'Activate your Account',
      name: 'codeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code sent to your number:\n`
  String get codeAsk {
    return Intl.message(
      'Enter the code sent to your number:\n',
      name: 'codeAsk',
      desc: '',
      args: [],
    );
  }

  /// `Edit number`
  String get editNumber {
    return Intl.message(
      'Edit number',
      name: 'editNumber',
      desc: '',
      args: [],
    );
  }

  /// `Request a new code`
  String get requestNew {
    return Intl.message(
      'Request a new code',
      name: 'requestNew',
      desc: '',
      args: [],
    );
  }

  /// `You can request a new code within`
  String get requestTime {
    return Intl.message(
      'You can request a new code within',
      name: 'requestTime',
      desc: '',
      args: [],
    );
  }

  /// `Send the message again`
  String get sendAgain {
    return Intl.message(
      'Send the message again',
      name: 'sendAgain',
      desc: '',
      args: [],
    );
  }

  /// `               Call me               `
  String get callMe {
    return Intl.message(
      '               Call me               ',
      name: 'callMe',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
