import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

enum Language { english, arabic }

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(Locale('en'));

  void selectLanguage(Language language) {
    switch (language) {
      case Language.english:
        print('Selected English');
        emit(const Locale('en'));
        break;
      case Language.arabic:
        print('Selected Arabic');
        emit(const Locale('ar'));
        break;
    }
  }
}
