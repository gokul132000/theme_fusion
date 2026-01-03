import 'package:flutter/material.dart';
import 'theme_manager.dart';

extension ThemeColorExtension on String {
  Color get tc => themeFusion.getColor(this);
}