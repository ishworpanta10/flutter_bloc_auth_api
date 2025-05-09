# Flutter Login App 🛂

A Flutter app demonstrating **JWT-based login/logout** using the **BLoC pattern**, with support for **token persistence** via `shared_preferences`.

---

## ✨ Features

- 🔒 JWT Token Authentication
- 💡 Login and Logout using `AuthenticationBloc` and `LoginBloc`
- 🔁 Persistent login across app restarts using local storage
- 🧱 Modular architecture (AuthenticationRepository, UserRepository)
- 📦 Internal packages for session management
- 🧪 Form validation using `formz`
- 🧼 Clean separation of UI, business logic, and data

---

## 🧩 Architecture Overview

```txt
main.dart
 └── App (MultiRepository + Bloc)
      └── AppView (Handles routing via AuthenticationBloc)
            ├── LoginPage (LoginBloc)
            └── HomePage

🔐 Session Management
Session persistence is handled via a custom internal package: session_manager.

JWT token is saved to SharedPreferences on successful login.

Token is read on app startup via AuthenticationRepository.

On logout, the token is removed and user is redirected to login screen.

