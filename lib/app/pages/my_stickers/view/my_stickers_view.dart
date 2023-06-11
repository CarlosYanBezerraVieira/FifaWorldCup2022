import 'package:fwc_album_app/app/core/enum/sticker_status_enum.dart';
import 'package:fwc_album_app/app/models/group_stickers.dart';

abstract interface class MyStickersView {
  void loadedPage(List<GroupStickers> album);
  void error(String message);
  void updateStatusFilter(StatusFilterEnum status);
  void updateAlbum(List<GroupStickers> album);
  void showLoader();
}
