import 'package:flutter/cupertino.dart';

import 'en_us/en_us_translations.dart';

class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  String? translate(String key) {
    // Determine which translation class to use based on the locale
    final Map<String, String>? translations = _getTranslations();
    return translations?[key];
  }

  Map<String, String>? _getTranslations() {
    switch (locale.languageCode) {
      case 'en':
        return EnglishKeys.data;
      case 'ar':
        return ArabicKeys.data;
      default:
        return null; // Return null for unsupported languages
    }
  }
}
class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all supported locales here
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    return AppLocalization(locale);
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}


