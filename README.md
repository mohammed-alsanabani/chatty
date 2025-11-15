# 💬 Chatty - Flutter & Firebase Chat App

A modern, real-time chat application built with Flutter and Firebase that enables seamless communication between users.

## ✨ Features

- 🔐 **Secure Authentication** - Firebase Authentication with email/password
- ⚡ **Real-time Messaging** - Instant message delivery using Firestore
- 👥 **One-on-One Chat** - Private conversations with other users
- 📱 **User Discovery** - Browse and search all registered users
- 🌙 **Theme Support** - Light and dark mode customization
- 🎨 **Beautiful UI** - Clean and intuitive user interface

## 🛠 Tech Stack

- **Flutter** - Cross-platform UI toolkit
- **Firebase Authentication** - User management and security
- **Cloud Firestore** - Real-time database
- **Provider** - State management

## 🚀 Getting Started

### Prerequisites

- Flutter SDK
- Firebase CLI
- Android Studio/VSCode

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/mohammed-alsanabani/chatty.git
   cd chatty
```

1. Install dependencies
   ```bash
   flutter pub get
   ```
2. Firebase Setup
   · Create a new Firebase project
   · Enable Authentication (Email/Password)
   · Create a Firestore database
   · Run configuration:
     ```bash
     flutterfire configure
     ```
3. Run the app
   ```bash
   flutter run
   ```

📱 Usage

1. Sign Up/Login - Create an account or login with existing credentials
2. Browse Users - View all registered users in the home screen
3. Start Chatting - Tap on any user to begin a conversation
4. Send Messages - Type and send messages in real-time
5. Toggle Theme - Switch between light and dark modes

🏗 Project Structure

```
lib/
├── main.dart                 # App entry point
├── services/
│   ├── auth/                 # Authentication services
│   │   ├── auth_service.dart
│   │   ├── auth_gate.dart
│   │   └── login_or_register.dart
│   └── chat/                 # Chat services
│       └── chat_service.dart
├── models/                   # Data models
│   └── message_model.dart
├── pages/                    # App screens
│   ├── home_page.dart
│   ├── chat_page.dart
│   ├── login_page.dart
│   ├── register_page.dart
│   └── settings_page.dart
├── components/               # Reusable widgets
│   ├── chat_bubble.dart
│   ├── my_button.dart
│   ├── my_drawer.dart
│   ├── text_form_field.dart
│   └── user_tile.dart
└── themes/                   # Theme management
    ├── light_mode.dart
    ├── dark_mode.dart
    └── theme_provider.dart
```

🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (git checkout -b feature/AmazingFeature)
3. Commit your changes (git commit -m 'Add some AmazingFeature')
4. Push to the branch (git push origin feature/AmazingFeature)
5. Open a Pull Request

---

Built with ❤️ by Mohammed Al-Sanabani
