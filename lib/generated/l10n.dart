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

  /// `Your trips`
  String get homeAppBar {
    return Intl.message(
      'Your trips',
      name: 'homeAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Your stats`
  String get statsAppBar {
    return Intl.message(
      'Your stats',
      name: 'statsAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Your memories`
  String get memoriesAppBar {
    return Intl.message(
      'Your memories',
      name: 'memoriesAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsAppBar {
    return Intl.message(
      'Settings',
      name: 'settingsAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Configure your trip`
  String get createAppBar {
    return Intl.message(
      'Configure your trip',
      name: 'createAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Total cost`
  String get totalCost {
    return Intl.message(
      'Total cost',
      name: 'totalCost',
      desc: '',
      args: [],
    );
  }

  /// `Costs specifically`
  String get costSpecifically {
    return Intl.message(
      'Costs specifically',
      name: 'costSpecifically',
      desc: '',
      args: [],
    );
  }

  /// `Select your currency`
  String get selectYourCurrency {
    return Intl.message(
      'Select your currency',
      name: 'selectYourCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Trip`
  String get trip {
    return Intl.message(
      'Trip',
      name: 'trip',
      desc: '',
      args: [],
    );
  }

  /// `Budget`
  String get budget {
    return Intl.message(
      'Budget',
      name: 'budget',
      desc: '',
      args: [],
    );
  }

  /// `Trip name`
  String get tripName {
    return Intl.message(
      'Trip name',
      name: 'tripName',
      desc: '',
      args: [],
    );
  }

  /// `Transport cost`
  String get transportCost {
    return Intl.message(
      'Transport cost',
      name: 'transportCost',
      desc: '',
      args: [],
    );
  }

  /// `Accommodation cost`
  String get accommodationCost {
    return Intl.message(
      'Accommodation cost',
      name: 'accommodationCost',
      desc: '',
      args: [],
    );
  }

  /// `Other cost`
  String get otherCost {
    return Intl.message(
      'Other cost',
      name: 'otherCost',
      desc: '',
      args: [],
    );
  }

  /// `Upload a photo`
  String get uploadPhoto {
    return Intl.message(
      'Upload a photo',
      name: 'uploadPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Insert the title`
  String get insertTitle {
    return Intl.message(
      'Insert the title',
      name: 'insertTitle',
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

  /// `My stats`
  String get statsNavbar {
    return Intl.message(
      'My stats',
      name: 'statsNavbar',
      desc: '',
      args: [],
    );
  }

  /// `Memories`
  String get memoriesNavbar {
    return Intl.message(
      'Memories',
      name: 'memoriesNavbar',
      desc: '',
      args: [],
    );
  }

  /// `Change your language`
  String get chageLeanguages {
    return Intl.message(
      'Change your language',
      name: 'chageLeanguages',
      desc: '',
      args: [],
    );
  }

  /// `More expensive trip`
  String get moreExpensive {
    return Intl.message(
      'More expensive trip',
      name: 'moreExpensive',
      desc: '',
      args: [],
    );
  }

  /// `Less expensive trip`
  String get lessExpensive {
    return Intl.message(
      'Less expensive trip',
      name: 'lessExpensive',
      desc: '',
      args: [],
    );
  }

  /// `Add a trip for more statistics`
  String get addTrip {
    return Intl.message(
      'Add a trip for more statistics',
      name: 'addTrip',
      desc: '',
      args: [],
    );
  }

  /// `No image added to trips`
  String get addMemories {
    return Intl.message(
      'No image added to trips',
      name: 'addMemories',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Only png,jpg,jpeg formats are accepted`
  String get formatImage {
    return Intl.message(
      'Only png,jpg,jpeg formats are accepted',
      name: 'formatImage',
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
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'zh'),
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
