# Mojoodi

**Mojoodi** is a cross-platform mobile app built with Flutter. It provides a lightweight, modular interface to manage sock products, handle user authentication, and engage in threaded interactions — all while saving user preferences locally.

## 🚀 Features

* **User Authentication**: Secure login, add new users, and profile management.
* **Product & Socks Catalog**: Define and view products; specialized model for socks with customizable attributes.
* **Search & Dialog Components**: Reusable search bar (`SearchWidget`) and flexible dialog widgets (`TextDialog`, `TextDialogSocks`).
* **Threaded Interaction**: View and participate in threaded conversations or logs.
* **Persistent Preferences**: Save settings and user-specific data via `SharedPreferences`.

## 🔧 Prerequisites

* **Flutter SDK** (version 3.0 or later)
* **Dart** (version 2.18 or later)
* **Android NDK** (version 27.0.12077973)
* A compatible IDE or editor (Android Studio, Xcode, or VS Code) with Flutter tooling installed

## 📥 Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/alirm628/mojoodi.git
   cd mojoodi
   ```
2. **Install dependencies**

   ```bash
   flutter pub get
   ```

## ▶️ Running the App

Launch on a connected device or emulator:

```bash
flutter run
```

Specify a target platform if needed:

```bash
flutter run -d chrome       # for web
dart run                   # for desktop
```

## 📁 Project Structure

```
lib/
├── main.dart               # Entry point: app initialization and route config
├── dimensions.dart         # Common spacing and size constants
├── modelbuilder.dart       # Dependency injection and model providers
├── user.dart               # User data model
├── curr_user.dart          # Current user session management
├── user_pref.dart          # SharedPreferences wrapper
├── product.dart            # Generic Product model
├── socks.dart              # Socks model extending Product
├── search_widget.dart      # Reusable search bar widget
├── text_dialog.dart        # Generic text input dialog
├── text_dialog_socks.dart  # Dialog for adding/editing socks
├── login.dart              # Login screen implementation
├── add_user.dart           # UI for creating a new user
├── manage_users.dart       # List/edit/delete user screen
├── access.dart             # Access control and permission utils
├── history.dart            # Display action history or audit logs
└── thread.dart             # Threaded conversation screen
```

## 🔍 Architecture Overview

* **Modular UI**: Each feature lives in its own widget or screen, making it easy to maintain and extend.
* **Model-Driven**: Core entities (`User`, `Product`, `Socks`) defined in plain Dart classes for clarity and type safety.
* **Dependency Injection**: `ModelBuilder` sets up singletons and service locators.
* **Persistent Storage**: Uses Flutter’s `SharedPreferences` API via `user_pref.dart` for lightweight data persistence.
* **Routing**: Named routes configured in `main.dart` for straightforward navigation.
