import 'package:flutter/material.dart';
import 'theme_colors_base.dart';

late BaseThemeColors Function() _colorTheme;

final themeFusion = ThemeFusion._();

/// Generic getter to access full theme model
T themeFusionColor<T extends BaseThemeColors>() {
  final colors = _colorTheme();
  if (colors is T) return colors;
  throw Exception("themeFusionColor<T>() failed. Make sure you pass correct type T.");
}


class ThemeFusion<T extends BaseThemeColors> extends ChangeNotifier {
  ThemeFusion._();

  late T _light;
  late T _dark;
  bool _isDark = false;

  void init({required T light, required T dark, bool isDark = false}) {
    _light = light;
    _dark = dark;
    _isDark = isDark;
    _update();
  }

  void toggle() {
    _isDark = !_isDark;
    _update();
    notifyListeners();
  }

  void setLightMode() {
    _isDark = false;
    _update();
    notifyListeners();
  }

  void setDarkMode() {
    _isDark = true;
    _update();
    notifyListeners();
  }

  bool get isDark => _isDark;

  void _update() {
    _colorTheme = () => _isDark ? _dark : _light;
  }
}
