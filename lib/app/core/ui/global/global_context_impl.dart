import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/routes/routes_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';

import 'package:fwc_album_app/app/repository/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import './global_context.dart';

class GlobalContextImpl implements GlobalContext {
  final GlobalKey<NavigatorState> navigatorKey;
  final AuthRepository authRepository;
  GlobalContextImpl({
    required this.navigatorKey,
    required this.authRepository,
  });
  @override
  Future<void> loginExpire() async {
    final sp = await SharedPreferences.getInstance();
    sp.clear();
    showTopSnackBar(
      
      navigatorKey.currentState!.overlay ??
          // ignore: use_build_context_synchronously
          Overlay.of(navigatorKey.currentState!.context),
       CustomSnackBar.error(
        message: 'Login Expirado',
        backgroundColor: ColorsApp.i.primary,
      ),
    );
    navigatorKey.currentState!

        .pushNamedAndRemoveUntil(RoutesApp.i.login, (route) => false);
  }
}
