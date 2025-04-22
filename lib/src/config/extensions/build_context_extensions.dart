part of 'extensions.dart';

extension BuildContextX on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }

  ThemeData get theme => Theme.of(this);
}
