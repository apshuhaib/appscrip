// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'theme_event.dart';
// part 'theme_state.dart';
// part 'theme_bloc.freezed.dart';

// class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
//   ThemeBloc() : super(ThemeState.initial()) {
//     on<ToggleTheme>((event, emit) {
//       emit(
//         state.themeMode == ThemeMode.light
//             ? const ThemeState(themeMode: ThemeMode.dark)
//             : const ThemeState(themeMode: ThemeMode.light),
//       );
//     });
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ToggleTheme>(_onToggleTheme);
    _loadThemeFromPreferences();
  }

  Future<void> _onToggleTheme(
      ToggleTheme event, Emitter<ThemeState> emit) async {
    final newThemeMode =
        state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await _saveThemeToPreferences(newThemeMode);
    emit(ThemeState(themeMode: newThemeMode));
  }

  Future<void> _loadThemeFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt('themeMode') ?? ThemeMode.light.index;
    final themeMode = ThemeMode.values[themeIndex];
    emit(ThemeState(themeMode: themeMode));
  }

  Future<void> _saveThemeToPreferences(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', themeMode.index);
  }
}
