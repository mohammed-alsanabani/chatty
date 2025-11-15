# Chatty: A Real-Time Flutter & Firebase Chat Application
**Author**: Mohammed Al-Sanabani

## Project Overview
Chatty is a modern, real-time chat application built with Flutter and Firebase. It provides a seamless platform for users to connect and communicate instantly, featuring robust authentication, one-on-one messaging, and a dynamic user interface with theme support.

## Features
*   **User Authentication**: Secure sign-up, sign-in, and sign-out functionalities powered by Firebase Authentication.
*   **Real-Time Messaging**: Instant message delivery and updates using Firebase Firestore.
*   **One-on-One Chat**: Engage in private conversations with other registered users.
*   **User Listing**: Easily browse and select from a list of all available users to start a chat.
*   **Theming**: Support for both dark and light modes to personalize the user experience.

## Technology Stack
*   **Flutter**: A UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
*   **Firebase Authentication**: Provides backend services for authenticating users.
*   **Firebase Firestore**: A flexible, scalable NoSQL cloud database for storing and syncing data in real-time.
*   **Provider**: A state management solution for Flutter, used for dependency injection and managing application state like themes.

## Installation & Setup

Follow these steps to get Chatty up and running on your local machine.

### Prerequisites
Before you begin, ensure you have the following installed:
*   **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)
*   **Firebase CLI**: [Install Firebase CLI](https://firebase.google.com/docs/cli#install_the_firebase_cli)

### Steps

1.  **Clone the Repository**:
    ```bash
    git clone https://github.com/alsanabani4/chatty.git
    cd chatty
    ``
2.  **Install Dependencies**:
    Navigate to the `chatty/` directory (where `pubspec.yaml` is located) and run:
    ```bash
    flutter pub get
    ```

3.  **Firebase Project Setup**:
    Chatty uses Firebase for authentication and database services. You need to set up your own Firebase project:

    a.  **Create a New Firebase Project**:
        *   Go to the [Firebase Console](https://console.firebase.google.com/).
        *   Click "Add project" and follow the on-screen instructions to create a new project.

    b.  **Enable Firebase Services**:
        *   In your Firebase project, navigate to **Build > Authentication** and enable **Email/Password** sign-in method.
        *   Navigate to **Build > Firestore Database** and create a new database. Choose "Start in production mode" or "Start in test mode" (production mode is recommended for security, but test mode is easier for initial setup).

    c.  **Add Firebase Configuration for Flutter**:
        *   From the root of your project directory (`chatty/`), run the following command to configure Firebase for your Flutter app. Make sure you are logged in to Firebase CLI (`firebase login`).
        ```bash
        flutterfire configure
        ```
        Follow the prompts to select your Firebase project and the platforms you want to set up (iOS, Android, Web, etc.). This command will generate a `lib/firebase_options.dart` file.

    d.  **Verify `firebase_options.dart`**:
        Ensure that the `lib/firebase_options.dart` file has been correctly generated in your project. This file contains your Firebase project's configuration.

4.  **Run the Application**:
    After setting up Firebase, you can run the application:
    ```bash
    flutter run
    ```
    Choose your desired device (emulator or physical device).

## Usage

1.  **Register/Login**: Upon launching the app, you will be prompted to either register for a new account or log in with existing credentials.
2.  **View Users**: After logging in, you will see a list of all registered users.
3.  **Start Chat**: Tap on any user from the list to open a one-on-one chat screen.
4.  **Send Messages**: Type your message in the input field and hit send. Messages will appear in real-time.
5.  **Toggle Theme**: (If implemented through a settings page or drawer) You can switch between light and dark modes.

## File Structure & Architecture

The project is organized into logical directories to ensure maintainability and scalability:

*   `lib/main.dart`: The entry point of the Flutter application. It initializes Firebase, sets up the `ThemeProvider` for theme management, and uses `AuthGate` to handle initial routing based on authentication status.
*   `lib/services/auth/`: Contains `auth_service.dart`, which encapsulates all Firebase Authentication logic (sign-in, sign-up, sign-out, get current user). It also includes `auth_gate.dart` for routing authenticated/unauthenticated users and `login_or_register.dart` for switching between login and registration UI.
*   `lib/services/chat/`: Houses `chat_service.dart`, responsible for all real-time chat functionalities, including fetching user lists, sending messages, and retrieving message streams from Firestore.
*   `lib/models/`: Defines data models, such as `message_model.dart`, which represents the structure of a chat message.
*   `lib/pages/`: Contains the UI for different screens like `home_page.dart` (user list), `chat_page.dart` (individual chat screen), `login_page.dart`, `register_page.dart`, and `settings_page.dart`.
*   `lib/components/`: Reusable UI widgets like `chat_bubble.dart`, `my_button.dart`, `my_drawer.dart`, `text_form_field.dart`, and `user_tile.dart`.
*   `lib/themes/`: Manages the application's themes, including `light_mode.dart`, `dark_mode.dart`, and `theme_provider.dart` for theme switching logic.

## Contribution

Contributions are welcome! If you'd like to contribute, please follow these steps:

1.  Fork the repository.
2.  Create a new branch (`git checkout -b feature/your-feature-name`).
3.  Make your changes.
4.  Commit your changes (`git commit -m 'feat: Add new feature'`).
5.  Push to the branch (`git push origin feature/your-feature-name`).
6.  Open a Pull Request.

Please ensure your code adheres to the existing coding style and includes appropriate tests.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.
