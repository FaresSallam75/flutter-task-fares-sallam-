import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:task/business_logic/state/theme_state.dart';
import 'package:task/constants/theme.dart';
import 'package:task/main.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit()
    : super(
        AppSettingsState(
          locale: const Locale('ar'),
          themeData: themeArabic,
          isDarkMode: false,
        ),
      ) {
    _initSettings();
  }

  Future<void> _initSettings() async {
    await myBox!.put("lang", "ar");
    await myBox!.put("isDark", false);

    emit(
      state.copyWith(
        locale: const Locale('ar'),
        themeData: themeArabic,
        isDarkMode: false,
      ),
    );
  }
}
