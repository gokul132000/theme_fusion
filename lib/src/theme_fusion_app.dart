import 'package:flutter/material.dart';
import 'theme_manager.dart';

/// Wrap your MaterialApp as [child]. No context needed.
/// Uses KeyedSubtree keyed by current theme to force a full subtree rebuild
/// when theme changes, so UI updates immediately at runtime.
class ThemeFusionApp extends StatelessWidget {
  final String initialTheme;
  final Color fallbackColor;
  final Map<String, Map<String, Color>> themes;
  final Widget child;

  const ThemeFusionApp({
    super.key,
    required this.initialTheme,
    required this.fallbackColor,
    required this.themes,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize global controller once
    initThemeFusion(
      initialTheme: initialTheme,
      themes: themes,
      fallbackColor: fallbackColor,
    );

    return AnimatedBuilder(
      animation: themeFusion,
      builder: (context, _) {
        return KeyedSubtree(
          key: ValueKey<String>(themeFusion.value),
          child: child,
        );
      },
    );
  }
}