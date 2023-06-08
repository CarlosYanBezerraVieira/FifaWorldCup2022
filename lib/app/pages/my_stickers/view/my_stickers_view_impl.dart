import 'package:flutter/widgets.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/core/ui/helpers/messager.dart';
import 'package:fwc_album_app/app/models/group_stickers.dart';
import 'package:fwc_album_app/app/pages/my_stickers/my_stickers_page.dart';

import '../../../core/enum/sticker_status_enum.dart';
import 'my_stickers_view.dart';

abstract class MyStickersViewImpl extends State<MyStickersPage>
    with Loader, Messager
    implements MyStickersView {
  var album = <GroupStickers>[];
  StatusFilterEnum statusFilter = StatusFilterEnum.all;
  var countries = <String, String>{};

  @override
  void initState() {
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showLoader();
      widget.presenter.getMyAlbum();
    });

    super.initState();
  }

  @override
  void error(String message) {
    showError(message: message);
  }

  @override
  void loadedPage(List<GroupStickers> album) {
    hideLoader();
    setState(() {
      this.album = album;

      countries = {
        for (var country in album) country.countryCode: country.countryName
      };
    });
  }

  @override
  void updateStatusFilter(StatusFilterEnum status) {
    setState(() {
      statusFilter = status;
    });
  }

  @override
  void updateAlbum(List<GroupStickers> album) {
    hideLoader();
    setState(() {
      this.album = album;
    });
  }
}
