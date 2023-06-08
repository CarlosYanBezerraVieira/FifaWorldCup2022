

import 'package:fwc_album_app/app/core/mvp/fwc_presenter.dart';

abstract interface class SplashPresenter implements FwcPresenter{
  Future<void> checkLogin();

}