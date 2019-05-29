import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:locletest/l10n/messages_all.dart';

class AppLocalizations{
  static AppLocalizations of(BuildContext context){
    return Localizations.of<AppLocalizations>(context , AppLocalizations);
  }
 static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

   String get locale{
    return Intl.message('en' , name:'locale');
  }

  String get pushedTheButton{
    return Intl.message('you have pushed the button this many times' , name:'pushedTheButton');
  }

//and add all the text you have inside the app that you need to make it in 
//arabic and english launguages 
}
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
     return ['en', 'ar'].contains(locale.languageCode);
  }
  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }
  @override
  bool shouldReload(AppLocalizationsDelegate old) {
  return false;
}

}