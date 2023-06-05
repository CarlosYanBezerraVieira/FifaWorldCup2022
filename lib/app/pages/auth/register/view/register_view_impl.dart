import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/core/ui/helpers/messager.dart';
import 'package:fwc_album_app/app/pages/auth/register/register_page.dart';

import './register_view.dart';

abstract class RegisterViewImpl extends State<RegisterPage> with Loader, Messager implements RegisterView {
 
 @override
  void initState() {
   widget.presenter.view = this;
    super.initState();
  }
  @override
  registerError([String? message]) {
    hideLoader();
    showError(message: message ?? 'Error ao registrar usuário'); 
  }

  @override
  registerSucess() {
    hideLoader();
    showSucess(message: "Usuário cadastrado com sucesso");
    Navigator.of(context).pop();
  }
  

}