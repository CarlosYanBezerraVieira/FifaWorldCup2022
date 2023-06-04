import 'package:flutter/material.dart';

class RoutesApp {
  static RoutesApp? _instance;
  // Avoid self isntance
  RoutesApp._();
  static RoutesApp get i {
    _instance ??= RoutesApp._();
    return _instance!;
  }

  String get splashPage => "/";
  String get login => "/auth/login";
  String get home => "/home";
}

extension RoutesAppExtension on BuildContext {
  RoutesApp get routes => RoutesApp.i;
}
