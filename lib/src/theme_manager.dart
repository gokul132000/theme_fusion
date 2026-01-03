import 'package:flutter/material.dart';

class ThemeFusionController extends ValueNotifier<String> {
  Map<String, Map<String, Color>> _themes;
  final Color _fallbackColor;

  ThemeFusionController({
    required String initialTheme,
    required Map<String, Map<String, Color>> themes,
    required Color fallbackColor,
  })  : _themes = themes,
        _fallbackColor = fallbackColor,
        super(initialTheme);

  Color getColor(String key) {
    return _themes[value]?[key] ?? _fallbackColor;
  }

  void setTheme(String theme) {
    if (_themes.containsKey(theme)) {
      value = theme; // triggers listeners
    }
  }

  void updateThemes(Map<String, Map<String, Color>> themes) {
    _themes = themes;
    notifyListeners();
  }
}

// Singleton instance
ThemeFusionController? _instance;

ThemeFusionController get themeFusion {
  final inst = _instance;
  assert(inst != null, 'ThemeFusionApp must be mounted before using themeFusion.');
  return inst!;
}

// Initialize only once (survives hot reload)
void initThemeFusion({
  required String initialTheme,
  required Map<String, Map<String, Color>> themes,
  required Color fallbackColor,
}) {
  _instance ??= ThemeFusionController(
    initialTheme: initialTheme,
    themes: themes,
    fallbackColor: fallbackColor,
  );
}