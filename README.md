# Flutter Firebase CRUD App

This repository contains a Flutter application that demonstrates CRUD (Create, Read, Update, Delete) operations using Firebase. Each CRUD operation is implemented in a separate file, and a menu page is provided to allow users to select the operation they want to perform.



## Features

- Menu: A navigation menu to select the desired operation.
- Create: Add new items to the Firebase database.
- Read: Retrieve and display items from the Firebase database.
- Update: Modify existing items in the Firebase database.
- Delete: Remove items from the Firebase database.


## UI
<img src="https://github.com/Sourav0174/Flutter-CRUD-app-using-firebase/assets/146104055/e6fdc979-e2ca-4cd8-af4f-a4ba30243ef6" width=250>
<img src="https://github.com/Sourav0174/Flutter-CRUD-app-using-firebase/assets/146104055/07878dab-6313-498b-b0d2-faf07314e834" width=250>
<img src="https://github.com/Sourav0174/Flutter-CRUD-app-using-firebase/assets/146104055/f42c47ac-8953-4750-ac2a-9abc1d7fafbe" width=250>
<img src="https://github.com/Sourav0174/Flutter-CRUD-app-using-firebase/assets/146104055/acc5d105-e552-4486-ab9c-1968bb3474eb" width=250>

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Firebase Account: [Create a Firebase project](https://firebase.google.com/)

### Installation

1. **Clone the repository:**

    ```sh
    [git clone https://github.com/yourusername/flutter-firebase-crud.git](https://github.com/Sourav0174/Flutter-CRUD-app-using-firebase.git)
    Flutter-CRUD-app-using-firebase
    ```

2. **Install dependencies:**

    ```sh
    flutter pub get
    ```

### Firebase Configuration

To run this project, you need to set up Firebase for both Android and iOS.

1. **Create a Firebase project:**

   - Go to the [Firebase Console](https://console.firebase.google.com/).
   - Click on `Add project` and follow the setup steps.

2. **Add Android app:**

   - Register your app with your project's package name (e.g., `com.example.flutterfirebasecrud`).
   - Download the `google-services.json` file.
   - Place the `google-services.json` file in the `android/app` directory.

3. **Add iOS app:**

   - Register your app with your project's iOS bundle ID.
   - Download the `GoogleService-Info.plist` file.
   - Place the `GoogleService-Info.plist` file in the `ios/Runner` directory.

4. **Firebase Options Dart File:**

   - Generate the `firebase_options.dart` file using the Firebase CLI or manually configure it.
   - Place the `firebase_options.dart` file in the `lib` directory.

### Ignored Configuration Files

The following configuration files are ignored in the repository for security reasons. You need to create these files in your project to run the app:

- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`
- `lib/firebase_options.dart`

## Usage

1. **Run the app:**

    ```sh
    flutter run
    ```

2. **Select Operation:**

    - The app will start on the menu page.
    - Select the CRUD operation you want to perform.


