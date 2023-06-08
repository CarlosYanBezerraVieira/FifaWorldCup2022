import '../../../core/enum/sticker_status_enum.dart';
import '../../../core/mvp/fwc_presenter.dart';
import '../view/my_stickers_view.dart';

abstract interface class MyStickersPresenter
    implements FwcPresenter<MyStickersView> {
  Future<void> getMyAlbum();
  Future<void> statusFilter(StatusFilterEnum status);
  void countryFilter(List<String>? countries);
}
