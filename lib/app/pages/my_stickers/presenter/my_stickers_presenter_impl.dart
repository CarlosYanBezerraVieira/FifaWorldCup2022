import 'package:fwc_album_app/app/models/group_stickers.dart';
import 'package:fwc_album_app/app/pages/my_stickers/view/my_stickers_view.dart';
import 'package:fwc_album_app/app/repository/stickers/stickers_repository.dart';

import '../../../core/enum/sticker_status_enum.dart';
import 'my_stickers_presenter.dart';

class MyStickersPresenterImpl implements MyStickersPresenter {
  final StickersRepository stickersRepository;
  late final MyStickersView _view;

  var album = <GroupStickers>[];
  StatusFilterEnum statusSelected = StatusFilterEnum.all;

  List<String>? countries;

  MyStickersPresenterImpl({
    required this.stickersRepository,
  });

  @override
  Future<void> getMyAlbum() async {
    album = await stickersRepository.getMyAlbum();
    _view.loadedPage([...album]);
  }

  @override
  set view(MyStickersView view) => _view = view;

  @override
  Future<void> statusFilter(StatusFilterEnum status) async {
    statusSelected = status;
    _view.updateStatusFilter(status);
  }

  @override
  void countryFilter(List<String>? countries) {
    this.countries = countries;
    if (countries == null || countries.isEmpty) {
      _view.updateAlbum(album);
    } else {
      final albumFilter = [
        ...album.where((element) => countries.contains(element.countryCode))
      ];

      _view.updateAlbum(albumFilter);
    }
  }

  @override
  Future<void> refresh() async {
    _view.showLoader();
    await getMyAlbum();
    statusFilter(statusSelected);
    countryFilter(countries);
  }
}
