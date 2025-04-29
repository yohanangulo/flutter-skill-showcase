part of 'router.dart';

class Route {
  const Route({required this.name, required this.path});

  final String name;
  final String path;
}

abstract class Routes {
  static const splash = Route(name: 'splash', path: '/');
  static const signin = Route(name: 'signin', path: '/signin');
  static const postsList = Route(name: 'postsList', path: '/posts');
  static const profile = Route(name: 'profile', path: '/profile');
  static const postDetails = Route(name: 'postDetails', path: '/posts/:id');
}
