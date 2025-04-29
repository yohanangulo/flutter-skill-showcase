import 'package:flutter_skill_showcase/src/config/router/router.dart';

class AppNavigator {
  AppNavigator._();

  static void replaceToSignin() {
    router.replaceAll(Routes.signin.name);
  }

  static void replaceToPosts() {
    router.replaceAll(Routes.postsList.name);
  }

  static void navigateToPostDetails(String id, Object post) {
    router.navigateTo(
      Routes.postDetails.name,
      arguments: post,
      pathParameters: {'id': id},
    );
  }
}
