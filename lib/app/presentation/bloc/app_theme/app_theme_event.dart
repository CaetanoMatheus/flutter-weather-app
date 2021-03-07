part of 'app_theme_bloc.dart';

@immutable
abstract class AppThemeEvent {}

class ChangeTheme extends AppThemeEvent {
  final AppThemeMode theme;

  ChangeTheme(this.theme);
}
