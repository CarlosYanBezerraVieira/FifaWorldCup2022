import 'package:flutter/widgets.dart';
import 'package:fwc_album_app/app/core/routes/routes_app.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/core/ui/helpers/messager.dart';
import 'package:fwc_album_app/app/models/user_model.dart';

import '../home_page.dart';
import 'home_view.dart';

abstract class HomeViewImpl extends State<HomePage>
    with Loader, Messager
    implements HomeView {
  UserModel? user;

  @override
  void initState() {
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.presenter.getUserData();
    });
    super.initState();
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message: message);
  }

  @override
  void logoutSucess() {
    hideLoader();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(context.routes.login, (route) => false);
  }

  @override
  void updateUser(UserModel user) {
    hideLoader();
    setState(() {
      this.user = user;
    });
  }
}
