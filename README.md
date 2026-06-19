# LingoBreeze Dictionary
//My Flutter Development Intern Assignmnet//
LingoBreeze Dictionary is a Flutter-based application that fetches vocabulary data from a Node.js API and stores saved words in Firebase Firestore.

## Features

* Fetch vocabulary words from a Node.js REST API
* Save words to Firebase Firestore
* View saved vocabulary words anytime
* State management using Riverpod.

### Frontend
* Flutter
* Riverpod
* Dio

### Backend
* Node.js
* Express.js

### Database
* Firebase Firestore

## 📸 Screenshots

Add screenshots of the following screens:

* Home Screen ![alt text](snapshots/Image1.jpeg)
* Saved Vocabulary Screen ![alt text](snapshots/Image2.jpeg)
* Add Word Screen ![alt text](snapshots/Image3.jpeg)
* Loading State  ![alt text](snapshots/Image4.jpeg)
* Error State ![alt text](snapshots/Image5.jpeg)
* Firebase Integration ![alt text](snapshots/image-6.png)
* Backend running Locally ![alt text](snapshots/image-7.png)

---

## 📂 Project Structure

```text
lib/
├── core/
├── features/
│   └── vocabulary/
│       ├── data/
│       ├── domain/
│       └── presentation/
└── shared/

backend/
├── src/
│   ├── routes/
│   ├── controllers/
│   └── data/
```

---

## 🔥 Firebase Setup

1. Create a Firebase project.
2. Register an Android application using:
3. Download the `google-services.json` file.
4. Place it inside:

```text
flutter-app/android/app/google-services.json
```
5. Create a Firestore Database.
6. Start Firestore in Test Mode for development.

---

## How to Run the Project

### Step 1: Clone the Repository

```bash
git clone <your-repository-url>
cd LingoBreeze
```
---
### Step 2: Start the Backend Server

Navigate to the backend folder:

```bash
cd backend
```

Install dependencies:

```bash
npm install
```

Start the server:

```bash
npm start
```

The API will be available at:

```text
http://localhost:3000/api/words
```

You can verify it by opening the URL in a browser.

---

### Step 3: Configure the API URL

Update your Flutter configuration file with your local machine IP address:

```dart
class AppConfig {
  static const String baseUrl = 'http://YOUR_LOCAL_IP:3000/api';
}
```

Example:

```dart
class AppConfig {
  static const String baseUrl = 'http://192.168.1.5:3000/api';
}
```

This is required when running the app on a physical Android device.

---

### Step 4: Run the Flutter Application
 
Navigate to the Flutter project:

```bash
cd flutter-app
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

Tips: 1. Make sure an Android device or emulator is connected before running the application.
 2.You can connect wirelessly with QR Code scan from Andriod Studio, make sure your PC and Phone are connected to the same WiFi. 
 3. You can enable USB debugging from Developer option in your phone, and connect your PC and Phone with an USB cable, check for devices and then start the flutter application, it will run on your phone in degub mode.
========================================================
Built as part of a Flutter internship assessment project.
Thank You for reading.
========================================================