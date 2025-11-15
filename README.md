```markdown
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
   git clone https://github.com/alsanabani4/chatty.git
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

```
What's Under the Hood?

To bring Chatty to life, I used this tech stack:

· Flutter: For building a beautiful, native-quality mobile app from a single codebase.
· Firebase Authentication: To handle all the user sign-in and security.
· Cloud Firestore: A powerful NoSQL database that makes real-time messaging possible.
· Provider: A simple yet effective state management solution for handling the app's theme and other data.

---

Want to Run It Yourself?

If you'd like to get a copy of Chatty running on your own machine, just follow these steps.

Before you start, make sure you have the Flutter SDK and Firebase CLI installed on your computer.

1. Get the Code:
   ```bash
   git clone https://github.com/alsanabani4/chatty.git
   cd chatty
   ```
2. Grab the Dependencies:
   Navigate to the project's root directory (where the pubspec.yaml file is) and run:
   ```bash
   flutter pub get
   ```
3. Set Up Firebase (This is the most important part):
   Since Chatty relies on Firebase, you'll need to connect it to your own Firebase project.
   · Create a Firebase Project:
     Head over to the Firebase Console and create a new project.
   · Enable Authentication & Firestore:
     Inside your project, go to "Authentication" and enable the "Email/Password" sign-in method. Then, go to "Firestore Database" and create a new database (you can start in test mode for simplicity).
   · Connect Your Flutter App:
     From the root of your chatty directory, run the command below. It will guide you through linking your app to the Firebase project you just created.
     ```bash
     flutterfire configure
     ```
     This will automatically generate a lib/firebase_options.dart file with all your configuration details.
4. Run the App!
   You're all set! Use the following command to launch Chatty on your emulator or connected device.
   ```bash
   flutter run
   ```

How to Use the App

Once it's running, it's pretty straightforward:

1. Start: Create a new account or log in.
2. Find a Friend: You'll be taken to a home screen listing all registered users.
3. Chat: Tap on a user's name to open a private chat with them.
4. Talk: Type a message and hit send—you'll see messages appear instantly.
5. Personalize: You can switch between light and dark mode from the settings.

A Quick Look at the Code

I've structured the project to be clean and easy to understand:

· lib/main.dart: The app's starting point. It initializes Firebase and sets up the theme.
· lib/services/: This folder contains the core logic.
  · auth/: Handles everything related to login, sign-up, and user sessions.
  · chat/: Manages fetching users, sending messages, and streaming chats in real-time.
· lib/pages/: Contains the different screens of the app (login, chat, user list, etc.).
· lib/components/: Home to reusable widgets like message bubbles and user tiles.
· lib/models/: Defines the data structures, like what a "Message" looks like.
· lib/themes/: Manages all the light and dark theme styling.

Contributions Welcome!

I'm always open to suggestions and improvements! If you have an idea or want to contribute, feel free to:

1. Fork the repository.
2. Create your feature branch (git checkout -b feature/AmazingFeature).
3. Commit your changes (git commit -m 'feat: Add some AmazingFeature').
4. Push to the branch (git push origin feature/AmazingFeature).
5. Open a Pull Request.
