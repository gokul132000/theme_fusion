## [1.0.0] - Initial Release

🎉 Features:
- Define your custom theme color model.
- Set light & dark mode themes.
- Use `ThemeFusionApp` to wrap `MaterialApp`.
- Toggle theme globally in real-time.
- Access theme using `themeFusionColor<T>()`.
- Supports persistent theme with `SharedPreferences`.
- Minimal boilerplate for seamless integration.

---

## [2.0.0] – Fully Dynamic Theme Engine

🎉 Features:
- Completely redesigned theme system (breaking change)
- Supports unlimited dynamic themes (Light, Dark, Custom, Brand-based)
- Themes defined using semantic color keys (`primary`, `text`, `background`, etc.)
- Access colors using string extensions:
  ```dart
  'primary'.tc
  'text'.tc
  'background'.tc