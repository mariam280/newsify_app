# Newsify App

A Flutter-based news application that displays the latest articles from various categories such as business, health, and sports.

The app includes **user authentication using Firebase** and sends **local notifications** to alert users about newly added news articles.  
It follows the **MVVM architecture pattern** and uses **BLoC** for state management.  
The app uses **SharedPreferences** along with **Provider** to manage user login state across sessions.  
Users can save articles they’re interested in, which are stored in **Firebase Firestore** for cloud access.  
For dependency injection, it follows the **Singleton pattern** where applicable.

## 🚀 Features

- User login with Firebase Authentication
- Browse news by category
- Save favorite articles to Firebase Firestore
- Local notifications for new news items
- Save user login state using SharedPreferences + Provider
- Singleton-based dependency injection
- Clean architecture with MVVM
- State management using BLoC

## 🛠️ Technologies Used

- Flutter
- Firebase Authentication
- Firebase Firestore
- Local Notifications
- SharedPreferences
- Dio (for API requests)
- BLoC
- Provider (for state tracking)
- Singleton pattern (for dependency injection)
- MVVM Pattern
- Dart

## 🔗 Project Link

[GitHub Repository](https://github.com/mariam280/newsify_app)
