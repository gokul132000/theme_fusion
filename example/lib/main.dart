import 'package:flutter/material.dart';
import 'package:theme_fusion/theme_fusion.dart';

void main() {
  runApp(const ThemeFusionExample());
}

/// Root widget for ThemeFusion demo
class ThemeFusionExample extends StatelessWidget {
  const ThemeFusionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeFusionApp(
      initialTheme: 'light',
      fallbackColor: Colors.black,
      themes: _themes,
      child: MaterialApp(
        theme: ThemeData( //want to override custom style
          useMaterial3: true,
          scaffoldBackgroundColor: 'background'.tc,
          colorScheme: ColorScheme.fromSeed(
            seedColor: 'primary'.tc,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: 'background'.tc,
            titleTextStyle: TextStyle(
                color: 'text'.tc,
                fontSize: 20, fontWeight: FontWeight.w600
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: MyHome(),
      ),
    );
  }
}

/// Theme definitions (semantic keys)
const Map<String, Map<String, Color>> _themes = {
  'light': {
    'primary': Colors.blue,
    'text': Colors.black,
    'background': Colors.white,
  },
  'dark': {
    'primary': Colors.deepPurple,
    'text': Colors.white,
    'background': Colors.black,
  },
  'warm': {
    'primary': Colors.orange,
    'text': Colors.black,
    'background': Colors.white60,
  },
};

/// Home screen
class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 'background'.tc,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: 'primary'.tc,
        centerTitle: true,
        title: Text(
          'ThemeFusion',
          style: TextStyle(
            color: 'text'.tc,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const _HomeContent(),
    );
  }
}

/// Main content
class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.palette_outlined,
            size: 64,
            color: 'primary'.tc,
          ),
          const SizedBox(height: 16),
          Text(
            'Dynamic Theme Switching',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: 'text'.tc,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Change the app appearance instantly\nusing ThemeFusion',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: 'text'.tc.withValues(alpha: 0.7),
              fontSize: 14,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 32),
          const _ThemeSelector(),
        ],
      ),
    );
  }
}

/// Theme selector card
class _ThemeSelector extends StatelessWidget {
  const _ThemeSelector();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: 'primary'.tc.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            'Select Theme',
            style: TextStyle(
              color: 'text'.tc,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _ThemeButton(
                label: 'Light',
                icon: Icons.light_mode_outlined,
                themeKey: 'light',
              ),
              _ThemeButton(
                label: 'Dark',
                icon: Icons.dark_mode_outlined,
                themeKey: 'dark',
              ),
              _ThemeButton(
                label: 'Warm',
                icon: Icons.color_lens_outlined,
                themeKey: 'warm',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Individual theme button
class _ThemeButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final String themeKey;

  const _ThemeButton({
    required this.label,
    required this.icon,
    required this.themeKey,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => themeFusion.setTheme(themeKey),
      child: Container(
        width: 90,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: 'background'.tc,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: 'primary'.tc),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: 'text'.tc,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
