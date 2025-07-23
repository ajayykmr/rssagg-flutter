# RSS Aggregator Flutter Application

This project is a Flutter-based mobile and web application designed to serve as a user-friendly frontend for an RSS feed aggregation service. It allows users to manage and view content from their favorite RSS feeds efficiently.

## ✨ Features

The application offers the following core functionalities:

  * **User Authentication:** Sign up, sign in with email/password, and guest login options.
  * **Feed Management:** Browse all available RSS feeds and create new feeds by providing a name and URL.
  * **Feed Following:** Follow and unfollow feeds to personalize your content stream.
  * **Post Viewing:** View aggregated posts from followed feeds, displaying title, description, and publication date.

## 📂 Project Structure

The project follows a standard Flutter architecture utilizing the BLoC pattern for state management. Key directories include:

  * `lib/`: Contains all the application's Dart source code.
      * `common/`: Reusable utilities (constants, HTTP helpers) and common UI widgets (app bars, text fields, loading indicators).
      * `features/`: Organized by core application features such as `auth` (authentication), `feeds` (feed management), and `posts` (post display). Each feature module contains its own BLoC, data providers, repositories, and UI components.
      * `models/`: Data models for feeds, posts, users, and feed follows.
      * `theme/`: Defines the application's visual style, including colors, text styles, and assets.
  * `assets/`: Stores static assets like SVG images.
  * `android/`, `ios/`, `linux/`, `macos/`, `windows/`: Platform-specific project files.
  * `pubspec.yaml`: Defines project dependencies and metadata.
  * `main.dart`: The main entry point of the Flutter application.

## 🚀 Getting Started

To set up and run this project on your local machine, follow these steps.

### Prerequisites

Ensure you have the following installed:

  * **Flutter SDK**: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)
  * **Dart SDK**: Included with Flutter.
  * **A Flutter-compatible IDE**:
      * [VS Code with Flutter extension](https://www.google.com/search?q=https://code.visualstudio.com/docs/languages/dart)
      * [Android Studio with Flutter plugin](https://developer.android.com/studio)
  * **Web Development**: A compatible web browser (e.g., Chrome, Edge) for web debugging. Ensure `flutter doctor` passes for web.
  * **Desktop Development (Linux, macOS, Windows)**: Necessary development tools for your specific desktop OS (e.g., Xcode for macOS, Visual Studio for Windows, GTK for Linux).

### Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/ajayykmr/rssagg-flutter.git
    cd rssagg-flutter
    ```

2.  **Fetch Flutter dependencies:**

    ```bash
    flutter pub get
    ```

3.  **Generate JSON serialization files:**
    This project uses `json_serializable` for data model serialization. Run the build runner to generate necessary files (`*.g.dart`):

    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

### Running the Application

After installation, you can run the application on your desired platform.

#### Web

To run the application in a web browser:

```bash
flutter run -d web-renderer
```

(You can replace `web-renderer` with a specific browser like `chrome` or `edge`, or simply run `flutter run` and select a device.)

#### Android / iOS

Connect an Android device or start an Android emulator, or connect an iOS device or start an iOS simulator, then execute:

```bash
flutter run
```

#### Desktop (Linux, macOS, Windows)

To run on a desktop platform, specify the target platform:

  * **Linux:**
    ```bash
    flutter run -d linux
    ```
  * **macOS:**
    ```bash
    flutter run -d macos
    ```
  * **Windows:**
    ```bash
    flutter run -d windows
    ```

## ⚙️ API Configuration

The application communicates with a backend API. The base URL for this API needs to be configured in `lib/common/utils/constants.dart`.

```dart
// Example: static const String BASE_URL = 'YOUR_API_ENDPOINT_HERE/v1';
// Update this BASE_URL to point to your specific API endpoint.
```

## 📦 Dependencies

Key dependencies used in this project, as listed in `pubspec.yaml`, include:

  * `flutter_bloc`: For implementing the BLoC pattern for state management.
  * `flutter_spinkit`: Provides customizable loading indicators for better UX.
  * `flutter_svg`: Enables rendering SVG assets within the Flutter application.
  * `json_annotation`: Facilitates compile-time generation of `fromJson` and `toJson` methods for data models.
  * `flutter_secure_storage`: For securely storing sensitive data like user tokens.
  * `url_launcher`: Used to open external URLs, such as post links, in the device's default browser or in-app browser.

Development dependencies like `build_runner` and `json_serializable` are used for code generation, and `flutter_lints` for enforcing best practices and code style.

-----

Feel free to contribute, report issues, or suggest improvements\!
