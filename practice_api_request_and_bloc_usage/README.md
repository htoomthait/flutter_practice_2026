# practice_api_request_and_bloc_usage

To practice api request and bloc usage

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Architecture

UI (View)
↓
Bloc (ViewModel)
↓
Repository / Service
↓
API / DB


## Example Folder Structure

lib/
├── models/
│    └── user.dart
├── services/
│    └── api_service.dart
├── repositories/
│    └── user_repository.dart
├── bloc/
│    ├── user_bloc.dart
│    ├── user_event.dart
│    └── user_state.dart
├── screens/
│    └── user_screen.dart


## Reference

- Main video reference (link)[https://www.youtube.com/watch?v=ltLJ1AB-eww&list=LL]
- bloc pattern in MV VM service how it apply (link)[https://chatgpt.com/s/t_69ddb6e986788191997ebcdfba327bfe]
