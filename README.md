Chatty: A Real-Time Flutter Chat App

Hey everyone! I'm excited to share a project I've been working on: Chatty. It's a modern, real-time chat application I built using Flutter and Firebase. My goal was to create a seamless platform for instant communication, complete with secure logins, private messaging, and a clean, themeable interface.

What Can It Do?

· Secure Login: Sign up and log in safely using Firebase Authentication.
· Real-Time Messaging: Experience instant message delivery and updates—no need to refresh!
· Private Chats: Start one-on-one conversations with any other user on the platform.
· User Directory: Easily browse a list of all registered users to find someone to chat with.
· Light & Dark Themes: The app adapts to your preference, supporting both light and dark modes for a comfortable viewing experience.

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
