<h1 align="center">
  Theme Fusion
  <br>
</h1>

<h4 align="center">
  Real-time dynamic Flutter theme switching (Light, Dark, Multi-color) — fully runtime-based with minimal boilerplate.
</h4>

<p align="center">
  <a href="https://pub.dev/packages/theme_fusion">
    <img src="https://img.shields.io/pub/v/theme_fusion" alt="Pub Version">
  </a>
  <a href="https://github.com/Gokul132000/theme_fusion">
    <img src="https://img.shields.io/badge/github-gokul132000/theme__fusion-blue?logo=github" alt="GitHub Repo">
  </a>
  <a href="https://www.buymeacoffee.com/Gokul132000">
    <img src="https://img.shields.io/badge/$-donate-ff69b4.svg?style=flat" alt="Donate">
  </a>
</p>

<p align="center">
  <a href="#key-features">Key Features</a> •
  <a href="#installation">Installation</a> •
  <a href="#usage">Usage</a> •
  <a href="#important-rules">Important Rules</a> •
  <a href="#license">License</a>
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/Gokul132000/theme_fusion/main/assets/theme_fusion_demo.gif" alt="ThemeFusion Demo" />
</p>


---

## 🚀 Key Features

- 🔁 **True runtime theme switching** (no rebuild hacks)
- 🎨 **Unlimited dynamic themes** (not limited to light/dark)
- 🧠 **Semantic color keys** (`'primary'`, `'text'`, `'background'`)
- 🧊 **No ThemeData dependency for colors**
- 📦 Works on **Android, iOS, Web, Desktop**
- ⚡ Minimal & predictable API

---

## 📦 Installation

Add to `pubspec.yaml`:

```yaml
dependencies:
  theme_fusion: ^2.0.0
````

```bash
flutter pub get
```

---

## 🧩 Usage (v2.0.0 – Dynamic Theme Model)

### 1️⃣ Wrap your app with `ThemeFusionApp`

```dart
void main() {
  runApp(const ThemeFusionExample());
}

class ThemeFusionExample extends StatelessWidget {
  const ThemeFusionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeFusionApp(
      initialTheme: 'light',
      fallbackColor: Colors.black,
      themes: _themes,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        // ⚠️ ThemeData is STATIC only
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          dividerColor: Colors.grey.shade300,
        ),

        home: const MyHome(),
      ),
    );
  }
}
```

---

### 2️⃣ Define themes using semantic keys

```dart
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
```

---

### 3️⃣ Use dynamic colors **directly inside widgets**

```dart
Scaffold(
  backgroundColor: 'background'.tc,
  appBar: AppBar(
    backgroundColor: 'primary'.tc,
    title: Text(
      'Theme Fusion',
      style: TextStyle(color: 'text'.tc),
    ),
  ),
);
```

✅ `.tc` automatically rebuilds when the theme changes
❌ Do NOT store `.tc` in variables expecting reactivity

---

### 4️⃣ Switch themes dynamically

```dart
themeFusion.setTheme('light');
themeFusion.setTheme('dark');
themeFusion.setTheme('warm');
```

✔ No light/dark limitation
✔ Unlimited custom themes
✔ Instant UI update

---

## ⚠️ Important Rules (Read This)

### ❌ Do NOT use `.tc` inside `ThemeData`

```dart
// ❌ WRONG — dynamic colors inside static ThemeData
theme: ThemeData(
  scaffoldBackgroundColor: 'background'.tc,
  dividerColor: 'primary'.tc,
);
```

**Reason:**

* `ThemeData` is created once
* `.tc` is runtime-based
* Dynamic updates will NOT apply

---

### ✅ Correct Responsibility Split

| Layer         | Purpose                                         |
| ------------- | ----------------------------------------------- |
| `ThemeData`   | Static base styles (divider, radius, elevation) |
| `ThemeFusion` | All runtime colors                              |
| `.tc`         | Use ONLY inside widgets                         |

---

### ✅ This is perfectly fine

```dart
theme: ThemeData(
  dividerColor: Colors.grey.shade300,
  scaffoldBackgroundColor: Colors.white,
);
```

```dart
Divider(color: 'primary'.tc);
```

---

## 🧠 Version Difference

### v1.0.0

* Light / Dark only
* Theme-based toggling
* Limited flexibility

### v2.0.0 (Current)

* Fully dynamic themes
* Unlimited theme keys
* No `isDark`, no `toggle`
* Runtime-safe color resolution

## 📜 License

MIT License
See [`LICENSE`](LICENSE) for details.