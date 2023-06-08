import 'package:fwc_album_app/app/core/mvp/fwc_presenter.dart';
import 'package:fwc_album_app/app/pages/home/view/home_view.dart';

abstract interface class HomePresenter implements FwcPresenter<HomeView>{
  Future<void>getUserData();
  Future<void>logout();
}