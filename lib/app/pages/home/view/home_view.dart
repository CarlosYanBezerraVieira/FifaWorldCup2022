import 'package:fwc_album_app/app/models/user_model.dart';

abstract interface class HomeView {
  void updateUser(UserModel user);
  void error(String message);
  void showLoader();
  void logoutSucess();
}