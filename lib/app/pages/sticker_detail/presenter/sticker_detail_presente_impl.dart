import 'package:fwc_album_app/app/pages/sticker_detail/view/sticker_detail_view.dart';

import 'sticker_detail_presente.dart';

class StickerDetailPresenteImpl implements StickerDetailPresente {
  late final StickerDetailView _view;
  @override
  set view(StickerDetailView view) => _view = view;
}
