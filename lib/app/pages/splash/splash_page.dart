import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/splash/presenter/splash_presenter.dart';
import 'package:fwc_album_app/app/pages/splash/view/splash_view_impl.dart';

class SplashPage extends StatefulWidget {

  final SplashPresenter presenter;

  const SplashPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends SplashViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.colors.primary,
        body: DecoratedBox(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/background_splash.png',
                  ))),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .08),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/images/fifa_logo.png',
                      height: MediaQuery.of(context).size.height * .25),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * .19),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Button(
                      onPressed: () {
                        widget.presenter.checkLogin();
                      },
                      width: MediaQuery.of(context).size.width * .9,
                      style: context.buttonStyles.yellowButton,
                      labelStyle: context
                          .textStyle.textSecondaryFontExtraBoldPrimaryColor,
                      label: 'Acessar'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/images/bandeiras.png'),
                ),
              ),
            ],
          ),
        ));
  }
}
