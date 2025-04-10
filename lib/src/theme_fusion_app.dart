import 'package:flutter/material.dart';
import 'theme_fusion_core.dart';
import 'theme_colors_base.dart';

class ThemeFusionApp<T extends BaseThemeColors> extends StatefulWidget {
  final T light;
  final T dark;
  final bool isDark;
  final Widget Function(BuildContext context) builder;

  const ThemeFusionApp({
    super.key,
    required this.light,
    required this.dark,
    required this.builder,
    this.isDark = false,
  });

  @override
  State<ThemeFusionApp<T>> createState() => _ThemeFusionAppState<T>();
}

class _ThemeFusionAppState<T extends BaseThemeColors> extends State<ThemeFusionApp<T>> {
  @override
  void initState() {
    super.initState();
    themeFusion.init(
      light: widget.light,
      dark: widget.dark,
      isDark: widget.isDark,
    );
    themeFusion.addListener(_rebuild);
  }

  void _rebuild() => setState(() {});

  @override
  void dispose() {
    themeFusion.removeListener(_rebuild);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
