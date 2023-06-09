import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/core/ui/helpers/messager.dart';
import 'package:fwc_album_app/app/pages/sticker_detail/sticker_detail_page.dart';

import './sticker_detail_view.dart';

abstract class StickerDetailViewImpl extends State<StickerDetailPage>
    with Loader, Messager
    implements StickerDetailView {
  @override
  void initState() {
    widget.presente.view = this;
    super.initState();
  }
}
