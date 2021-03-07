import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/app/presentation/theme/app_theme.dart';
import 'package:meta/meta.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc()
      : super(AppThemeState(AppTheme.appThemeData(AppThemeMode.Day)));

  @override
  Stream<AppThemeState> mapEventToState(
    AppThemeEvent event,
  ) async* {
    if (event is ChangeTheme) {
      yield AppThemeState(AppTheme.appThemeData(event.theme));
    }
  }
}
