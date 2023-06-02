import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

mixin Messager<T extends StatefulWidget> on State<T> {
  showError({required String message}) {
    showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
          backgroundColor: context.colors.primary,
        ));
  }

  showInfor({required String message}) {
    showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          message: message,
        ));
  }

  showSucess({required String message}) {
    showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message: message,
        ));
  }
}
