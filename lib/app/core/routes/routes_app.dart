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
  String get register => "/auth/register";
  String get home => "/home";
  String get mySticker => "/my-sticker";
  String get stickerDetail => "/sticker-detail";
}

extension RoutesAppExtension on BuildContext {
  RoutesApp get routes => RoutesApp.i;
}
