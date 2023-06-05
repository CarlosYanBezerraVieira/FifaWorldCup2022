import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/routes/routes_app.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/core/ui/helpers/messager.dart';
import 'package:fwc_album_app/app/pages/auth/login/login_page.dart';

import './login_view.dart';

abstract class LoginViewImpl extends State<LoginPage>
    with Loader, Messager
    implements LoginView {
  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message: message);
  }

  @override
  void sucess() {
    hideLoader();
    Navigator.of(context).pushNamedAndRemoveUntil(
      context.routes.home,
      (route) => false,
    );
  }
}
