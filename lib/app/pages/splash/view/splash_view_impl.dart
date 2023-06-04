import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/routes/routes_app.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/pages/splash/splash_page.dart';

import './splash_view.dart';

abstract  class  SplashViewImpl  extends State<SplashPage> with Loader implements SplashView {

@override
  void initState() {
  widget.presenter.view = this;
    super.initState();
  }

  @override
  void logged(bool isLogged) {
    hideLoader();
    if(isLogged){
      Navigator.of(context).pushNamedAndRemoveUntil(context.routes.home, (route) => false,);
    }
    else{
        Navigator.of(context).pushNamedAndRemoveUntil(context.routes.login, (route) => false,);
    }
  }


}