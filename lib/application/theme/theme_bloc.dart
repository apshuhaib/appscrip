import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ToggleTheme>((event, emit) {
      emit(
        state.themeMode == ThemeMode.light
            ? const ThemeState(themeMode: ThemeMode.dark)
            : const ThemeState(themeMode: ThemeMode.light),
      );
    });
  }
}
