

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class AppLocalization {

  Locale?locale;
  AppLocalization(this.locale);
  

static AppLocalization ?of(BuildContext context){
  return Localizations.of<AppLocalization>(context,AppLocalization);
}
static LocalizationsDelegate<AppLocalization>delegate = _AppLocalizationDelgate();
 late  Map<String, String> jsonStrings;
 Future loadLangJson()async{
String string = await rootBundle.loadString('assets/lang/${locale!.languageCode}.json');
Map<String,dynamic>jsons = json.decode(string);
jsonStrings = jsons.map((key,value){
return MapEntry(key, value.toString());
});
 }
String translate(String key)=>jsonStrings[key]??"";
}

class _AppLocalizationDelgate extends LocalizationsDelegate<AppLocalization>{
  @override
  bool isSupported(Locale locale) {
    return ['en','ar'].contains(locale.languageCode);
    
  }

  @override
  Future<AppLocalization> load(Locale locale)async {
    AppLocalization appLocalization = AppLocalization(locale);
    await appLocalization.loadLangJson();
    return appLocalization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>false;

}