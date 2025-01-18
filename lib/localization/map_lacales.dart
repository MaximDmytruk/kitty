import 'package:flutter_localization/flutter_localization.dart';
import 'package:kitty/localization/app_locale.dart';

List<MapLocale> getMapLocales(){
  return [
         MapLocale(
          'en',
          AppLocale.EN,
        ),
        MapLocale(
          'ua',
          AppLocale.UA,
        ),
      ];
}