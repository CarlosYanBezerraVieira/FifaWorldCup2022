import 'package:fwc_album_app/app/core/mvp/fwc_presenter.dart';
import 'package:fwc_album_app/app/pages/auth/login/view/login_view.dart';

abstract interface class LoginPresenter implements FwcPresenter<LoginView> {
Future<void>login({required String email, required String password});
}