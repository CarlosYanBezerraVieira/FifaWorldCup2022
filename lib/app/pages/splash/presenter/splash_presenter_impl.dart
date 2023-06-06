import 'package:fwc_album_app/app/core/token/token_key.dart';
import 'package:fwc_album_app/app/pages/splash/view/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './splash_presenter.dart';

class SplashPresenterImpl implements SplashPresenter {
  late final SplashView _view;

  @override
  Future<void> checkLogin() async {
    _view.showLoader();
    await Future.delayed(const Duration(seconds: 2));
    final sp = await SharedPreferences.getInstance();
    final accessToken = sp.getString(TokenKey.key);
    _view.logged(accessToken != null);
  }

  @override
  set view(view) => _view = view;
}
