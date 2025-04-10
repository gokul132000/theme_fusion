import 'package:flutter/material.dart';
import 'package:theme_fusion/theme_fusion.dart';

/// Step 1: Define your custom theme class
class AppTheme extends BaseThemeColors {
  @override
  final Color primary;
  @override
  final Color background;
  @override
  final Color text;
/// Add your own custom color properties here if needed
  final Color divider;
  final Color button;

  const AppTheme({
    required this.primary,
    required this.background,
    required this.text,
    required this.divider,
    required this.button,
  });
}

/// Step 2: Light and Dark Theme Colors
const lightTheme = AppTheme(
  primary: Color(0xFF1F1F1F),
  background: Color(0xFFFFFFFF),
  text: Color(0xFF1A1A1A),
  divider: Color(0xFF2C2C2C),
  button: Color(0xFF1F1F1F),
);

const darkTheme = AppTheme(
  primary: Color(0xFF1F1F1F),
  background: Color(0xFF121212),
  text: Color(0xFFECECEC),
  divider: Color(0xFFE0E0E0),
  button: Color(0xFFCCCCCC),
);

/// Step 3: Entry Point
void main() {
  runApp(
    ThemeFusionApp<AppTheme>(
      light: lightTheme,
      dark: darkTheme,
      isDark: true, ///set initial theme mode
      builder: (context) => MyApp(), /// don't use const here builder method
    ),
  );
}

/// Step 4: Global theme access
AppTheme get theme => themeFusionColor<AppTheme>();
bool get isDarkTheme => themeFusion.isDark;
final themeToggle = themeFusion.toggle;
final setLightTheme = themeFusion.setLightMode;
final setDarkTheme = themeFusion.setDarkMode;

/// Step 5: App UI
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: theme.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: theme.primary,
          brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: theme.background,
          titleTextStyle: TextStyle(color: theme.text, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: theme.background,
        appBar: AppBar(
          title: const Text('Theme Fusion'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Switch(
                value: isDarkTheme,
                onChanged: (_) => themeToggle(),
                activeColor: theme.primary,
                inactiveThumbColor: theme.divider,
                activeTrackColor: theme.divider.withOpacity(0.4),
                inactiveTrackColor: theme.divider.withOpacity(0.3),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Current Mode: ${isDarkTheme ? "Dark" : "Light"}",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: theme.text,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: setLightTheme,
                      icon: const Icon(Icons.light_mode),
                      label: const Text("Light Theme"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: theme.button,
                        side: BorderSide(color: theme.button),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: setDarkTheme,
                      icon: const Icon(Icons.dark_mode),
                      label: const Text("Dark Theme"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: theme.button,
                        side: BorderSide(color: theme.button),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
