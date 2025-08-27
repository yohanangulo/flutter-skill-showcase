# Flutter Skill Showcase

A modern Flutter application demonstrating clean architecture principles, development best practices, and advanced Flutter techniques. This project serves as a practical example of scalable app structure, maintainable code organization, and modern development patterns.

---

## Screenshots

|                                                  Sample                                                  |                                                Posts List                                                |                                                 Details                                                  |
| :------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------: |
| <img src="https://github.com/user-attachments/assets/bfa0432b-0099-4171-a143-26b76d963cc1" width="275"/> | <img src="https://github.com/user-attachments/assets/8f81aa9d-5912-4ae1-a2d8-26028b09f419" width="275"/> | <img src="https://github.com/user-attachments/assets/0c42960d-50b5-490b-b7c6-96a5400fa930" width="275"/> |

## Purpose

This project demonstrates Flutter and mobile development skills, focusing primarily on:

- **Clean Architecture**: Clear separation between domain, presentation, and infrastructure layers
- **Best Practices**: Modern development patterns and code quality
- **Technical Expertise**: Proficiency with key Flutter libraries and tools

## Key Features

✅ **Clean Architecture**: Domain, Presentation, Infrastructure layers  
✅ **State Management**: Flutter BloC pattern  
✅ **Local Database**: Drift (SQLite) for data persistence  
✅ **API Integration**: Retrofit with Dio for networking  
✅ **Dependency Injection**: Get It + Injectable  
✅ **Navigation**: Go Router for declarative routing  
✅ **Secure Storage**: Flutter Secure Storage for sensitive data  
✅ **Authentication**: Complete system with JWT tokens  
✅ **Logging**: Customizable logging system per environment  
✅ **Multi-Environment**: Development and production configurations

## Technologies & Packages

### 🏗️ Architecture & Patterns

- **get_it** - Service locator for dependency injection
- **injectable** - Automatic DI configuration generation
- **bloc / flutter_bloc** - State management pattern
- **dartz** - Functional programming (Either, Option)

### 🌐 Networking & API

- **dio** - Advanced HTTP client
- **retrofit** - Automatic API client generation
- **pretty_dio_logger** - HTTP request logging

### 💾 Persistence & Storage

- **drift** - Modern SQLite ORM
- **drift_flutter** - Drift integration with Flutter
- **flutter_secure_storage** - Secure token storage
- **path_provider** - System directory access

### 🧭 Navigation & UI

- **go_router** - Declarative routing
- **nested** - Organized nested widgets
- **cupertino_icons** - iOS style icons

### 🔧 Serialization & Code Generation

- **json_serializable** - Automatic JSON serialization
- **freezed** - Immutable data classes
- **build_runner** - Code generation runner

### 📊 Utils & Reactive Programming

- **rxdart** - Reactive extensions for Dart
- **logger** - Configurable logging system

## 🏗️ App Architecture

```mermaid
graph TD
    UI[UI Widget] --> |Events| BLoC[BLoC]
    BLoC --> |States| UI

    BLoC --> |Optional| UseCase[Use Cases]
    BLoC --> |Direct Access| Repository[Repository]
    UseCase --> Repository

    Repository --> API[API Service]
    Repository --> DB[Local Database]

    style UseCase stroke-dasharray: 5 5
```

## Project Structure

```
lib/
├── main_dev.dart              # Development entry point
├── main_prod.dart             # Production entry point
└── src/
    ├── config/                # Global configurations
    │   ├── service_locator/   # Dependency injection
    │   ├── router/            # Route configuration
    │   └── extensions/        # Utility extensions
    ├── core/                  # Core features
    │   ├── auth/              # Authentication (Domain, Application, Infrastructure)
    │   ├── post/              # Posts (Domain, Application, Infrastructure)
    │   └── secure_storage/    # Secure storage
    └── presentation/          # Presentation layer
        ├── common/            # Common widgets
        ├── core/              # Core BLoCs
        ├── global/            # Global state
        └── screens/           # App screens
            ├── auth/          # Authentication screens
            ├── posts/         # Posts screens
            ├── profile/       # Profile screen
            └── splash/        # Splash screen
```

## Prerequisites

- **Flutter SDK**: >=3.4.4
- **Dart SDK**: >=3.4.4
- **Android Studio** / **VS Code** with Flutter plugins
- **Git** for version control

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/yohanangulo/flutter-skill-showcase.git \
&& cd flutter_skill_showcase
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Generate code

```bash
make build
```

### 4. Environment setup

The project includes configurations for development and production:

- **Development**: `flutter run --flavor dev -t lib/main_dev.dart`
- **Production**: `flutter run --flavor prod -t lib/main_prod.dart`

## Usage

### Run the application

```bash
# Development mode
flutter run -t lib/main_dev.dart

# Production mode
flutter run -t lib/main_prod.dart
```

### Build for release

```bash
# Android
flutter build apk --flavor prod -t lib/main_prod.dart

# iOS
flutter build ios --flavor prod -t lib/main_prod.dart
```

### Run tests

```bash
flutter test
```

### Code Generation

When modifying models or services, regenerate code:

```bash
make build
```

## Implemented Features

### 🔐 Authentication System

- Sign in with email and password
- Secure JWT token storage
- Route guards for protected screens

### 📱 Posts Management

- Posts list with pagination
- Detailed post view
- Automatic API synchronization
- Local caching with Drift database
- Loading and error state handling

### 🏗️ Architecture

- Clear separation of concerns
- Configured dependency injection
- Centralized error handling

## Contributing

If you'd like to contribute to the project:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Open a Pull Request

### Code Standards

- Follow Dart/Flutter conventions
- Maintain test coverage > 80%
- Document public functions
- Use static analysis with `flutter analyze`

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact & Support

- **GitHub Issues**: For bug reports or feature requests
- **Email**: anguloyohan98@gmail.com
- **LinkedIn**: https://www.linkedin.com/in/yohan-angulo

---

⭐ If you found this project helpful, don't forget to give it a star!
